

import 'package:bloc_test/bloc_test.dart';
import 'package:dartcoder/features/editor/models/dsa_list_model.dart';
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
  });
}

class FirebaseFetchResult {
  final List<DsaListModel>? documents;
  final dynamic lastDocument;
  final String? error;
  FirebaseFetchResult({this.documents, this.lastDocument, this.error});
}
