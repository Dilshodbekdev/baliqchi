import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/presentation/manager/disease_bloc.dart';
import 'package:baliqchi/src/features/diseases/presentation/pages/widgets/disease_details_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiseaseDetailsPage extends StatefulWidget {
  final String id;

  const DiseaseDetailsPage({super.key, required this.id});

  @override
  State<DiseaseDetailsPage> createState() => _DiseaseDetailsPageState();
}

class _DiseaseDetailsPageState extends State<DiseaseDetailsPage> {
  late final bloc = context.read<DiseaseBloc>();

  PageController controller = PageController();
  var _index = 0;

  @override
  void initState() {
    super.initState();
    bloc.disease(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DiseaseBloc, DiseaseState>(
  builder: (context, stateDisease) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              appState.lang == 'uz' ? stateDisease.diseaseModel?.nameUz ?? '--' : stateDisease.diseaseModel?.nameRu ?? '--',
            ),
          ),
          body: stateDisease.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.mainColor2,)) :SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 380,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      setState(() {
                        _index = value;
                      });
                    },
                    children: List.generate(
                        stateDisease.diseaseModel?.files?.length ?? 0, (index) {
                      return CachedNetworkImage(
                        width: MediaQuery.of(context).size.width * 0.8,
                        imageUrl:
                        "${AppConstants.baseUrl}${stateDisease.diseaseModel?.files?[index].path}",
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
                        fit: BoxFit.fill,
                      );
                    }),
                  ),
                ),
                stateDisease.diseaseModel!=null?
                Center(
                  child: DotsIndicator(
                    decorator: DotsDecorator(
                      activeColor: AppColors.mainColor2,
                      color: AppColors.bottomNavNoActiveIconColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    dotsCount: stateDisease.diseaseModel?.files?.length ?? 0,
                    position: _index,
                  ),
                ):const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      appState.lang == 'uz'
                          ? stateDisease.diseaseModel?.nameUz ?? '--'
                          : stateDisease.diseaseModel?.nameRu ?? '--',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Text(
                      appState.lang == 'uz'
                          ? stateDisease.diseaseModel?.contentUz ?? '--'
                          : stateDisease.diseaseModel?.contentRu ?? '--',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DiseaseDetailsContainer(
                  color: AppColors.mainYellowColor,
                  title: S.of(context).omillari,
                  content: appState.lang == 'uz'
                      ? stateDisease.diseaseModel?.factorsUz ?? '--'
                      : stateDisease.diseaseModel?.factorsRu ?? '--',
                ),
                DiseaseDetailsContainer(
                  color: AppColors.mainRedColor,
                  title: S.of(context).sindromlari,
                  content: appState.lang == 'uz'
                      ? stateDisease.diseaseModel?.syndromesUz ?? '--'
                      : stateDisease.diseaseModel?.syndromesRu ?? '--',
                ),
                DiseaseDetailsContainer(
                  color: AppColors.mainGreenColor,
                  title: S.of(context).davolashUsuli,
                  content: appState.lang == 'uz'
                      ? stateDisease.diseaseModel?.treatmentMethodUz ?? '--'
                      : stateDisease.diseaseModel?.treatmentMethodRu ?? '--',
                ),
                const SizedBox(height: 16)
              ],
            ),
          ),
        );
  },
);
      },
    );
  }

  Widget buildTechnologyItem(
      BuildContext context, DiseaseModel? model, int index, String lang) {
    return AppContainer(
      onTab: () {},
      child: SizedBox(
        height: 164,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.mainColor2,
                ),
                Text(
                  lang == 'uz' ? model?.nameUz ?? '--' : model?.nameRu ?? '--',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
