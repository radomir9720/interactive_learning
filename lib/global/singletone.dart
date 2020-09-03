import 'package:interactive_learning/global/data.dart';
import 'package:interactive_learning/global/http_service.dart';

class Singleton {
  static final Singleton _singleton = new Singleton._internal();
  Singleton._internal();
  static Singleton get instance => _singleton;
  HTTPService httpService;
  HiveData hiveData;
}
