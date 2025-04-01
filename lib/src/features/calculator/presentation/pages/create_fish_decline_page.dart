import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_fish_decline_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreateFishDeclinePage extends StatefulWidget {
  const CreateFishDeclinePage({super.key});

  @override
  State<CreateFishDeclinePage> createState() => _CreateFishDeclinePageState();
}

class _CreateFishDeclinePageState extends State<CreateFishDeclinePage> {
  late final bloc = context.read<CalculatorBloc>();

  final form = FormGroup({
    'pondId': FormControl<PondModel>(validators: [Validators.required]),
    'fishTypeId': FormControl<String>(validators: [Validators.required]),
    'fishAmount': FormControl<int>(validators: [Validators.required]),
    'weight': FormControl<int>(validators: [Validators.required]),
    'declineType': FormControl<String>(validators: [Validators.required]),
    'description': FormControl<String>(validators: [Validators.required]),
    'price': FormControl<String>(validators: [Validators.required]),
    'date': FormControl<DateTime>(validators: [Validators.required]),
  });

  FormControl<PondModel> get pondId => form.control('pondId') as FormControl<PondModel>;

  FormControl<String> get fishTypeId => form.control('fishTypeId') as FormControl<String>;

  FormControl<int> get fishAmount => form.control('fishAmount') as FormControl<int>;

  FormControl<int> get weight => form.control('weight') as FormControl<int>;

  FormControl<String> get declineType =>
      form.control('declineType') as FormControl<String>;

  FormControl<String> get description =>
      form.control('description') as FormControl<String>;

  FormControl<String> get price => form.control('price') as FormControl<String>;

  FormControl<DateTime> get date =>
      form.control('date') as FormControl<DateTime>;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveFormConsumer(builder: (context, form, child) {
            return AppElevatedButton(
              text: S.of(context).saqlash,
              onClick: () {
                if (form.valid) {
                  bloc.createFishDecline(CreateFishDeclineBody(
                    pondId: pondId.value?.id,
                    fishTypeId: fishTypeId.value,
                    fishAmount: fishAmount.value,
                    weight: weight.value,
                    price: int.parse(price.value?.replaceAll(' ', '')??'0'),
                    declineType: declineType.value,
                    description: description.value,
                    date: date.value.toString().split(' ').first
                  ));
                } else {
                  form.markAllAsTouched();
                  debugPrint(jsonEncode(jsonEncode(form.value)));
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).baliqlarningKamayishiniKiritish),
        ),
        body: BlocConsumer<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state.isCreatedFishDecline) {
              toastification.show(
                  title: Text(state.createFishDecline?.message ?? '--'),
                  type: ToastificationType.info,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  icon: const Icon(Icons.check_circle_outline),
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 3.seconds,
                  primaryColor: AppColors.mainGreenColor);
              bloc.fishDeclines(state.ponds?.first.id ?? '');
              context.pop();
            }
            if (state.hasError) {
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                  ),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 8.seconds,
                  primaryColor: AppColors.mainRedColor);
            }
          },
          builder: (context, state) {
            return BlocBuilder<AppCubit, AppState>(
              builder: (context, appState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveDropdownField<PondModel>(
                          isExpanded: true,
                          formControl: pondId,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            labelText: S.of(context).havzaNomi,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          borderRadius: BorderRadius.circular(6),
                          items: state.ponds?.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    "${e.name}, ${appState.lang=='uz'?e.fishTypeNameUz:e.fishTypeNameRu}",
                                    style: CustomTextStyle.h16M,
                                  ),
                                );
                              }).toList() ??
                              [],
                          onChanged: (val) {
                            fishTypeId.value = val.value?.fishTypeId;
                          },
                          validationMessages: {
                            'required': (error) => '',
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: fishAmount,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).baliqSoni,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                          validationMessages: {
                            'required': (error) => '',
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: weight,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).baliqOgirligiG,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                          validationMessages: {
                            'required': (error) => '',
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveDropdownField<String>(
                          isExpanded: true,
                          formControl: declineType,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            labelText: S.of(context).kamayishTuri,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'SOLD',
                              child: Text(
                                S.of(context).sotilgan,
                                style: CustomTextStyle.h16M,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'DEAD',
                              child: Text(
                                S.of(context).olgan,
                                style: CustomTextStyle.h16M,
                              ),
                            )
                          ],
                          onChanged: (val) {},
                          validationMessages: {
                            'required': (error) => '',
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: price,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).baliqNarxi,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                          validationMessages: {
                            'required': (error) => '',
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            MoneyInputFormatter()
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveDateTimePicker(
                          formControl: date,
                          dateFormat: DateFormat('yyyy-MM-dd'),
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).oyniTanlang,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          validationMessages: {
                            'required': (error) => '',
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        child: ReactiveTextField(
                          style: CustomTextStyle.h16M,
                          formControl: description,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).izoh,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          cursorColor: Theme.of(context).colorScheme.tertiary,
                          validationMessages: {
                            'required': (error) => '',
                          },
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          minLines: 3,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
