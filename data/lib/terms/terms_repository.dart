import 'package:data/terms/data_source/terms_api_data_source.dart';
import 'package:data/terms/model/terms_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:model/data/terms.dart';

abstract class ITermsRepository {
  Future<Terms> getTermsOfUsage();
  Future<Terms> getPrivacyPolicy();
}

@Injectable(as: ITermsRepository)
class TermsRepository implements ITermsRepository{
  final ITermsApiDataSource _apiDataSource;

  TermsRepository(this._apiDataSource);

  @override
  Future<Terms> getTermsOfUsage() async =>
      (await _apiDataSource.getTermsOfUsage()).mapModel;

  @override
  Future<Terms> getPrivacyPolicy() async =>
      (await _apiDataSource.getPrivacyPolicy()).mapModel;

}
