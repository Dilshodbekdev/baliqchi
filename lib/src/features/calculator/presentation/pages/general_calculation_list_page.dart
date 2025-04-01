import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/network/api_interceptor.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GeneralCalculationListPage extends StatefulWidget {
  final String id;

  const GeneralCalculationListPage({super.key, required this.id});

  @override
  State<GeneralCalculationListPage> createState() =>
      _GeneralCalculationListPageState();
}

class _GeneralCalculationListPageState
    extends State<GeneralCalculationListPage> {
  late final bloc = context.read<CalculatorBloc>();

  @override
  void initState() {
    super.initState();
    bloc.generalCalculationList(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).batafsil),
                ),
                body: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.mainColor2,
                      ))
                    : state.generalCalculationList?.isEmpty==true
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
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: state.generalCalculationList?.length,
                            itemBuilder: (context, index) => buildNewsItem(
                                        context,
                                        state.generalCalculationList?[index],
                                        index,
                                        appState.lang),
                          ));
          },
        );
      },
    );
  }

  Widget buildNewsItem(
      BuildContext context, GeneralCalculation? model, int index, String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {
        context.pushNamed(AppRoutes.generalCalculationListDetails.name,pathParameters: {
          'id':model?.id??''
        });
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              width: 80,
              imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRow(
                  text1: lang == 'uz'
                      ? model?.fishTypeNameUz ?? '--'
                      : model?.fishTypeNameRu ?? '--',
                  text2: model?.weightInterval ?? '--',
                ),
                AppRow(
                  text1: S.of(context).ozuqaTuri,
                  text2: model?.foodTypeNameUz.toString() ?? '--',
                ),
                AppRow(
                  text1: S.of(context).ozuqaNarxiSom,
                  text2: getCurrencySymbol(model?.totalPrice ?? 0),
                ),
                AppRow(
                  text1: S.of(context).osishMuddati,
                  text2: model?.growthPeriod?.toStringAsFixed(0) ?? '--',
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
