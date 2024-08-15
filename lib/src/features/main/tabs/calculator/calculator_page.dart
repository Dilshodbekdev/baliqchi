
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
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
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
  String? role;

  @override
  void initState() {
    super.initState();
    Prefs.getString(AppConstants.kRole).then((onValue) {
      role = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: role!='USER'? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        text: S.of(context).umumiyMalumotlarniKiritish,
                        onClick: () {
                          context.pushNamed(AppRoutes.createEconomic.name);
                        },
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: AppElevatedButton(
                        text: S.of(context).kunlikOvqatMiqdoriniKorish,
                        onClick: () {
                          context.pushNamed(AppRoutes.createDailyNutrient.name);
                        },
                        textColor: AppColors.textColorLight,
                        bgColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ):null,
              body: Center(
                child: Text(
                  'Ma\'lumot topilmadi',
                  style: TextStyle(
                    color: Color(0xFF0F1728),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(BuildContext context, EconomicModel? model, int index) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.detailsEconomic.name,
            pathParameters: {'id': model?.id ?? ''});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hisobot(${model?.date})"),
          AppRow(
              text1: S.of(context).baliqTuri,
              text2: model?.fishTypeNames?.nameUz ?? '--'),
          AppRow(
              text1: S.of(context).soni,
              text2: "${model?.amountFish} so'm"),
          AppRow(
              text1: S.of(context).boqishUsuli,
              text2: model?.technologyNames?.nameUz ?? '--'),
        ],
      ),
    ).animate().move().fade().slideY(
        begin: 1,
        end: 0,
        duration: 200.ms);
  }
}
