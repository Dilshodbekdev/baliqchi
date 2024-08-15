import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/register_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/check_sms_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/register_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/send_sms_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final SendSmsUseCase _sendSmsUseCase;
  final CheckSmsUseCase _checkSmsUseCase;

  AuthBloc(
    this._loginUseCase,
    this._sendSmsUseCase,
    this._checkSmsUseCase,
    this._registerUseCase,
  ) : super(AuthState()) {
    on<LoginEvent>((event, emit) async {
      await emit.onEach(_onLogin(event), onData: emit.call);
    });

    on<RegisterEvent>((event, emit) async {
      await emit.onEach(_onRegister(event), onData: emit.call);
    });

    on<SendSmsEvent>((event, emit) async {
      await emit.onEach(_onSendSms(event), onData: emit.call);
    });

    on<CheckSmsEvent>((event, emit) async {
      await emit.onEach(_onCheckSms(event), onData: emit.call);
    });
  }

  login(LoginBody body) {
    add(LoginEvent(body: body));
  }

  register(RegisterBody body) {
    add(RegisterEvent(body: body));
  }

  sendSms(SendSmsBody body) {
    add(SendSmsEvent(body: body));
  }

  checkSms(LoginBody body) {
    add(CheckSmsEvent(body: body));
  }

  Stream<AuthState> _onLogin(LoginEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _loginUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(loginModel: dataState.data, isLoginVerified: true);
      Prefs.setString(AppConstants.kUserId, dataState.data?.id ?? '');
      Prefs.setString(AppConstants.kRole, dataState.data?.role ?? '');
      Prefs.setString(AppConstants.kFullName, "${dataState.data?.firstName} ${dataState.data?.lastName}");
      Prefs.setString(AppConstants.kPhoneNumber, dataState.data?.username??'');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onRegister(RegisterEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _registerUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(registerModel: dataState.data, isRegisterVerified: true);
      Prefs.setString(AppConstants.kUserId, dataState.data?.id ?? '');
      Prefs.setString(AppConstants.kRole, dataState.data?.role ?? '');
      Prefs.setString(AppConstants.kFullName, "${dataState.data?.firstName} ${dataState.data?.lastName}");
      Prefs.setString(AppConstants.kPhoneNumber, dataState.data?.username??'');
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onSendSms(SendSmsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _sendSmsUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          sendSmsModel: dataState.data, isSendSmsVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<AuthState> _onCheckSms(CheckSmsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _checkSmsUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          checkSmsModel: dataState.data, isCheckSmsVerified: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
