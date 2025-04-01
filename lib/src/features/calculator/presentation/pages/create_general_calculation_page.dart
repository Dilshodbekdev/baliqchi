import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/food_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreateGeneralCalculationPage extends StatefulWidget {
  final String pond;

  const CreateGeneralCalculationPage({super.key, required this.pond});

  @override
  State<CreateGeneralCalculationPage> createState() =>
      _CreateGeneralCalculationPageState();
}

class _CreateGeneralCalculationPageState
    extends State<CreateGeneralCalculationPage> {
  PondModel? pondModel;
  late final bloc = context.read<CalculatorBloc>();

  final form = FormGroup({
    'fishName': FormControl<String>(validators: [Validators.required]),
    'foodTypeId': FormControl<FoodModel>(validators: [Validators.required]),
    'foodPrice': FormControl<String>(validators: [Validators.required]),
    'startWeight': FormControl<GeneralNutritionalInfoModel>(validators: [Validators.required]),
    'endWeight': FormControl<GeneralNutritionalInfoModel>(validators: [Validators.required]),
  });

  FormControl<String> get fishName =>
      form.control('fishName') as FormControl<String>;

  FormControl<FoodModel> get foodTypeId =>
      form.control('foodTypeId') as FormControl<FoodModel>;

  FormControl<String> get foodPrice =>
      form.control('foodPrice') as FormControl<String>;

  FormControl<GeneralNutritionalInfoModel> get startWeight =>
      form.control('startWeight')
          as FormControl<GeneralNutritionalInfoModel>;

  FormControl<GeneralNutritionalInfoModel> get endWeight =>
      form.control('endWeight')
          as FormControl<GeneralNutritionalInfoModel>;

  @override
  void initState() {
    super.initState();
    pondModel = PondModel.fromJson(jsonDecode(widget.pond));
    bloc.generalNutritionalInfosFoods(pondModel?.fishTypeId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: BlocConsumer<CalculatorBloc, CalculatorState>(
        listener: (context, state) {
          if (state.isCreatedGeneralCalculation) {
            toastification.show(
                title: Text(state.createPond?.message ?? '--'),
                type: ToastificationType.info,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                icon: const Icon(Icons.check_circle_outline),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 3.seconds,
                primaryColor: AppColors.mainGreenColor);
            bloc.generalCalculations(pondModel?.id ?? '');
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
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveFormConsumer(builder: (context, form, child) {
            return AppElevatedButton(
              text: S.of(context).hisoblash,
              onClick: () {
                if (form.valid) {
                  List<String> ids=[];
                  state.generalNutritionalInfos?.forEach((action){
                    if((action.startWeight??0)>=(startWeight.value?.startWeight??0)&&(action.startWeight??0)<=(endWeight.value?.startWeight??0)){
                      ids.add(action.id??'');
                    }
                  });
                  bloc.createGeneralCalculation(CreateGeneralCalculationBody(
                      foodPrice: int.parse(foodPrice.value?.replaceAll(' ', '') ?? '0'),
                      generalNutritionalInfoIds: ids,
                      temperature: startWeight.value?.temperature.toString(),
                      pondId: pondModel?.id,
                      fishTypeId: pondModel?.fishTypeId,
                      foodTypeId: foodTypeId.value?.id,
                  ));
                } else {
                  form.markAllAsTouched();
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).umumiyOzuqaniHisoblash),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            fishName.value = appState.lang == 'uz'
                ? pondModel?.fishTypeNameUz
                : pondModel?.technologyNameRu;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppContainer(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: fishName,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).baliqTuri,
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
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AppContainer(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: ReactiveDropdownField<FoodModel>(
                      isExpanded: true,
                      formControl: foodTypeId,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0.001),
                        labelText: S.of(context).ozuqaTuri,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.generalNutritionalInfosFoods?.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            appState.lang == 'uz'
                                ? e.nameUz ?? "--"
                                : e.nameRu ?? "--",
                            style: CustomTextStyle.h16M,
                          ),
                        );
                      }).toList() ??
                          [],
                      onChanged: (val) {
                        bloc.generalNutritionalInfos(
                            pondModel?.fishTypeId ?? '',
                            val.value?.id ?? '');
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
                      formControl: foodPrice,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).ozuqaNarxiSom,
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
                    child:
                    ReactiveDropdownField<GeneralNutritionalInfoModel>(
                      isExpanded: true,
                      formControl: startWeight,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0.001),
                        labelText: S.of(context).boshlangichOgirligiKg,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.generalNutritionalInfos?.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.startWeight.toString(),
                            style: CustomTextStyle.h16M,
                          ),
                        );
                      }).toList() ??
                          [],
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
                    child:
                    ReactiveDropdownField<GeneralNutritionalInfoModel>(
                      isExpanded: true,
                      formControl: endWeight,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0.001),
                        labelText: S.of(context).yakuniyOgirligiKg,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.generalNutritionalInfos?.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.endWeight.toString(),
                            style: CustomTextStyle.h16M,
                          ),
                        );
                      }).toList() ??
                          [],
                      onChanged: (val) {},
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
  },
),
    );
  }
}