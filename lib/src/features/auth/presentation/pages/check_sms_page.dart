import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/bodies/send_sms_body.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_pinput/reactive_pinput.dart';

class CheckSmsPage extends StatefulWidget {
  final String phone;

  const CheckSmsPage({super.key, required this.phone});

  @override
  State<CheckSmsPage> createState() => _CheckSmsPageState();
}

class _CheckSmsPageState extends State<CheckSmsPage> {
  late final bloc = context.read<AuthBloc>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final form = FormGroup({
    'input': FormControl<String>(validators: [Validators.required,Validators.minLength(5)]),
  });

  FormControl<String> get input => form.control('input') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 35,
      height: 35,
      textStyle: const TextStyle(color: AppColors.textColorDark, fontSize: 16),
      decoration: BoxDecoration(
          color: AppColors.mainColorDark,
          borderRadius: BorderRadius.circular(8)),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.bottomNavActiveIconColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor1,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor1,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state.isCheckSmsVerified){
              context.pushNamed(AppRoutes.register.name,pathParameters: {'phone':widget.phone});
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
                            S.of(context).tasdiqlashKodi,
                            style: CustomTextStyle.h22SB),
                        const SizedBox(height: 4),
                        Text(
                            S
                                .of(context)
                                .telefonRaqamingizgaYuborilganTasdiqlashKodiniKiriting,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondaryTextColor)),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.center,
                          child: ReactivePinPut<String>(
                            formControlName: 'input',
                            length: 5,
                            defaultPinTheme: PinTheme(
                              height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.mainColorLight
                            ),
                              textStyle: const TextStyle(fontSize: 24)
                            ),
                            onCompleted: (v){
                              debugPrint(v);
                              bloc.checkSms(
                                  LoginBody(phone: "998${widget.phone}",password: input.value));
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        ReactiveFormConsumer(builder: (context, form, child) {
                          return AppElevatedButton(
                              text: S.of(context).davomEtish,
                              onClick: () {
                                if (form.valid) {
                                  bloc.checkSms(
                                      LoginBody(phone: "998${widget.phone}",password: input.value));
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
