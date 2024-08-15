import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateExpenseMonthPage extends StatefulWidget {
  const CreateExpenseMonthPage({super.key});

  @override
  State<CreateExpenseMonthPage> createState() => _CreateExpenseMonthPageState();
}

class _CreateExpenseMonthPageState extends State<CreateExpenseMonthPage> {
  late final bloc = context.read<EconomicBloc>();
  List<ExpenseMonthBody> expenseMonthBody = [];

  final form = FormGroup({
    'expenseTypeId': FormControl<String>(validators: [Validators.required]),
    'expenseName': FormControl<String>(validators: [Validators.required]),
    'expenseAmount': FormControl<int>(validators: [Validators.required]),
    'date': FormControl<DateTime>(validators: [Validators.required]),
  });

  FormControl<String> get expenseTypeId =>
      form.control('expenseTypeId') as FormControl<String>;

  FormControl<String> get expenseName =>
      form.control('expenseName') as FormControl<String>;

  FormControl<int> get expenseAmount =>
      form.control('expenseAmount') as FormControl<int>;

  FormControl<DateTime> get date =>
      form.control('date') as FormControl<DateTime>;

  @override
  void initState() {
    super.initState();
    bloc.expenseTyped();
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
                if(expenseMonthBody.isNotEmpty){
                  bloc.createExpenseMonth(expenseMonthBody);
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).oylikHarajatlarniKiritish),
        ),
        body: BlocBuilder<EconomicBloc, EconomicState>(
          builder: (context, state) {
            if(state.isCreated){
              bloc.expensesMonth();
              context.pop();
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppContainer(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: ReactiveDropdownField<String>(
                      isExpanded: true,
                      formControl: expenseTypeId,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0),
                        labelText: S.of(context).harajatTuri,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.expenseTypes?.map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Text(
                                e.nameUz ?? "--",
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
                      formControl: expenseName,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        labelText: S.of(context).harajatNomi,
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
                      formControl: expenseAmount,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0),
                        errorText: null,
                        labelText: S.of(context).harajatMiqdoriSom,
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
                    child: ReactiveDateTimePicker(
                      formControl: date,
                      dateFormat: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0),
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
                  const SizedBox(
                    height: 16,
                  ),
                  ReactiveFormConsumer(builder: (context, form, child) {
                    return SizedBox(
                      height: 48,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(
                                  color: AppColors.mainColor2)),
                        ),
                        onPressed: () {
                          if (form.valid) {
                            setState(() {
                              expenseMonthBody.add(ExpenseMonthBody(
                                  expenseTypeId: expenseTypeId.value,
                                  expenseName: expenseName.value,
                                  expenseAmount: expenseAmount.value,
                                  date: date.value.toString().split(' ').first));
                            });
                            expenseTypeId.value=null;
                            expenseName.value=null;
                            expenseAmount.value=null;
                            date.value=null;
                            debugPrint(jsonEncode(expenseMonthBody));
                          } else {
                            form.markAllAsTouched();
                          }
                        },
                        child: Text(
                          S.of(context).qoshish,
                          style: const TextStyle(
                              color: AppColors.mainColor2,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: expenseMonthBody.length,
                      itemBuilder: (context, index) {
                        return buildNewsItem(context, expenseMonthBody[index], index,state.expenseTypes);
                      }),
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
