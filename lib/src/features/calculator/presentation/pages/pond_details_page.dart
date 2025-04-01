import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/widgets/details_economic_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PondDetailsPage extends StatefulWidget {
  final String pondJson;

  const PondDetailsPage({super.key, required this.pondJson});

  @override
  State<PondDetailsPage> createState() => _PondDetailsPageState();
}

class _PondDetailsPageState extends State<PondDetailsPage> {
  late final bloc = context.read<CalculatorBloc>();
  PondModel? pondModel;

  @override
  void initState() {
    super.initState();
    pondModel = PondModel.fromJson(jsonDecode(widget.pondJson));
    bloc.pondDetails(pondModel?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).umumiyMalumotlar),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(
                AppRoutes.createPond.name,pathParameters: {
              'pond': jsonEncode(bloc.state.pontDetailsModel)
            });
          }, icon: const Icon(Icons.edit))
        ],
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  width: MediaQuery.of(context).size.width,
                                  imageUrl:
                                      "${AppConstants.baseUrl}${pondModel?.files?.first.path}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const AppDivider(),
                              DetailsEconomicListTile(
                                title: S.of(context).boqishUsuli,
                                currency: appState.lang == 'uz'
                                    ? state.pontDetailsModel
                                            ?.technologyNameUz ??
                                        '--'
                                    : state.pontDetailsModel
                                            ?.technologyNameRu ??
                                        '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqTuri,
                                currency: appState.lang == 'uz'
                                    ? state.pontDetailsModel?.fishTypeNameUz ??
                                        '--'
                                    : state.pontDetailsModel?.fishTypeNameRu ??
                                        '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqSoni,
                                currency: state.pontDetailsModel?.fishAmount.toString() ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqOgirligiG,
                                currency: state.pontDetailsModel?.startWeight
                                        .toString() ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).suvHajmiM,
                                currency: state.pontDetailsModel?.volume?.toStringAsFixed(2)??'--',
                              ),
                              DetailsEconomicListTile(
                                title: S.of(context).baliqlarningZichligiKgm3,
                                currency: state.pontDetailsModel?.density?.toStringAsFixed(2) ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title:
                                    S.of(context).baliqningYashabQolishDarajasi,
                                currency: state
                                        .pontDetailsModel?.probabilitySurvival
                                        .toString() ??
                                    '--',
                              ),
                              DetailsEconomicListTile(
                                title:
                                    S.of(context).yashabQoladiganBaliqlarSoni,
                                currency:
                                (((state.pontDetailsModel?.fishAmount ?? 0) * (state.pontDetailsModel?.probabilitySurvival ?? 0)) / 100).toStringAsFixed(0),
                              ),
                              DetailsEconomicListTile(
                                title: S
                                    .of(context)
                                    .mavsumOxiridagiMoljallanganBaliqOgirligiG,
                                currency: state.pontDetailsModel?.endWeight
                                        .toString() ??
                                    '--',
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
