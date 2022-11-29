import 'package:data/terms/model/api/response/terms_response_api_model.dart';
import 'package:model/data/terms.dart';

extension TermsApiModelMapper on TermsResponseApiModel {

  Terms get mapModel => Terms(
    text: data
  );
}