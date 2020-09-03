import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_learning/global/models/post.dart';
import 'package:interactive_learning/global/singletone.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    add(HomeLoadPostsEvent());
  }
  final Singleton _sngltn = Singleton.instance;
  List<PostModel> posts;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLoadPostsEvent) {
      yield HomeLoadingPostsState();
      Response postsResponse =
          await _sngltn.httpService.getDataFromServer(additionalPath: '/posts');
      if (_sngltn.httpService.isSuccessResponse(postsResponse)) {
        Response photosResponse = await _sngltn.httpService
            .getDataFromServer(additionalPath: '/photos?albumId=1&albumId=2');
        posts = postsResponse.data
            .map((e) => PostModel.fromJson(e))
            .cast<PostModel>()
            .toList();
        if (_sngltn.httpService.isSuccessResponse(photosResponse)) {
          List.generate(
              posts.length,
              (index) =>
                  posts[index].photoUrl = photosResponse.data[index]['url']);
        } else {
          yield HomeLoadPostsErrorState();
        }

        yield HomeLoadedPostsState();
      } else {
        yield HomeLoadPostsErrorState();
      }
    }
  }
}
