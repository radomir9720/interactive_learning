import 'dart:io';

import 'package:hive/hive.dart';
import 'package:interactive_learning/global/constants.dart';
import 'package:interactive_learning/global/models/comment.dart';
import 'package:path_provider/path_provider.dart';

class HiveData {
  Box mainBox;
  Map<int, List<CommentModel>> comments;

  Directory appDocDir;

  Future<HiveData> initData() async {
    appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    mainBox = await Hive.openBox(kHiveMainBoxKey);

    // await mainBox.clear();

    comments = mainBox.toMap().map((key, value) => MapEntry(
            key,
            value
                .map((e) => CommentModel.fromJson(e))
                .cast<CommentModel>()
                .toList())) ??
        {};

    return this;
  }

  Future<void> addCommentToBox({dynamic key, dynamic value}) async {
    comments[key] = value
        .map((e) => CommentModel.fromJson(e))
        .cast<CommentModel>()
        .toList();
    await mainBox.put(key, value);
  }
}
