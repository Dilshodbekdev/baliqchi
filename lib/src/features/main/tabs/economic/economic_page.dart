import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class EconomicPage extends StatefulWidget {
  const EconomicPage({super.key});

  @override
  State<EconomicPage> createState() => _EconomicPageState();
}

class _EconomicPageState extends State<EconomicPage> {
  late final bloc = context.read<EconomicBloc>();

  @override
  void initState() {
    super.initState();
    bloc.economics();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<EconomicBloc, EconomicState>(
          builder: (context, state) {
            return Scaffold(
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          text: S.of(context).tahminiyIqtisodiyKorsatkichlar,
                          onClick: () {
                            context.pushNamed(AppRoutes.createEconomic.name);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppElevatedButton(
                          text: S.of(context).oylikHarajatlarniKorish,
                          onClick: () {
                            context.pushNamed(AppRoutes.expenseMonth.name);
                          },
                          textColor: AppColors.textColorLight,
                          bgColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                body: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor2,
                      ))
                    : state.economics.isEmpty
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
                            isLoading: state.isPaging,
                            scrollOffset: 300,
                            onEndOfPage: () => bloc.pagingEconomics(),
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.economics.length +
                                  (state.isPaging ? 1 : 0),
                              itemBuilder: (context, index) => index ==
                                      state.economics.length
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : buildNewsItem(
                                      context, state.economics[index], index,appState.lang),
                            ),
                          ));
          },
        );
      },
    );
  }

  Widget buildNewsItem(BuildContext context, EconomicModel? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.detailsEconomic.name,
            pathParameters: {'id': model?.id ?? ''});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
              text1: S.of(context).sana,
              text2: model?.date??'-'
          ),
          AppRow(
              text1: S.of(context).baliqTuri,
              text2: lang=='uz'?
              model?.fishTypeNames?.nameUz ?? '-':
              model?.fishTypeNames?.nameRu??'-'
          ),
          AppRow(
              text1: S.of(context).soni,
              text2: model?.amountFish.toString() ?? '--'),
          AppRow(
              text1: S.of(context).boqishUsuli,
              text2: lang=='uz'?
              model?.technologyNames?.nameUz ?? '-':
              model?.technologyNames?.nameRu??'-'
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
