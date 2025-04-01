
import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/features/economic/data/bodies/filter_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final form = FormGroup({
    'startDate': FormControl<DateTime>(validators: [Validators.required]),
    'endDate': FormControl<DateTime>(validators: [Validators.required]),
  });

  FormControl<DateTime> get startDate =>
      form.control('startDate') as FormControl<DateTime>;

  FormControl<DateTime> get endDate =>
      form.control('endDate') as FormControl<DateTime>;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveFormConsumer(builder: (context, form, child) {
            return AppElevatedButton(
              text: S.of(context).qabulQilish,
              onClick: () {
                if (form.valid) {
                  context.pop(FilterBody(
                    startDate: startDate.value.toString().split(' ').first,
                    endDate: endDate.value.toString().split(' ').first,
                  ));
                } else {
                  form.markAllAsTouched();
                }
              },
            );
          }),
        ),
        appBar: AppBar(
          title: Text(S.of(context).filter),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppContainer(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ReactiveDateTimePicker(
                        formControl: startDate,
                        dateFormat: DateFormat('yyyy-MM-dd'),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0.001),
                          errorText: null,
                          labelText: S.of(context).dan,
                          labelStyle: CustomTextStyle.hint,
                          border: appTextFiledTransparentBorder(),
                          enabledBorder: appTextFiledTransparentBorder(),
                          disabledBorder: appTextFiledTransparentBorder(),
                          focusedBorder: appTextFiledTransparentBorder(),
                          errorBorder: appTextFiledErrorBorder(),
                        ),
                        validationMessages: {
                          'required': (error) => '',
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppContainer(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: ReactiveDateTimePicker(
                        formControl: endDate,
                        dateFormat: DateFormat('yyyy-MM-dd'),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 0.001),
                          errorText: null,
                          labelText: S.of(context).gacha,
                          labelStyle: CustomTextStyle.hint,
                          border: appTextFiledTransparentBorder(),
                          enabledBorder: appTextFiledTransparentBorder(),
                          disabledBorder: appTextFiledTransparentBorder(),
                          focusedBorder: appTextFiledTransparentBorder(),
                          errorBorder: appTextFiledErrorBorder(),
                        ),
                        validationMessages: {
                          'required': (error) => '',
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
