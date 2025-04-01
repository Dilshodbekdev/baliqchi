
import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ExpenseMonthPage extends StatefulWidget {
  const ExpenseMonthPage({super.key});

  @override
  State<ExpenseMonthPage> createState() => _ExpenseMonthPageState();
}

class _ExpenseMonthPageState extends State<ExpenseMonthPage> {
  late final bloc = context.read<EconomicBloc>();
  String? role;

  @override
  void initState() {
    super.initState();
    bloc.expensesMonth();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<EconomicBloc, EconomicState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).oylikHarajatlar),
                ),
              bottomNavigationBar:Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        text: S.of(context).oylikHarajatlarniKiritish,
                        onClick: () {
                          context.pushNamed(AppRoutes.createExpenseMonth.name);
                        },
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: AppElevatedButton(
                        text: S.of(context).statistikaniKorish,
                        onClick: () {
                          context.pushNamed(AppRoutes.expenseMonthStatistics.name);
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
                  : state.expensesMonth.isEmpty
                  ?  Center(
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
                isLoading: state.isPaging1,
                scrollOffset: 300,
                onEndOfPage: () => bloc.pagingExpensesMonth(),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.expensesMonth.length +
                      (state.isPaging1 ? 1 : 0),
                  itemBuilder: (context, index) => index ==
                      state.expensesMonth.length
                      ? const Center(child: CircularProgressIndicator())
                      : buildNewsItem(
                      context, state.expensesMonth[index], index,appState.lang),
                ),
              )
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(BuildContext context, ExpenseMonthModel? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
              text1: S.of(context).harajatTuri,
              text2: lang=='uz'? model?.expenseTypeNameUz ?? '--':model?.expenseTypeNameRu ?? '--'),
          AppRow(
              text1: S.of(context).harajatNomi,
              text2: model?.expenseName ?? '--'),
          AppRow(
              text1: S.of(context).harajatMiqdori,
              text2: "${model?.expenseAmount} so'm"),
          AppRow(
              text1: S.of(context).oy,
              text2: model?.date ?? '--'),
        ],
      ),
    ).animate().move().fade().slideY(
        begin: 1,
        end: 0,
        duration: 200.ms);
  }
}
