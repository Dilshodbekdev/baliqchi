import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/data/bodies/register_body.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  final String phone;

  const RegisterPage({super.key, required this.phone});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final bloc = context.read<AuthBloc>();

  final form = FormGroup({
    'firstName': FormControl<String>(validators: [Validators.required]),
    'lastName': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(8)]),
    'passwordConfirmation': FormControl<String>(),
  }, validators: [
    Validators.mustMatch('password', 'passwordConfirmation'),
  ]);

  FormControl<String> get firstName => form.control('firstName') as FormControl<String>;
  FormControl<String> get lastName => form.control('lastName') as FormControl<String>;
  FormControl<String> get password => form.control('password') as FormControl<String>;
  FormControl<String> get passwordConfirmation => form.control('passwordConfirmation') as FormControl<String>;

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
    if(state.isRegisterVerified){
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
                        S.of(context).royxatdanOtish,
                        style: CustomTextStyle.h22SB),
                    const SizedBox(height: 24),
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).ismi,
                      style: CustomTextStyle.h14SB,
                    ),
                    const SizedBox(height: 4),
                    ReactiveTextField(
                      formControl: firstName,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        hintStyle: const TextStyle(color: Colors.grey),
                        counterText: '',
                        border: appTextFiledBorder(),
                        enabledBorder: appTextFiledBorder(),
                        disabledBorder: appTextFiledBorder(),
                        focusedBorder: appTextFiledBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      keyboardType: TextInputType.name,
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).familiya,
                      style: CustomTextStyle.h14SB,
                    ),
                    const SizedBox(height: 4),
                    ReactiveTextField(
                      formControl: lastName,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        hintStyle: const TextStyle(color: Colors.grey),
                        counterText: '',
                        border: appTextFiledBorder(),
                        enabledBorder: appTextFiledBorder(),
                        disabledBorder: appTextFiledBorder(),
                        focusedBorder: appTextFiledBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      keyboardType: TextInputType.name,
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).parol,
                      style: CustomTextStyle.h14SB,
                    ),
                    const SizedBox(height: 4),
                    ReactiveTextField(
                      formControl: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        hintStyle: const TextStyle(color: Colors.grey),
                        counterText: '',
                        border: appTextFiledBorder(),
                        enabledBorder: appTextFiledBorder(),
                        disabledBorder: appTextFiledBorder(),
                        focusedBorder: appTextFiledBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      S.of(context).parolniTasdiqlang,
                      style: CustomTextStyle.h14SB,
                    ),
                    const SizedBox(height: 4),
                    ReactiveTextField(
                      formControl: passwordConfirmation,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        hintStyle: const TextStyle(color: Colors.grey),
                        counterText: '',
                        border: appTextFiledBorder(),
                        enabledBorder: appTextFiledBorder(),
                        disabledBorder: appTextFiledBorder(),
                        focusedBorder: appTextFiledBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                    const SizedBox(height: 24),
                    ReactiveFormConsumer(builder: (context,form,child){
                      return AppElevatedButton(
                          text: S.of(context).davomEtish,
                          onClick: () {
                            if(form.valid){
                              bloc.register(RegisterBody(
                                firstName: firstName.value,
                                lastName: lastName.value,
                                password: password.value,
                                phoneNumber: "998${widget.phone}",
                              ));
                            }else{
                              form.markAllAsTouched();
                            }
                          });
                    }),
                    const SizedBox(
                      height: 16,
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
