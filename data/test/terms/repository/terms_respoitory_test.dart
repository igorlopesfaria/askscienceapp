import 'dart:convert';

import 'package:data/terms/data_source/terms_api_data_source.dart';
import 'package:data/terms/model/api/response/terms_response_api_model.dart';
import 'package:data/terms/terms_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../shared.dart';
import '../terms.shared.dart';

class MockRemoteDataSource extends Mock implements ITermsApiDataSource {}

void main() {

  late ITermsRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = TermsRepository(mockRemoteDataSource);
  });

  final termsOfUsageFromAPIDataSource = TermsResponseApiModel.fromJson(
    json.decode(fixture('terms_of_usage_200.json')),
  );

  final privacyPolicyFromAPIDataSource = TermsResponseApiModel.fromJson(
    json.decode(fixture('terms_privacy_policy_200.json')),
  );

  test('should return domain term data WHEN the call to remote data source is successful',() async {

    when(() => mockRemoteDataSource.getTermsOfUsage())
        .thenAnswer((_) async => termsOfUsageFromAPIDataSource);
    final result = await repository.getTermsOfUsage();
    expect(result, termsOfUsageCorrectModel);
  });

  test('should return domain term data WHEN the call to remote data source is successful',() async {

    when(() => mockRemoteDataSource.getPrivacyPolicy())
        .thenAnswer((_) async => privacyPolicyFromAPIDataSource);
    final result = await repository.getPrivacyPolicy();
    expect(result, privacyPolicyCorrectModel);
  });

}