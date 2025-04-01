import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillingsPage extends StatefulWidget {
  const BillingsPage({super.key});

  @override
  State<BillingsPage> createState() => _BillingsPageState();
}

class _BillingsPageState extends State<BillingsPage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.billings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(S.of(context).tariflar),
                ),
                body: state.isLoading
                    ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor2,
                    ),
                )
                    : state.billings?.isEmpty==true
                    ? Center(
                  child: Text(
                    S.of(context).malumotTopilmadi,
                    style: CustomTextStyle.h16SB,
                  ),
                )
                    : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: state.billings?.length,
                    itemBuilder: (context, index) {
                      return buildNewsItem(
                          context, state.billings?[index], index,appState.lang);
                    }),
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(BuildContext context, BillingModel? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      onTab: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRow(
              text1: S.of(context).tarifTuri,
              text2: lang=='uz'? model?.paymentTypeUz ?? '--':model?.paymentTypeRu ?? '--'),
          AppRow(
              text1: S.of(context).tolovSummasi,
              text2: model?.price.toString() ?? '--'),
          AppRow(
              text1: S.of(context).amalQilishMuddati,
              text2: "${model?.paymentDate?.split(' ').first}\n${model?.endDate?.split(' ').first}"),
        ],
      ),
    ).animate().move().fade().slideY(
        begin: 1,
        end: 0,
        duration: 200.ms);
  }

}
