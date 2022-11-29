import 'dart:io';

import 'package:dio/dio.dart';

String fixture(String name) => File('test/json/$name').readAsStringSync();

const path = "https://jsonplaceholder.typicode.com/todos/1";
final requestOptions = RequestOptions(path: path);
const header = {'Content-Type': 'application/json'};

final errorMockJson = {
  "error": {
    "code":"500",
    "message":"Internal Server Error"
  }
};

final mockErrorResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.internalServerError,
    data: errorMockJson);
