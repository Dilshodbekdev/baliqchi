import 'dart:async';
import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_code_body.dart';
import 'package:baliqchi/src/features/home/data/models/pay_me_card_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_pinput/reactive_pinput.dart';
import 'package:toastification/toastification.dart';

class PayMeCodePage extends StatefulWidget {
  final String model;
  final String id;
  final String name;

  const PayMeCodePage(
      {super.key, required this.model, required this.id, required this.name});

  @override
  State<PayMeCodePage> createState() => _PayMeCodePageState();
}

class _PayMeCodePageState extends State<PayMeCodePage> {
  late final bloc = context.read<HomeBloc>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  final form = FormGroup({
    'input': FormControl<String>(
        validators: [Validators.required, Validators.minLength(5)]),
  });

  PayMeCardModel? model;

  FormControl<String> get input => form.control('input') as FormControl<String>;

  int _start = 0; // e.g., 120 seconds = 2 minutes
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    model = PayMeCardModel.fromJson(jsonDecode(widget.model));
    _start = model?.time ?? 0;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer.cancel();
        // Optionally show a message when the timer ends
        //_showTimerEndedDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.isPayMeCode) {
              context.goNamed(AppRoutes.main.name);
            }
            if (state.hasError) {
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 4.seconds,
                  primaryColor: AppColors.mainRedColor);
            }
          },
          builder: (context, state) {
            return ReactiveForm(
              formGroup: form,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.mainColor2,
                    ))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              S.of(context).tasdiqlashKodi,
                              style: CustomTextStyle.h22SB),
                          const SizedBox(height: 4),
                          Text("+${model?.phone}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryTextColor)),
                          Text(
                              S
                                  .of(context)
                                  .telefonRaqamingizgaYuborilganTasdiqlashKodiniKiriting,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryTextColor)),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _formatTime(_start),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.timer_sharp)
                            ],
                          ),
                          const SizedBox(height: 24),
                          ReactivePinPut<String>(
                            formControlName: 'input',
                            length: 6,
                            defaultPinTheme: PinTheme(
                                height: 56,
                                width: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: const Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                textStyle: const TextStyle(fontSize: 24)),
                            onCompleted: (v) {
                              debugPrint(v);
                              //bloc.checkSms(LoginBody(phone: "998${widget.phone}",password: input.value));
                              bloc.payMeCode(PayMeCodeBody(
                                  id: model?.id,
                                  token: model?.token,
                                  code: input.value,
                                  paymentDefinitionId: widget.id));
                              input.value='';
                            },
                          ),
                        ],
                      ),
                    ),
            );
          },
        ));
  }
}
