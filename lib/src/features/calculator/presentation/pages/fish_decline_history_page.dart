import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_history_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class FishDeclineHistoryPage extends StatefulWidget {
  final String pondJson;

  const FishDeclineHistoryPage({super.key, required this.pondJson});

  @override
  State<FishDeclineHistoryPage> createState() =>
      _FishDeclineHistoryPageState();
}

class _FishDeclineHistoryPageState extends State<FishDeclineHistoryPage> {
  late final bloc = context.read<CalculatorBloc>();
  PondModel? pondModel;

  @override
  void initState() {
    super.initState();
    pondModel = PondModel.fromJson(jsonDecode(widget.pondJson));
    bloc.fishDeclinesHistory(pondModel?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).havzaTarixi),
                ),
                body: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor2,
                      ))
                    : state.fishDeclinesHistory.isEmpty
                        ? Center(
                            child: Text(
                              S.of(context).malumotTopilmadi,
                              style: const TextStyle(
                                color: Color(0xFF0F1728),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : LazyLoadScrollView(
                            isLoading: state.isPagingFishDeclineHistory,
                            scrollOffset: 300,
                            onEndOfPage: () =>bloc.pagingFishDeclinesHistory(pondModel?.id??''),
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.fishDeclinesHistory.length +
                                  (state.isPagingFishDeclineHistory ? 1 : 0),
                              itemBuilder: (context, index) =>
                                  index == state.fishDeclinesHistory.length
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : buildNewsItem(
                                          context,
                                          state.fishDeclinesHistory[index],
                                          index,appState.lang),
                            ),
                          )
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(
      BuildContext context, FishDeclineHistory? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
            text1: S.of(context).boshlangichOgirligiKg,
            text2: model?.startWeight.toString()??'-',
          ),
          AppRow(
            text1: S.of(context).baliqningYashabQolishDarajasi,
            text2: model?.probabilitySurvival.toString()??'-',
          ),
          AppRow(
            text1: S.of(context).baliqlarningZichligiKgm3,
            text2: model?.density.toString()??'-',
          ),
          AppRow(
            text1: S.of(context).oldingmiBaliqlarSoni,
            text2: model?.oldFishAmount.toString()??'-',
          ),
          AppRow(
            text1: S.of(context).baliqOgirligiG,
            text2: model?.weight.toString()??'-',
          ),
          AppRow(
            text1: S.of(context).baliqBoqishUsullari,
            text2: model?.declineType == 'SOLD'? S.of(context).sotilgan
                : S.of(context).olgan,
          ),
          AppRow(
            text1: S.of(context).hozirgiBaliqlarSoni,
            text2: model?.newFishAmount.toString()??'-',
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
