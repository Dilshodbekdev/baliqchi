import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_declines_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final bloc = context.read<CalculatorBloc>();
  String _pondId='';

  @override
  void initState() {
    super.initState();
    bloc.ponds();
    bloc.fishDeclines(_pondId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Scaffold(
              body: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    AppContainer(
                      margin: const EdgeInsets.only(
                          right: 16, left: 16, top: 16, bottom: 8),
                      padding: const EdgeInsets.all(4),
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.mainColor2),
                        indicatorSize: TabBarIndicatorSize.tab,
                        splashBorderRadius: BorderRadius.circular(8),
                        labelStyle: CustomTextStyle.h16M,
                        labelColor: Colors.white,
                        unselectedLabelStyle: CustomTextStyle.h16M,
                        tabs: <Widget>[
                          Tab(text: S.of(context).havzalar),
                          Tab(text: S.of(context).baliqlarningKamayishi),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemCount: state.ponds?.length,
                                itemBuilder: (context, index) => buildPondItem(
                                    context,
                                    state.ponds?[index],
                                    index,
                                    appState.lang),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppElevatedButton(
                                      text: S
                                          .of(context)
                                          .havzaMalumotlariniKiritish,
                                      onClick: () {
                                        context.pushNamed(
                                            AppRoutes.createPond.name,pathParameters: {
                                          'pond': "create"
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: AppElevatedButton(
                                      text: S
                                          .of(context)
                                          .kunlikOvqatMiqdoriniKorish,
                                      onClick: () {
                                        context.pushNamed(
                                            AppRoutes.createDailyNutrient.name);
                                      },
                                      textColor: AppColors.textColorLight,
                                      bgColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            (state.ponds?.isNotEmpty == true)
                                ? AppContainer(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    padding: EdgeInsets.zero,
                                    child: DropdownButtonFormField(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        isDense: true,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                        border: appTextFiledTransparentBorder(),
                                        enabledBorder: appTextFiledTransparentBorder(),
                                        disabledBorder: appTextFiledTransparentBorder(),
                                        focusedBorder: appTextFiledTransparentBorder(),
                                        errorBorder: appTextFiledTransparentBorder(),
                                      ),
                                      hint: Text(S.of(context).havzaNomi),
                                      borderRadius: BorderRadius.circular(8),
                                      items: state.ponds?.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name ?? '-'),
                                        );
                                      }).toList(),
                                      onChanged: (val) {
                                        _pondId=val?.id??'';
                                        bloc.fishDeclines(_pondId);
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: AppColors.mainColor2,
                                  ))
                                : state.fishDeclines.isEmpty
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
                                    : Expanded(
                                        child: LazyLoadScrollView(
                                          isLoading: state.isPagingFishDecline,
                                          scrollOffset: 300,
                                          onEndOfPage: () => bloc.pagingFishDeclinesHistory(_pondId),
                                          child: ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            itemCount:
                                                state.fishDeclines.length +
                                                    (state.isPagingFishDecline
                                                        ? 1
                                                        : 0),
                                            itemBuilder: (context, index) =>
                                                index == state.fishDeclines.length
                                                    ? const Center(
                                                        child: CircularProgressIndicator())
                                                    : buildFishDeclineItem(
                                                        context,
                                                        state.fishDeclines[
                                                            index],
                                                        index,
                                                        appState.lang),
                                          ),
                                        ),
                                      ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppElevatedButton(
                                      text: S.of(context).baliqlarningKamayishiniKiritish,
                                      onClick: () {
                                        context.pushNamed(
                                            AppRoutes.createFishDecline.name);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: AppElevatedButton(
                                      text: S
                                          .of(context)
                                          .statistikaniKorish,
                                      onClick: () {
                                        context.pushNamed(
                                            AppRoutes.fishDeclineStatistics.name);
                                      },
                                      textColor: AppColors.textColorLight,
                                      bgColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildPondItem(
      BuildContext context, PondModel? model, int index, String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {
        context.pushNamed(AppRoutes.pondFish.name,
            pathParameters: {'pond': jsonEncode(model)});
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              width: 80,
              imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                value: downloadProgress.progress,
                color: AppColors.mainColor2,
              )),
              errorWidget: (context, url, error) => const Center(
                  child: Icon(
                Icons.error,
                color: AppColors.mainRedColor,
              )),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRow(
                  text1: S.of(context).havzaNomi,
                  text2: model?.name ?? '--',
                ),
                const SizedBox(height: 4),
                AppRow(
                  text1: S.of(context).baliqSoni,
                  text2: model?.fishAmount.toString() ?? '--',
                ),
                const SizedBox(height: 4),
                AppRow(
                  text1: S.of(context).boqishUsuli,
                  text2: lang == 'uz'
                      ? model?.technologyNameUz ?? '--'
                      : model?.technologyNameRu ?? '--',
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }

  Widget buildFishDeclineItem(
      BuildContext context, FishDecline? model, int index, String lang,) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {
        bloc.fishDeclineDetails(model?.id??'');
        context.pushNamed(AppRoutes.fishDeclineDetails.name);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
            text1: S.of(context).havzaNomi,
            text2: model?.pondName ?? '-',
          ),
          const SizedBox(height: 4),
          AppRow(
            text1: S.of(context).baliqSoni,
            text2: model?.fishAmount.toString() ?? '-',
          ),
          const SizedBox(height: 4),
          AppRow(
            text1: S.of(context).baliqTuri,
            text2: lang == 'uz'
                ? model?.fishTypeNameUz ?? '--'
                : model?.fishTypeNameRu ?? '--',
          ),
          const SizedBox(height: 4),
          AppRow(
            text1: S.of(context).sana,
            text2: model?.date ?? '-',
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
