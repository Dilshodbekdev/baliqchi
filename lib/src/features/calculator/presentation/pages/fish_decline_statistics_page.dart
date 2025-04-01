import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_statistic_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FishDeclineStatisticsPage extends StatefulWidget {
  const FishDeclineStatisticsPage({super.key});

  @override
  State<FishDeclineStatisticsPage> createState() =>
      _FishDeclineStatisticsPageState();
}

class _FishDeclineStatisticsPageState extends State<FishDeclineStatisticsPage> {
  late final bloc = context.read<CalculatorBloc>();

  late double _columnWidth;
  late double _columnSpacing;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _dateController.text=DateTime.now().year.toString();
    bloc.changeStatisticBody(year: DateTime.now().year);
    super.initState();
    bloc.pondFishes();
  }

  String _getTitle(int month) {
    String mon = '';
    switch (month) {
      case 1:
        mon = 'Yan';
      case 2:
        mon = 'Fev';
      case 3:
        mon = 'Mart';
      case 4:
        mon = 'Apr';
      case 5:
        mon = 'May';
      case 6:
        mon = 'Iyun';
      case 7:
        mon = 'Iyul';
      case 8:
        mon = 'Avg';
      case 9:
        mon = 'Sen';
      case 10:
        mon = 'Okt';
      case 11:
        mon = 'Noy';
      case 12:
        mon = 'Dek';
        default: mon = 'None';
    }
    return mon;
  }

  List<BarSeries<ChartSampleData, String>> _buildBarSeries(FishDeclineStatisticModel? model) {
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
        dataSource: model?.sold
                ?.map((e) => ChartSampleData(
                      x: _getTitle(e.month??0),
                      y: e.fishAmount,
                      secondSeriesYValue: e.weight,
                    ))
                .toList() ??
            [],
        xValueMapper: (ChartSampleData sales, int index) => sales.x,
        yValueMapper: (ChartSampleData sales, int index) => sales.y,
        name: S.of(context).sotilgan,
        dataLabelSettings: const DataLabelSettings(isVisible: true,showZeroValue: true),
        width: _columnWidth,
        borderRadius: BorderRadius.circular(6),
        spacing: _columnSpacing,
      ),
      BarSeries<ChartSampleData, String>(
        dataSource: model?.dead
            ?.map((e) => ChartSampleData(
          x: _getTitle(e.month??0),
          y: e.fishAmount,
          secondSeriesYValue: e.weight,
        ))
            .toList() ??
            [],
        xValueMapper: (ChartSampleData sales, int index) => sales.x,
        yValueMapper: (ChartSampleData sales, int index) => sales.y,
        name: S.of(context).olgan,
        borderRadius: BorderRadius.circular(6),
        dataLabelSettings: const DataLabelSettings(isVisible: true,showZeroValue: true),
        width: _columnWidth,
        spacing: _columnSpacing,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).statistikaniKorish),
      ),
      body: BlocConsumer<CalculatorBloc, CalculatorState>(
        listener: (context, state){
          if(state.isPondFishes){
            bloc.changeStatisticBody(id: state.pondFishes?.first.fishTypeId??'');
            bloc.fishDeclineStatistic();
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
                  builder: (context, appState) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                        child: Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: AppContainer(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    fillColor: Colors.white,
                                    border: appTextFiledTransparentBorder(),
                                    enabledBorder: appTextFiledTransparentBorder(),
                                    disabledBorder: appTextFiledTransparentBorder(),
                                    focusedBorder: appTextFiledTransparentBorder(),
                                    errorBorder: appTextFiledErrorBorder(),
                                  ),
                                  value: state.pondFishes?.first,
                                  hint: Text(S.of(context).baliqTuri),
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(8),
                                  items: state.pondFishes?.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                          appState.lang=='uz' ? e.fishTypeNameUz??'' : e.fishTypeNameRu??''
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    bloc.changeStatisticBody(id: val?.fishTypeId??'');
                                    bloc.fishDeclineStatistic();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: AppContainer(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                child: TextField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    isDense: true,
                                    fillColor: Colors.white,
                                    border: appTextFiledTransparentBorder(),
                                    enabledBorder: appTextFiledTransparentBorder(),
                                    disabledBorder: appTextFiledTransparentBorder(),
                                    focusedBorder: appTextFiledTransparentBorder(),
                                    errorBorder: appTextFiledErrorBorder(),
                                  ),
                                  readOnly: true,
                                  onTap:() {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(S.of(context).yilniTanlang),
                                          content: SizedBox( // Need to use container to add size constraint.
                                            width: 300,
                                            height: 300,
                                            child: YearPicker(
                                              firstDate: DateTime(DateTime.now().year - 100, 1),
                                              lastDate: DateTime(DateTime.now().year + 100, 1),
                                              selectedDate: DateTime(int.parse(_dateController.text)),
                                              onChanged: (DateTime dateTime) {
                                                _dateController.text=dateTime.year.toString();
                                                bloc.changeStatisticBody(year:dateTime.year);
                                                bloc.fishDeclineStatistic();
                                                context.pop();
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      state.isLoading?const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainColor1,
                          )): Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16,right: 16),
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: const CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: const NumericAxis(),
                            series: _buildBarSeries(state.fishDeclineStatistics),
                            legend: const Legend(isVisible: true),
                            tooltipBehavior: TooltipBehavior(enable: true),
                          ),
                        ),
                      )
                    ]);
                  },
                );
        },
      ),
    );
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final String? x;

  /// Holds y value of the datapoint
  final int? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
