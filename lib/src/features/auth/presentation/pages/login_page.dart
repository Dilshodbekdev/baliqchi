import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:baliqchi/src/features/main/manger/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final bloc = context.read<AuthBloc>();

  final form = FormGroup({
    'phone': FormControl<String>(validators: [
      Validators.required,
      Validators.maxLength(9),
      Validators.minLength(9),
      Validators.number()
    ]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<String> get phone => form.control('phone') as FormControl<String>;

  FormControl<String> get password =>
      form.control('password') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor1,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor1,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.hasError) {
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 3,
                  ),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 8.seconds,
                  primaryColor: Colors.red);
            }
            if (state.isLoginVerified) {
              context.read<MainCubit>().change("${state.loginModel?.firstName} ${state.loginModel?.lastName}", state.loginModel?.username??'');
              context.goNamed(AppRoutes.main.name);
            }
          },
          builder: (context, state) {
            return ReactiveForm(
              formGroup: form,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: 200,
                    child: Image.asset(
                      'assets/images/img_logo_lang.png',
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 32, top: 24),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(36),
                            topLeft: Radius.circular(36))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.center,
                            S.of(context).tizimgaKirish,
                            style: CustomTextStyle.h22SB),
                        const SizedBox(height: 18),
                        ReactiveTextField(
                          formControl: phone,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0),
                            errorText: null,
                            prefixText: "+998 ",
                            labelText: S.of(context).telefonRaqam,
                            counterText: '',
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          maxLength: 9,
                          validationMessages: {
                            'required': (error) => '',
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                        ),
                        const SizedBox(height: 18),
                        ReactiveTextField(
                          formControl: password,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).parol,
                            counterText: '',
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          obscureText: true,
                          validationMessages: {
                            'required': (error) => '',
                            'minLength': (error) => '',
                            'maxLength': (error) => '',
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                S.of(context).parolingizniUnutdingizmi,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.secondaryTextColor),
                              )),
                        ),
                        ReactiveFormConsumer(builder: (context, form, child) {
                          return SizedBox(
                            height: 56,
                            width: MediaQuery.of(context).size.width,
                            child: AppElevatedButton(
                                text: S.of(context).kirish,
                                onClick: () {
                                  //context.goNamed(AppRoutes.main.name);
                                  debugPrint(jsonEncode(form.value));
                                  if (form.valid) {
                                    bloc.login(LoginBody(
                                        phone: "998${phone.value}",
                                        password: password.value));
                                  } else {
                                    form.markAllAsTouched();
                                  }
                                }),
                          );
                        }),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            S.of(context).yoki,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryTextColor),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).akkauntingizYoqmi,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryTextColor),
                            ),
                            TextButton(
                                onPressed: () {
                                  context
                                      .pushNamed(AppRoutes.confirmation.name);
                                },
                                child: Text(
                                  S.of(context).royxatdanOtish,
                                  style: const TextStyle(
                                      color: AppColors.mainColor2),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            );
          },
        ));
  }
}
