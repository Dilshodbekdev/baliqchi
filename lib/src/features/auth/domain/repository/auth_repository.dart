import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/register_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginModel>> login(LoginBody body);

  Future<DataState<LoginModel>> register(RegisterBody body);

  Future<DataState<LoginModel>> sendSms(SendSmsBody body);

  Future<DataState<LoginModel>> checkSms(LoginBody body);
}
