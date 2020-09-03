import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:interactive_learning/global/data.dart';
import 'package:interactive_learning/global/models/comment.dart';
import 'package:interactive_learning/global/singletone.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  final Singleton _sngltn = Singleton.instance;

  Singleton get sngltn => _sngltn;

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostLoadCommentsEvent) {
      if (_sngltn.hiveData.comments.containsKey(event.postId)) {
        yield PostLoadedCommentsState(
            _sngltn.hiveData.comments[event.postId].cast<CommentModel>());
      } else {
        yield PostLoadingCommentsState();
        Response response = await _sngltn.httpService.getDataFromServer(
            additionalPath: '/posts/${event.postId}/comments');
        if (_sngltn.httpService.isSuccessResponse(response)) {
          await _sngltn.hiveData
              .addCommentToBox(key: event.postId, value: response.data);
          yield PostLoadedCommentsState(response.data
              .map((e) => CommentModel.fromJson(e))
              .cast<CommentModel>()
              .toList());
        } else {
          yield PostLoadCommentsErrorState();
        }
      }
    }
  }
}
