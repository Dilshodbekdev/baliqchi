import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/register_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// URLS
  static const String _login = 'api/v1/auth/login';
  static const String _register = 'api/v1/users/client';
  static const String _sendSms = 'api/v1/sms';
  static const String _checkSms = 'api/v1/sms/check';
  static const String _deleteAccount = 'api/v1/users/profile';

  /// REQUESTS
  @POST(_login)
  Future<HttpResponse<LoginModel>> login(@Body() LoginBody body);

  @POST(_register)
  Future<HttpResponse<LoginModel>> register(@Body() RegisterBody body);

  @POST(_sendSms)
  Future<HttpResponse<LoginModel>> sendSms(@Body() SendSmsBody body);

  @DELETE(_deleteAccount)
  Future<HttpResponse<dynamic>> deleteAccount();

  @GET(_checkSms)
  Future<HttpResponse<LoginModel>> checkSms(
    @Query('code') String code,
    @Query('phoneNumber') String phoneNumber,
  );
}
