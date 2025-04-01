import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreateEconomicPage extends StatefulWidget {
  const CreateEconomicPage({super.key});

  @override
  State<CreateEconomicPage> createState() => _CreateEconomicPageState();
}

class _CreateEconomicPageState extends State<CreateEconomicPage> {
  late final bloc = context.read<EconomicBloc>();

  bool? _isIntensive;

  final form = FormGroup({
    'fishAmount': FormControl<int>(validators: [Validators.required]),
    'fishWeight': FormControl<int>(validators: [Validators.required]),
    'probabilitySurvival': FormControl<int>(validators: [Validators.required]),
    'finalWeight': FormControl<int>(validators: [Validators.required]),
    'foodPrice': FormControl<String>(validators: [Validators.required]),
    'amountFeedPerKg': FormControl<double>(validators: [Validators.required]),
    'foodTypeId': FormControl<String>(validators: [Validators.required]),
    'fishTypeId': FormControl<String>(validators: [Validators.required]),
    'technologyId': FormControl<String>(validators: [Validators.required]),
    'hectare': FormControl<double>(validators: [Validators.required]),
    'length': FormControl<double>(validators: [Validators.required]),
    'breadth': FormControl<double>(validators: [Validators.required]),
    'depth': FormControl<double>(validators: [Validators.required]),
    'salary': FormControl<String>(validators: [Validators.required]),
    'period': FormControl<int>(validators: [Validators.required]),
    'plannedPriceFish': FormControl<String>(validators: [Validators.required]),
    'currentPriceFish': FormControl<String>(validators: [Validators.required]),
    'utilityBills': FormControl<String>(validators: [Validators.required]),
    'taxExpenses': FormControl<String>(validators: [Validators.required]),
    'otherExpenses': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<int> get fishAmount => form.control('fishAmount') as FormControl<int>;
  FormControl<int> get fishWeight => form.control('fishWeight') as FormControl<int>;
  FormControl<int> get probabilitySurvival => form.control('probabilitySurvival') as FormControl<int>;
  FormControl<int> get finalWeight => form.control('finalWeight') as FormControl<int>;
  FormControl<String> get foodPrice => form.control('foodPrice') as FormControl<String>;
  FormControl<double> get amountFeedPerKg =>form.control('amountFeedPerKg') as FormControl<double>;
  FormControl<String> get foodTypeId => form.control('foodTypeId') as FormControl<String>;
  FormControl<String> get fishTypeId => form.control('fishTypeId') as FormControl<String>;
  FormControl<String> get technologyId => form.control('technologyId') as FormControl<String>;
  FormControl<double> get hectare => form.control('hectare') as FormControl<double>;
  FormControl<double> get length => form.control('length') as FormControl<double>;
  FormControl<double> get breadth => form.control('breadth') as FormControl<double>;
  FormControl<double> get depth => form.control('depth') as FormControl<double>;
  FormControl<String> get salary => form.control('salary') as FormControl<String>;
  FormControl<int> get period => form.control('period') as FormControl<int>;
  FormControl<String> get plannedPriceFish => form.control('plannedPriceFish') as FormControl<String>;
  FormControl<String> get currentPriceFish => form.control('currentPriceFish') as FormControl<String>;
  FormControl<String> get utilityBills => form.control('utilityBills') as FormControl<String>;
  FormControl<String> get taxExpenses => form.control('taxExpenses') as FormControl<String>;
  FormControl<String> get otherExpenses =>form.control('otherExpenses') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.fishTyped();
    bloc.foodTyped();
    bloc.technologies();
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
                  bloc.createEconomic(
                    CreateEconomicBody(
                      fishAmount: fishAmount.value,
                      fishWeight: fishWeight.value,
                      probabilitySurvival: probabilitySurvival.value,
                      finalWeight: finalWeight.value,
                      foodPrice: int.parse(foodPrice.value?.replaceAll(' ', '')??'0'),
                      amountFeedPerKg: amountFeedPerKg.value,
                      foodTypeId: foodTypeId.value,
                      fishTypeId: fishTypeId.value,
                      technologyId: technologyId.value,
                      hectare: hectare.value,
                      length: length.value,
                      breadth: breadth.value,
                      depth: depth.value,
                      salary: int.parse(salary.value?.replaceAll(' ', '')??'0'),
                      period: period.value,
                      plannedPriceFish: int.parse(plannedPriceFish.value?.replaceAll(' ', '')??'0'),
                      currentPriceFish: int.parse(currentPriceFish.value?.replaceAll(' ', '')??'0'),
                      utilityBills: int.parse(utilityBills.value?.replaceAll(' ', '')??'0'),
                      taxExpenses: int.parse(taxExpenses.value?.replaceAll(' ', '')??'0'),
                      otherExpenses: int.parse(otherExpenses.value?.replaceAll(' ', '')??'0'),
                    )
                  );
                } else {
                  form.markAllAsTouched();
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).tahminiyIqtisodiyKorsatkichlar),
        ),
        body: BlocConsumer<EconomicBloc, EconomicState>(
          listener: (context,state){
            if(state.isCreated){
              toastification.show(
                  title: Text(state.createExpenseMonth?.message??'--'),
                  type: ToastificationType.info,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  icon: const Icon(Icons.check_circle_outline),
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 3.seconds,
                  primaryColor: AppColors.mainGreenColor
              );
              bloc.economics();
              context.pop();
            }
            if(state.hasError){
              toastification.show(
                  title: Text(state.errorMessage,style:  const TextStyle(fontSize: 16),),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 8.seconds,
                  primaryColor: AppColors.mainRedColor
              );
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
                    child: ReactiveDropdownField<String>(
                      isExpanded: true,
                      formControl: fishTypeId,
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
                              value: e.id,
                              child: Text(
                                appState.lang=='uz'? e.nameUz ?? "--":e.nameRu ?? "--",
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
                    child: ReactiveDropdownField<String>(
                      isExpanded: true,
                      formControl: technologyId,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: const TextStyle(height: 0.001),
                        labelText: S.of(context).boqishUsuli,
                        labelStyle: CustomTextStyle.hint,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      borderRadius: BorderRadius.circular(6),
                      items: state.technologies?.map((e) {
                            return DropdownMenuItem(
                              value: e.id,
                              child: Text(
                                appState.lang=='uz'? e.nameUz ?? "--":e.nameRu ?? "--",
                                style: CustomTextStyle.h16M,
                              ),
                            );
                          }).toList() ??
                          [],
                      onChanged: (val) {
                        if(val.value=='02d63df8-6a3a-46a3-ad15-4844db94c627'){
                          setState(() {
                            _isIntensive=true;
                          });
                          hectare.setValidators([],autoValidate: true);
                          length.setValidators([Validators.required],autoValidate: true);
                          breadth.setValidators([Validators.required],autoValidate: true);
                        }else{
                          setState(() {
                            _isIntensive=false;
                          });
                          length.setValidators([],autoValidate: true);
                          breadth.setValidators([],autoValidate: true);
                          hectare.setValidators([Validators.required],autoValidate: true);
                        }
                      },
                      validationMessages: {
                        'required': (error) => '',
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: _isIntensive==false,
                    child: AppContainer(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ReactiveTextField(
                        style: CustomTextStyle.h16M,
                        formControl: hectare,
                        decoration: InputDecoration(
                          isDense: true,
                          errorStyle: const TextStyle(height: 0.001),
                          errorText: null,
                          labelText: S.of(context).havzaGektari,
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
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: _isIntensive==true,
                    child: AppContainer(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ReactiveTextField(
                        style: CustomTextStyle.h16M,
                        formControl: length,
                        decoration: InputDecoration(
                          isDense: true,
                          errorStyle: const TextStyle(height: 0.001),
                          errorText: null,
                          hintText: S.of(context).havzaUzunligi,
                          hintStyle: CustomTextStyle.hint,
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
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: _isIntensive==true,
                    child: AppContainer(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ReactiveTextField(
                        style: CustomTextStyle.h16M,
                        formControl: breadth,
                        decoration: InputDecoration(
                          isDense: true,
                          errorStyle: const TextStyle(height: 0.001),
                          errorText: null,
                          hintText: S.of(context).havzaKengligi,
                          hintStyle: CustomTextStyle.hint,
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
                  ),
                  const SizedBox(height: 8),
                  AppContainer(
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: depth,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).havzaChuqurligi,
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
                      formControl: fishWeight,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).mavsumBoshidagiBaliqOgirligiG,
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
                      formControl: probabilitySurvival,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).baliqningYashabQolishDarajasi,
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
                      formControl: finalWeight,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).mavsumOxiridagiMoljallanganBaliqOgirligiG,
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
                      formControl: foodTypeId,
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
                      items: state.foodTypes?.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            appState.lang=='uz'? e.nameUz ?? "--":e.nameRu ?? "--",
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
                      formControl: foodPrice,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).ovqatNarxi1kgSom,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: amountFeedPerKg,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).kgBaliqqaSarflanadiganOzuqaKg,
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
                      formControl: salary,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).jamiIshchilarOyligioyKesimida,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: period,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).baliqYetishtirishMuddatiOy,
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
                      formControl: plannedPriceFish,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).sotishRejalashtirilganBaliqNarxiSom,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: currentPriceFish,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).tashalayotganBaliqlarNarxiSom,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: utilityBills,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).kamunalTolovlarOyKesimida,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: taxExpenses,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).soliqHarajatlariOyKesimida,
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
                    child: ReactiveTextField(
                      style: CustomTextStyle.h16M,
                      formControl: otherExpenses,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: const TextStyle(height: 0.001),
                        errorText: null,
                        labelText: S.of(context).boshqaHarajatlarBenzinDoridarmonVaBoshqalarSomOyKesimida,
                        labelStyle: CustomTextStyle.hint,
                        hintMaxLines: 2,
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
