import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailsEconomicPage extends StatefulWidget {
  final String id;

  const DetailsEconomicPage({super.key, required this.id});

  @override
  State<DetailsEconomicPage> createState() => _DetailsEconomicPageState();
}

class _DetailsEconomicPageState extends State<DetailsEconomicPage> {
  late final bloc = context.read<EconomicBloc>();

  final form = FormGroup({
    'price': FormControl<String>(validators: [Validators.required,]),
  });

  FormControl<String> get price => form.control('price') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.detailsEconomic(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tahminiyIqtisodiyKorsatkichlar),
      ),
      body: BlocBuilder<EconomicBloc, EconomicState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              AppContainer(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    PieChart(
                      dataMap: {
                        S.of(context).tashalayotganBaliqlarNarxi:
                            state.detailsEconomicModel?.fishPrice?.toDouble() ??
                                0,
                        S.of(context).ozuqagaSarflanganHarajat:
                            state.detailsEconomicModel?.foodPrice ?? 0,
                        S.of(context).kamunalTolovlar:
                            state.detailsEconomicModel?.utilityBills ?? 0,
                        S.of(context).soliqHarajatlari:
                            state.detailsEconomicModel?.taxExpenses ?? 0,
                        S.of(context).jamiIshchilarOyligi:
                            state.detailsEconomicModel?.totalSalary ?? 0,
                        S.of(context).boshqaHarajatlar:
                            state.detailsEconomicModel?.otherExpenses ?? 0,
                      },
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: 240,
                      colorList: const [
                        AppColors.amountFishColor,
                        AppColors.foodPriceColor,
                        AppColors.utilityBillsColor,
                        AppColors.taxExpensesColor,
                        AppColors.totalSalaryColor,
                        AppColors.otherExpensesColor
                      ],
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 28,
                      centerText:
                          "${state.detailsEconomicModel?.totalExpense ?? ''}\nso'm",
                      centerTextStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.bottom,
                        showLegends: false,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        legendShape: BoxShape.circle,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                      ),
                      // gradientList: ---To add gradient colors---
                      // emptyColorGradient: ---Empty Color gradient---
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).tashalayotganBaliqlarNarxi,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.fishPrice?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.amountFishColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).ozuqagaSarflanganHarajat,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.foodPrice?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.foodPriceColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).kamunalTolovlar,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.utilityBills?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.utilityBillsColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).soliqHarajatlari,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.taxExpenses?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.taxExpensesColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).jamiIshchilarOyligi,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.totalSalary?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.totalSalaryColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                    ListTile(
                      title: Text(
                        S.of(context).boshqaHarajatlar,
                        style: CustomTextStyle.h16R,
                      ),
                      trailing: Text(
                        state.detailsEconomicModel?.otherExpenses?.toString() ??
                            '--',
                        style: CustomTextStyle.h16M,
                      ),
                      leading: Container(
                        height: 12,
                        width: 12,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.otherExpensesColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      dense: true,
                    ),
                    const AppDivider(),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ReactiveForm(
                formGroup: form,
                child: AppContainer(
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).sotishRejalashtirilganBaliqNarxiSom,
                              style: CustomTextStyle.h16M,
                            ),
                          ),
                          Text(
                            state.detailsEconomicModel?.plannedPriceFish
                                    .toString() ??
                                '--',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.utilityBillsColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              style: CustomTextStyle.h16M,
                              formControl: price,
                              decoration: InputDecoration(
                                isDense: true,
                                errorStyle: const TextStyle(height: 0),
                                errorText: null,
                                hintText: S.of(context).baliqNarxi,
                                hintStyle: CustomTextStyle.hint,
                                border: appTextFiledBorder(),
                                enabledBorder: appTextFiledBorder(),
                                disabledBorder: appTextFiledBorder(),
                                focusedBorder: appTextFiledBorder(),
                                errorBorder: appTextFiledErrorBorder(),
                              ),
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
                          const SizedBox(width: 16,),
                          ReactiveFormConsumer(builder: (context,form,child){
                            return SizedBox(
                              height: 48,
                              width: 56,
                              child: IconButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(form.valid){
                                      bloc.updateEconomic(PagingBody(id: widget.id,price: double.parse(price.value?.replaceAll(' ', '')??'0')));
                                    }else{
                                      form.markAllAsTouched();
                                    }
                                  },
                                  icon: const Icon(Icons.currency_exchange,color: Colors.white,)),
                            );
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.pie_chart_outline,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).ummumiyHarajatlar,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                "${state.detailsEconomicModel?.totalExpense.toString()} so'm",
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8
                        ),
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.waterfall_chart_outlined,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).daromad,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                "${state.detailsEconomicModel?.income.toString()} so'm",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.add_chart,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).foyda,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                "${state.detailsEconomicModel?.profit.toString()} so'm",
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        AppContainer(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.filter_sharp,
                                color: AppColors.mainColor2,
                              ),
                              Text(
                                S.of(context).KgBaliqningTanNarxi,
                                style: CustomTextStyle.hint,
                              ),
                              Text(
                                "${state.detailsEconomicModel?.priceKgFish.toString()} so'm",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
