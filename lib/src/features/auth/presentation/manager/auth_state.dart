part of 'auth_bloc.dart';

class AuthState {
  final LoginModel? loginModel;
  final LoginModel? registerModel;
  final LoginModel? sendSmsModel;
  final LoginModel? checkSmsModel;
  final bool isLoginVerified;
  final bool isRegisterVerified;
  final bool isSendSmsVerified;
  final bool isCheckSmsVerified;
  final bool isDeleteAccount;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  AuthState({
    this.loginModel,
    this.registerModel,
    this.sendSmsModel,
    this.checkSmsModel,
    this.isLoginVerified = false,
    this.isRegisterVerified = false,
    this.isSendSmsVerified = false,
    this.isCheckSmsVerified = false,
    this.isDeleteAccount = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  AuthState copyWith({
    LoginModel? loginModel,
    LoginModel? registerModel,
    LoginModel? sendSmsModel,
    LoginModel? checkSmsModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? isRegisterVerified,
    bool? isSendSmsVerified,
    bool? isCheckSmsVerified,
    bool? isDeleteAccount,
    bool? hasError,
    String? errorMessage,
  }) =>
      AuthState(
        loginModel: loginModel ?? this.loginModel,
        registerModel: registerModel ?? this.registerModel,
        sendSmsModel: sendSmsModel ?? this.sendSmsModel,
        checkSmsModel: checkSmsModel ?? this.checkSmsModel,
        isLoginVerified: isLoginVerified ?? false,
        isRegisterVerified: isRegisterVerified ?? false,
        isSendSmsVerified: isSendSmsVerified ?? false,
        isCheckSmsVerified: isCheckSmsVerified ?? false,
        isDeleteAccount: isDeleteAccount ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
