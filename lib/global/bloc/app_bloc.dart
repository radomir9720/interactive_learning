import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:interactive_learning/global/data.dart';
import 'package:interactive_learning/global/http_service.dart';
import 'package:interactive_learning/global/singletone.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());

  final Singleton _sngltn = Singleton.instance;

  Singleton get sngltn => _sngltn;

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppLoadInitialEvent) {
      _sngltn.httpService = HTTPService();
      _sngltn.hiveData = await HiveData().initData();
      yield AppLoadedInitialState();
    }
  }
}
