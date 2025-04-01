import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  late final bloc = context.read<AuthBloc>();

  final form = FormGroup({
    'phone': FormControl<String>(validators: [
      Validators.maxLength(9),
      Validators.minLength(9),
      Validators.number()
    ]),
  });

  FormControl<String> get phone => form.control('phone') as FormControl<String>;

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
            if (state.isSendSmsVerified) {
              context.pushNamed(AppRoutes.checkSms.name,
                  pathParameters: {'phone': phone.value ?? ''});
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
                        const SizedBox(height: 24),
                        ReactiveFormConsumer(builder: (context, form, child) {
                          return AppElevatedButton(
                              text: S.of(context).davomEtish,
                              onClick: () {
                                if (form.valid) {
                                  bloc.sendSms(SendSmsBody(phoneNumber: "998${phone.value}"));
                                } else {
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
