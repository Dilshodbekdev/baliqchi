import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/food_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreateDailyCalculationsPage extends StatefulWidget {
  const CreateDailyCalculationsPage({super.key});

  @override
  State<CreateDailyCalculationsPage> createState() =>
      _CreateDailyCalculationsPageState();
}

class _CreateDailyCalculationsPageState
    extends State<CreateDailyCalculationsPage> {
  late final bloc = context.read<CalculatorBloc>();

  final form = FormGroup({
    'fishName': FormControl<FishTypes>(validators: [Validators.required]),
    'foodTypeName': FormControl<FoodModel>(validators: [Validators.required]),
    'temperature': FormControl<NutritionalInfoModel>(validators: [Validators.required]),
    'countFish': FormControl<int>(validators: [Validators.required]),
    'fcr': FormControl<double>(validators: [Validators.required]),
    'weightFish': FormControl<int>(validators: [Validators.required]),
  });

  FormControl<FishTypes> get fishName =>
      form.control('fishName') as FormControl<FishTypes>;

  FormControl<FoodModel> get foodTypeName =>
      form.control('foodTypeName') as FormControl<FoodModel>;

  FormControl<NutritionalInfoModel> get temperature =>
      form.control('temperature') as FormControl<NutritionalInfoModel>;

  FormControl<int> get countFish =>
      form.control('countFish') as FormControl<int>;

  FormControl<double> get fcr =>
      form.control('fcr') as FormControl<double>;

  FormControl<int> get weightFish =>
      form.control('weightFish') as FormControl<int>;

  @override
  void initState() {
    super.initState();
    bloc.fishTyped();
  }

  Future<void> _showMyDialog(CreateDailyNutrientModel? model) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppRow(
                    text1: S.of(context).baliqTuri,
                    text2: model?.fishName ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(
                    text1: S.of(context).ovqatTuri,
                    text2: model?.foodName ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(
                    text1: S.of(context).suvHaroratiC,
                    text2: model?.temperature ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(
                    text1: S.of(context).baliqSoni,
                    text2: model?.countFish.toString() ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(
                    text1: S.of(context).baliqOgirligiG,
                    text2: model?.weightFish.toString() ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(
                    text1: S.of(context).kunlikOvqatMiqdori,
                    text2: model?.nutrientValue.toString() ?? '--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppElevatedButton(
                    text: S.of(context).yopish,
                    onClick: () {
                      context.pop();
                    },
                    bgColor: AppColors.mainColor2,
                    textColor: Colors.white)
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveFormConsumer(builder: (context, form, child) {
            return AppElevatedButton(
              text: S.of(context).hisoblash,
              onClick: () {
                if (form.valid) {
                  bloc.createDailyNutrient(CreateDailyNutrientBody(
                      fishName: fishName.value?.nameUz,
                      countFish: countFish.value,
                      fcr: fcr.value,
                      weightFish: weightFish.value,
                      percentage: temperature.value?.percentage,
                      foodName: foodTypeName.value?.nameUz,
                      temperature: temperature.value?.temperature,
                      fishTypeId: fishName.value?.id,
                      foodTypeId: foodTypeName.value?.id
                  ));
                } else {
                  form.markAllAsTouched();
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).kunlikOvqatMiqdoriniKorish),
        ),
        body: BlocConsumer<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state.isCreatedDailyNutrient) {
              _showMyDialog(state.createDailyNutrientModel);
            }
            if(state.hasError){
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 4,
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
                        child: ReactiveDropdownField<FishTypes>(
                          isExpanded: true,
                          formControl: fishName,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            labelText: S.of(context).baliqTuri,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          borderRadius: BorderRadius.circular(6),
                          items: state.fishTypes?.map((e) {
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
                            bloc.nutritionalInfos(val.value?.id ?? '');
                            bloc.generalNutritionalInfosFoods(val.value?.id ?? '');
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
                        child: ReactiveDropdownField<NutritionalInfoModel>(
                          isExpanded: true,
                          formControl: temperature,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            labelText: S.of(context).suvHaroratiC,
                            labelStyle: CustomTextStyle.hint,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          borderRadius: BorderRadius.circular(6),
                          items: state.nutritionalInfos?.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.temperature ?? "--",
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
                        child: ReactiveDropdownField<FoodModel>(
                          isExpanded: true,
                          formControl: foodTypeName,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: const TextStyle(height: 0.001),
                            labelText: S.of(context).ovqatTuri,
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
                          formControl: fcr,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).fcrKorsatkishi,
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
                          formControl: countFish,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).baliqlarningTaxminiySoni,
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
                          formControl: weightFish,
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
