import 'package:data/terms/model/api/response/terms_response_api_model.dart';
import 'package:model/data/terms.dart';

extension TermsApiModelExtension on TermsResponseApiModel {
 Terms get mapModel {
    return Terms(
        text: data
    );
  }
}