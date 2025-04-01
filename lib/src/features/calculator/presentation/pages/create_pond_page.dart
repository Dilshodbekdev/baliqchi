import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/pont_details_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class CreatePondPage extends StatefulWidget {
  final String pondJson;
  const CreatePondPage({super.key, required this.pondJson});

  @override
  State<CreatePondPage> createState() => _CreatePondPageState();
}

class _CreatePondPageState extends State<CreatePondPage> {
  late final bloc = context.read<CalculatorBloc>();
  PontDetailsModel? pondModel;

  bool? _isIntensive;

  final form = FormGroup({
    'fishAmount': FormControl<int>(validators: [Validators.required]),
    'fishWeight': FormControl<int>(validators: [Validators.required]),
    'finalWeight': FormControl<int>(validators: [Validators.required]),
    'probabilitySurvival': FormControl<int>(validators: [Validators.required]),
    'fishTypeId': FormControl<String>(validators: [Validators.required]),
    'name': FormControl<String>(validators: [Validators.required]),
    'technologyId': FormControl<String>(validators: [Validators.required]),
    'hectare': FormControl<double>(validators: [Validators.required]),
    'length': FormControl<double>(validators: [Validators.required]),
    'breadth': FormControl<double>(validators: [Validators.required]),
    'depth': FormControl<double>(validators: [Validators.required]),
  });

  FormControl<int> get fishAmount => form.control('fishAmount') as FormControl<int>;

  FormControl<int> get fishWeight => form.control('fishWeight') as FormControl<int>;

  FormControl<int> get probabilitySurvival => form.control('probabilitySurvival') as FormControl<int>;

  FormControl<int> get finalWeight => form.control('finalWeight') as FormControl<int>;

  FormControl<String> get fishTypeId => form.control('fishTypeId') as FormControl<String>;

  FormControl<String> get name => form.control('name') as FormControl<String>;

  FormControl<String> get technologyId => form.control('technologyId') as FormControl<String>;

  FormControl<double> get hectare => form.control('hectare') as FormControl<double>;

  FormControl<double> get length => form.control('length') as FormControl<double>;

  FormControl<double> get breadth => form.control('breadth') as FormControl<double>;

  FormControl<double> get depth => form.control('depth') as FormControl<double>;

  @override
  void initState() {
    super.initState();
    bloc.fishTyped();
    bloc.technologies();
    if (widget.pondJson!='create') {
      pondModel = PontDetailsModel.fromJson(jsonDecode(widget.pondJson));
      fishAmount.value=pondModel?.fishAmount;
      fishWeight.value=pondModel?.startWeight;
      probabilitySurvival.value=pondModel?.probabilitySurvival;
      finalWeight.value=pondModel?.endWeight;
      fishTypeId.value=pondModel?.fishTypeId;
      name.value=pondModel?.name;
      technologyId.value=pondModel?.technologyId;
      hectare.value=pondModel?.hectare;
      length.value=pondModel?.length;
      breadth.value=pondModel?.breadth;
      depth.value=pondModel?.depth;

      if (pondModel?.technologyId ==
          '02d63df8-6a3a-46a3-ad15-4844db94c627') {
        setState(() {
          _isIntensive = true;
        });
        hectare.setValidators([], autoValidate: true);
        length.setValidators([Validators.required],
            autoValidate: true);
        breadth.setValidators([Validators.required],
            autoValidate: true);
      } else {
        setState(() {
          _isIntensive = false;
        });
        length.setValidators([], autoValidate: true);
        breadth.setValidators([], autoValidate: true);
        hectare.setValidators([Validators.required],
            autoValidate: true);
      }
    }
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
              text: S.of(context).saqlash,
              onClick: () {
                if (form.valid) {
                  bloc.createPond(CreatePondBody(
                    id: pondModel?.id,
                      fishTypeId: fishTypeId.value,
                      technologyId: technologyId.value,
                      name: name.value,
                      hectare: hectare.value,
                      depth: depth.value,
                      breadth: breadth.value,
                      length: length.value,
                      fishAmount: fishAmount.value,
                      startWeight: fishWeight.value,
                      probabilitySurvival: probabilitySurvival.value,
                      endWeight: finalWeight.value));
                } else {
                  form.markAllAsTouched();
                  debugPrint(jsonEncode(jsonEncode(form.value)));
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).havzaMalumotlariniKiritish),
        ),
        body: BlocConsumer<CalculatorBloc, CalculatorState>(
          listener: (context, state) {
            if (state.isCreatedPond) {
              toastification.show(
                  title: Text(state.createPond?.message ?? '--'),
                  type: ToastificationType.info,
                  alignment: Alignment.bottomCenter,
                  showProgressBar: false,
                  icon: const Icon(Icons.check_circle_outline),
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: 3.seconds,
                  primaryColor: AppColors.mainGreenColor);
              bloc.ponds();
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
                                    appState.lang == 'uz'
                                        ? e.nameUz ?? "--"
                                        : e.nameUz ?? "--",
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
                                    appState.lang == 'uz'
                                        ? e.nameUz ?? "--"
                                        : e.nameUz ?? "--",
                                    style: CustomTextStyle.h16M,
                                  ),
                                );
                              }).toList() ??
                              [],
                          onChanged: (val) {
                            if (val.value ==
                                '02d63df8-6a3a-46a3-ad15-4844db94c627') {
                              setState(() {
                                _isIntensive = true;
                              });
                              hectare.setValidators([], autoValidate: true);
                              length.setValidators([Validators.required],
                                  autoValidate: true);
                              breadth.setValidators([Validators.required],
                                  autoValidate: true);
                            } else {
                              setState(() {
                                _isIntensive = false;
                              });
                              length.setValidators([], autoValidate: true);
                              breadth.setValidators([], autoValidate: true);
                              hectare.setValidators([Validators.required],
                                  autoValidate: true);
                            }
                          },
                          validationMessages: {
                            'required': (error) => '',
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: _isIntensive == false,
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
                        visible: _isIntensive == true,
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
                              labelText: S.of(context).havzaUzunligi,
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
                        visible: _isIntensive == true,
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
                              labelText: S.of(context).havzaKengligi,
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
                          formControl: name,
                          decoration: InputDecoration(
                            isDense: true,
                            errorStyle: const TextStyle(height: 0.001),
                            errorText: null,
                            labelText: S.of(context).havzaNomi,
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
                            labelText:
                                S.of(context).mavsumBoshidagiBaliqOgirligiG,
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
                            labelText:
                                S.of(context).baliqningYashabQolishDarajasi,
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
                            labelText: S
                                .of(context)
                                .mavsumOxiridagiMoljallanganBaliqOgirligiG,
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
