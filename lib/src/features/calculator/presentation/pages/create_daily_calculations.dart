
import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateDailyCalculations extends StatefulWidget {
  const CreateDailyCalculations({super.key});

  @override
  State<CreateDailyCalculations> createState() => _CreateDailyCalculationsState();
}

class _CreateDailyCalculationsState extends State<CreateDailyCalculations> {
  late final bloc = context.read<CalculatorBloc>();

  final form = FormGroup({
    'fishName': FormControl<FishTypes>(validators: [Validators.required]),
    'foodTypeName': FormControl<FishTypes>(validators: [Validators.required]),
    'temperature': FormControl<NutritionalInfoModel>(validators: [Validators.required]),
    'countFish': FormControl<int>(validators: [Validators.required]),
    'weightFish': FormControl<int>(validators: [Validators.required]),
  });

  FormControl<FishTypes> get fishName => form.control('fishName') as FormControl<FishTypes>;
  FormControl<FishTypes> get foodTypeName => form.control('foodTypeName') as FormControl<FishTypes>;
  FormControl<NutritionalInfoModel> get temperature => form.control('temperature') as FormControl<NutritionalInfoModel>;
  FormControl<int> get countFish => form.control('countFish') as FormControl<int>;
  FormControl<int> get weightFish => form.control('weightFish') as FormControl<int>;

  @override
  void initState() {
    super.initState();
    bloc.foodTyped();
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
                AppRow(text1: S.of(context).baliqTuri, text2: model?.fishName ??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(text1: S.of(context).ovqatTuri, text2: model?.foodName ??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(text1: S.of(context).suvHaroratiC, text2: model?.temperature ??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(text1: S.of(context).baliqSoni, text2: model?.countFish.toString()??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(text1: S.of(context).baliqOgirligiG, text2: model?.weightFish.toString()??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppRow(text1: S.of(context).kunlikOvqatMiqdori, text2: model?.nutrientValue.toString()??'--'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: AppDivider(),
                ),
                AppElevatedButton(
                    text: 'Yopish',
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
                if(form.valid){
                  bloc.createDailyNutrient(CreateDailyNutrientBody(
                    fishName: fishName.value?.nameUz,
                    countFish: countFish.value,
                    weightFish: weightFish.value,
                    percentage: temperature.value?.percentage,
                    foodName: foodTypeName.value?.nameUz,
                    temperature: temperature.value?.temperature,
                    fishTypeId: fishName.value?.id,
                    foodTypeId: foodTypeName.value?.id
                  ));
                }else{
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
          listener: (context, state){
            if(state.isCreated){
              _showMyDialog(state.createDailyNutrientModel);
            }
          },
          builder: (context, state) {
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
                        errorStyle: const TextStyle(height: 0),
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
                                e.nameUz ?? "--",
                                style: CustomTextStyle.h16M,
                              ),
                            );
                          }).toList() ??
                          [],
                      onChanged: (val) {
                        bloc.nutritionalInfos(val.value?.id??'');
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
                        errorStyle: const TextStyle(height: 0),
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
                      onChanged: (val) {

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
                      formControl: countFish,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0),
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
                        errorStyle: const TextStyle(height: 0),
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
                    child: ReactiveDropdownField<FishTypes>(
                      isExpanded: true,
                      formControl: foodTypeName,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0),
                        labelText: S.of(context).ovqatTuri,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.foodTypes?.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.nameUz ?? "--",
                            style: CustomTextStyle.h16M,
                          ),
                        );
                      }).toList() ??
                          [],
                      onChanged: (val) {
                      },
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
      ),
    );
  }

  Widget buildNewsItem(BuildContext context, ExpenseMonthBody? model, int index,List<ExpenseTypeModel>? list) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
              text1: S.of(context).harajatTuri,
              text2: getExpenseType(list??[], model?.expenseTypeId??'')),
          AppRow(
              text1: S.of(context).harajatNomi,
              text2: model?.expenseName ?? '--'),
          AppRow(
              text1: S.of(context).harajatMiqdori,
              text2: "${model?.expenseAmount} so'm"),
          AppRow(
              text1: S.of(context).oy,
              text2: model?.date ?? '--'),
        ],
      ),
    ).animate().move().fade().slideY(
        begin: 1,
        end: 0,
        duration: 200.ms);
  }

  String getExpenseType(List<ExpenseTypeModel> list,String id){
    String type='--';
    loop:
    for (var action in list) {
      if(action.id==id){
        type=action.nameUz??'-';
        break loop;
      }
    }
    return type;
  }
}
