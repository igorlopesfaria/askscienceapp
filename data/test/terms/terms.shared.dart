import 'dart:io';

import 'package:dio/dio.dart';
import 'package:model/data/terms.dart';

import '../shared.dart';


final termsOfUsageCorrectMockJson = {
  "data": "test termos de uso"
};

final termsOfUsageCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: termsOfUsageCorrectMockJson);

final privacyPolicyCorrectMockJson = {
  "data": "test política de privacidade"
};

final privacyPolicyCorrectMockResponse = Response(
    requestOptions: requestOptions,
    statusCode: HttpStatus.ok,
    data: privacyPolicyCorrectMockJson);


const termsOfUsageCorrectModel =  Terms(text: "<p><strong>Terms of Usage for My Website</strong></p>\n<p><br></p>");

const privacyPolicyCorrectModel =  Terms(text: "<p><strong>Privacy Policy for My Website</strong></p>\n<p><br></p>");


