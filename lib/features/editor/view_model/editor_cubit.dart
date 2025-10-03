import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartcoder/features/editor/models/dsa_list_model.dart';
import 'package:dartcoder/services/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'editor_state.dart';

class EditorCubit extends Cubit<EditorState> {
  final FirebaseServices firebaseServices;

  EditorCubit({required this.firebaseServices}) : super(EditorInitial());

  DocumentSnapshot? lastItem;

  List<DsaListModel> dsaList = [];

  Future<void> fetchDSAList({
    int limit = 10,
  }) async {
    try {
      if (state is EditorLoading) {
        return;
      }
      emit(EditorLoading());
      final result = await firebaseServices.fetchDSA(
        limit: limit,
        startAfterDocument: lastItem,
      );
      if (result.error != null) {
        emit(EditorError(message: result.error!));
      } else {
        lastItem = result.lastDocument;
        if (result.documents != null) {
          dsaList = {...dsaList, ...?result.documents}.toList();
        }

        emit(DSAListLoaded());
      }
    } catch (e) {
      emit(EditorError(message: e.toString()));
    }
  }
}
