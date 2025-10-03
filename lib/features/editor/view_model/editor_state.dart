part of 'editor_cubit.dart';

abstract class EditorState {}

class EditorInitial extends EditorState {}

class EditorLoading extends EditorState {}

class DSAListLoaded extends EditorState {
}

class EditorError extends EditorState {
  final String message;
  EditorError({required this.message});
}
