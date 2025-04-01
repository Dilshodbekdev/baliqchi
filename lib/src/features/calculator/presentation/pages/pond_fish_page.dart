import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PondFishPage extends StatefulWidget {
  final String pondJson;

  const PondFishPage({super.key, required this.pondJson});

  @override
  State<PondFishPage> createState() => _PondFishPageState();
}

class _PondFishPageState extends State<PondFishPage> {
  PondModel? pondModel;

  @override
  void initState() {
    super.initState();
    pondModel = PondModel.fromJson(jsonDecode(widget.pondJson));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                "${pondModel?.name} - ${appState.lang == 'uz' ? pondModel?.fishTypeNameUz : pondModel?.fishTypeNameRu}"),
          ),
          body: SingleChildScrollView(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(
                                    color: AppColors.mainColor2)),
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          context.pushNamed(AppRoutes.pondDetails.name,
                              pathParameters: {'pond': jsonEncode(pondModel)});
                        },
                        child: Text(
                          S.of(context).umumiyMalumotlar,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(
                                    color: AppColors.mainColor2)),
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          context.pushNamed(AppRoutes.generalCalculations.name,
                              pathParameters: {'pond': jsonEncode(pondModel)});
                        },
                        child: Text(
                          S.of(context).ozuqaHaqidaMalumotlar,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(
                                    color: AppColors.mainColor2)),
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          context.pushNamed(AppRoutes.fishDeclineHistory.name,
                              pathParameters: {'pond': jsonEncode(pondModel)});
                        },
                        child: Text(
                          S.of(context).havzaTarixi,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
