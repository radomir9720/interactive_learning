import 'package:dio/dio.dart';
import 'package:interactive_learning/global/constants.dart';

class HTTPService {
  String url = 'https://jsonplaceholder.typicode.com';

  final Dio dio = Dio();

  Future<Response> getDataFromServer(
      {Map<String, dynamic> queryParameters, String additionalPath}) async {
    return await dio.get(url + additionalPath,
        queryParameters: queryParameters);
  }

  Future<Response> sendDataToServer(Map data) async {
    Response response;
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: kRequestHeaders,
          validateStatus: (status) => true,
        ),
        data: data,
      );
    } catch (e) {
      response = Response(data: e);
    }

    return response;
  }

  String errorString(Response response) {
    return 'Что-то пошло не так. Ответ от сервера: \n' +
        response.data.toString();
  }

  bool isSuccessResponse(Response response) {
    return response.statusCode == 200;
  }
}
