import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/register_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginModel>> login(LoginBody body) async =>
      await handleResponse(response: _apiService.login(body));

  @override
  Future<DataState<LoginModel>> register(RegisterBody body) async =>
      await handleResponse(response: _apiService.register(body));

  @override
  Future<DataState<LoginModel>> sendSms(SendSmsBody body) async =>
      await handleResponse(response: _apiService.sendSms(body));

  @override
  Future<DataState<LoginModel>> checkSms(LoginBody body) async =>
      await handleResponse(
          response: _apiService.checkSms(
        body.password ?? '',
        body.phone ?? '',
      ));

  @override
  Future<DataState> deleteAccount() async =>
      await handleResponse(response: _apiService.deleteAccount());
}
