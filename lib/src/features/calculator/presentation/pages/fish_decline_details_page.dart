
import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/widgets/details_economic_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class FishDeclineDetailsPage extends StatefulWidget {
  const FishDeclineDetailsPage({super.key});

  @override
  State<FishDeclineDetailsPage> createState() => _FishDeclineDetailsPageState();
}

class _FishDeclineDetailsPageState extends State<FishDeclineDetailsPage> {
  late final bloc = context.read<CalculatorBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).umumiyMalumotlar),
        actions: [
          IconButton(
              onPressed: () {
                bloc.deleteFishDecline(bloc.state.fishDeclineDetailsModel?.id??'');
              },
              icon: const Icon(
                CupertinoIcons.delete,
                color: AppColors.mainRedColor,
              ))
        ],
      ),
      body: BlocConsumer<CalculatorBloc, CalculatorState>(
        listener: (context, state){
          if (state.isDeleted) {
            toastification.show(
                title: Text(state.deleteGeneralCalculationModel?.message ?? '--'),
                type: ToastificationType.info,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                icon: const Icon(Icons.check_circle_outline),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 3.seconds,
                primaryColor: AppColors.mainGreenColor);
            bloc.fishDeclines(bloc.state.ponds?.first.id??'');
            context.pop();
          }
          if (state.hasError) {
            toastification.show(
                title: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 16),
                ),
                type: ToastificationType.error,
                alignment: Alignment.bottomCenter,
                showProgressBar: false,
                style: ToastificationStyle.fillColored,
                autoCloseDuration: 8.seconds,
                primaryColor: AppColors.mainRedColor);
          }
        },
        builder: (context, state) {
          return state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.mainColor2,
                ))
              : BlocBuilder<AppCubit, AppState>(
                  builder: (context, appState) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        AppContainer(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              DetailsEconomicListTile(
                                title: S.of(context).boqishUsuli,
                                currency: state.fishDeclineDetailsModel?.declineType == 'SOLD'
                                    ? S.of(context).sotilgan
                                    : S.of(context).olgan,
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqTuri,
                                currency: appState.lang == 'uz'
                                    ? state.fishDeclineDetailsModel?.fishTypeNameUz ??
                                        '--'
                                    : state.fishDeclineDetailsModel?.fishTypeNameRu ??
                                        '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqSoni,
                                currency: state.fishDeclineDetailsModel?.fishAmount
                                        .toString() ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqOgirligiG,
                                currency: state.fishDeclineDetailsModel?.weight
                                        .toString() ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).havzaNomi,
                                currency: state.fishDeclineDetailsModel?.pondName??'--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).izoh,
                                currency: state.fishDeclineDetailsModel?.description??'--',
                              ),
                            ],
                          ),
                        )
                      ]),
                    );
                  },
                );
        },
      ),
    );
  }
}
