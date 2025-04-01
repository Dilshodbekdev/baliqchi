import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/network/api_interceptor.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_card_body.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:baliqchi/src/features/home/presentation/pages/payment/input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class PayMeCardPage extends StatefulWidget {
  final String model;
  const PayMeCardPage({super.key, required this.model});

  @override
  State<PayMeCardPage> createState() => _PayMeCardPageState();
}

class _PayMeCardPageState extends State<PayMeCardPage> {
  late final bloc = context.read<HomeBloc>();
  DefinitionModel? model;


  final form = FormGroup({
    'cardNumber': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(22),
        Validators.maxLength(22),
      ],
    ),
    'expiryDate': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(5),
        Validators.maxLength(5),
      ],
    ),
  });

  FormControl<String> get card=>form.control('cardNumber') as FormControl<String>;
  FormControl<String> get date=>form.control('expiryDate') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    model=DefinitionModel.fromJson(jsonDecode(widget.model));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocConsumer<HomeBloc, HomeState>(
          listener: (context,state){
            if(state.isPayMeCard){
              context.pushNamed(AppRoutes.payMeCode.name,pathParameters: {
                'model':jsonEncode(state.payMeCard),
                'id':model?.id??'',
                'name':appState.lang=='uz'?model?.paymentTypeUz??'--':model?.paymentTypeRu??'--',
              });
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
              child: Scaffold(
                  bottomNavigationBar: state.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.mainColor2,)): Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ReactiveFormConsumer(builder: (context, form, child) {
                      return AppElevatedButton(
                        text: S.of(context).davomEtish,
                        onClick: () {
                          if(form.valid){
                            bloc.payMeCard(PayMeCardBody(number: card.value?.replaceAll('  ', ' '),expire: date.value?.replaceAll('/', '')));
                          }else{
                            form.markAllAsTouched();
                          }
                        },
                      );
                    }),
                  ),
                  appBar: AppBar(
                    title: Text(S.of(context).shaxsiyKartaMalumotlari),
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        AppContainer(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          child: ReactiveTextField<String>(
                            formControlName: 'cardNumber',
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(height: 0.001),
                              hintText: "0000  0000  0000  0000",
                              hintStyle: CustomTextStyle.hint,
                              labelText: S.of(context).kartaRaqami,
                              labelStyle: CustomTextStyle.hint,
                              border: appTextFiledTransparentBorder(),
                              enabledBorder: appTextFiledTransparentBorder(),
                              disabledBorder: appTextFiledTransparentBorder(),
                              focusedBorder: appTextFiledTransparentBorder(),
                              errorBorder: appTextFiledErrorBorder(),
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // Only allow digits
                              LengthLimitingTextInputFormatter(16),
                              CardNumberInputFormatter(), // Apply the custom formatter
                            ],
                            cursorColor: Theme.of(context).colorScheme.tertiary,
                            validationMessages: {
                              'required': (error) => '',
                              'minLength': (error) => '',
                              'maxLength': (error) => '',
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Expiry Date Field
                        ReactiveTextField<String>(
                          formControlName: 'expiryDate',
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            hintText: "00/00",
                            hintStyle: CustomTextStyle.hint,
                            labelText: S.of(context).muddati,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          validationMessages: {
                            'required': (error) => '',
                            'minLength': (error) => '',
                            'maxLength': (error) => '',
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
              ),
            );
          },
        );
      },
    );
  }

}