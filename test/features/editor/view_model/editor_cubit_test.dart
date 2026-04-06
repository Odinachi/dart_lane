import 'package:bloc_test/bloc_test.dart';
import 'package:dartcoder/features/editor/models/dsa_list_model.dart';
import 'package:dartcoder/features/editor/models/test_case.dart';
import 'package:dartcoder/features/editor/view_model/editor_cubit.dart';
import 'package:dartcoder/services/firebase_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class MockFirebaseServices extends Mock implements FirebaseServices {}

void main() {
  late EditorCubit editorCubit;
  late MockFirebaseServices mockFirebaseServices;


  setUp(() {
    mockFirebaseServices = MockFirebaseServices();
    editorCubit = EditorCubit(firebaseServices: mockFirebaseServices);
  });

  tearDown(() {
    editorCubit.close();
  });

  group('EditorCubit - fetchDSAList', () {
    final mockDsaList = [
      DsaListModel(id: '1', problemName: 'Binary Search'),
      DsaListModel(id: '2', problemName: 'Linked List'),
    ];

    test('initial state should be EditorInitial', () {
      expect(editorCubit.state, isA<EditorInitial>());
    });

    blocTest<EditorCubit, EditorState>(
      'emits [EditorLoading, DSAListLoaded] when data is fetched successfully',
      build: () {
        when(() => mockFirebaseServices.fetchDSA(
              limit: any(named: 'limit'),
              startAfterDocument: any(named: 'startAfterDocument'),
            )).thenAnswer((_) async => (
              documents: mockDsaList,
              error: null,
              lastDocument: null,
            ));
        return editorCubit;
      },
      act: (cubit) => cubit.fetchDSAList(),
      expect: () => [
        isA<EditorLoading>(),
        isA<DSAListLoaded>(),
      ],
    );

    blocTest<EditorCubit, EditorState>(
      'emits [EditorLoading, EditorError] when firebaseServices throws an error',
      build: () {
        when(() => mockFirebaseServices.fetchDSA(
              limit: any(named: 'limit'),
              startAfterDocument: any(named: 'startAfterDocument'),
            )).thenThrow(Exception('Network error'));
        return editorCubit;
      },
      act: (cubit) => cubit.fetchDSAList(),
      expect: () => [
        isA<EditorLoading>(),
        isA<EditorError>()
            .having((e) => e.message, 'message', contains('Network error')),
      ],
    );

    blocTest<EditorCubit, EditorState>(
      'refreshDSAList emits refreshing then loaded states',
      build: () {
        when(() => mockFirebaseServices.fetchDSA(
              limit: any(named: 'limit'),
              startAfterDocument: any(named: 'startAfterDocument'),
            )).thenAnswer((_) async => (
              documents: mockDsaList,
              error: null,
              lastDocument: null,
            ));
        return editorCubit;
      },
      act: (cubit) => cubit.refreshDSAList(),
      expect: () => [
        isA<DSAListLoaded>().having(
          (s) => s.isRefreshing,
          'isRefreshing',
          true,
        ),
        isA<DSAListLoaded>().having(
          (s) => s.isRefreshing,
          'isRefreshing',
          false,
        ),
      ],
    );

    blocTest<EditorCubit, EditorState>(
      'loadMoreDSAList emits loading-more then updated list when more data exists',
      build: () {
        final page = List.generate(
          10,
          (i) => DsaListModel(id: '$i', problemName: 'Problem $i'),
        );
        when(() => mockFirebaseServices.fetchDSA(
              limit: any(named: 'limit'),
              startAfterDocument: any(named: 'startAfterDocument'),
            )).thenAnswer((_) async => (
              documents: page,
              error: null,
              lastDocument: null,
            ));
        return editorCubit;
      },
      act: (cubit) async {
        await cubit.fetchDSAList();
        await cubit.loadMoreDSAList();
      },
      expect: () => [
        isA<EditorLoading>(),
        isA<DSAListLoaded>(),
        isA<DSAListLoaded>().having(
          (s) => s.isLoadingMore,
          'isLoadingMore',
          true,
        ),
        isA<DSAListLoaded>().having(
          (s) => s.isLoadingMore,
          'isLoadingMore',
          false,
        ),
      ],
    );

    blocTest<EditorCubit, EditorState>(
      'getProblemsForDSA emits [EditorLoadingProblems, EditorProblem] on success',
      build: () {
        final suite = TestSuite(
          question: 'Q',
          answer: 'A',
          functionName: 'fn',
          testCases: const [],
        );
        when(() => mockFirebaseServices.fetchDsaProblems(any()))
            .thenAnswer((_) async => (data: suite, error: null));
        return editorCubit;
      },
      act: (cubit) => cubit.getProblemsForDSA('dsa-1'),
      expect: () => [
        isA<EditorLoadingProblems>(),
        isA<EditorProblem>().having(
          (s) => s.problem?.question,
          'question',
          'Q',
        ),
      ],
    );

    blocTest<EditorCubit, EditorState>(
      'getProblemsForDSA emits [EditorLoadingProblems, EditorError] when service returns error',
      build: () {
        when(() => mockFirebaseServices.fetchDsaProblems(any())).thenAnswer(
          (_) async => (data: null, error: 'No problems found'),
        );
        return editorCubit;
      },
      act: (cubit) => cubit.getProblemsForDSA('missing'),
      expect: () => [
        isA<EditorLoadingProblems>(),
        isA<EditorError>().having(
          (e) => e.message,
          'message',
          'No problems found',
        ),
      ],
    );
  });
}
