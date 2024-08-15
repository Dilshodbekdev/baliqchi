import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/presentation/manager/disease_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

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
  DiseaseModel? diseaseModel;

  @override
  void initState() {
    super.initState();
    diseaseModel=DiseaseModel.fromJson(jsonDecode(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseModel?.nameUz??'--'),
      ),
      body: BlocBuilder<DiseaseBloc, DiseaseState>(
        builder: (context, state) {
            return SingleChildScrollView(
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
                          diseaseModel?.files?.length ?? 0, (index) {
                        return CachedNetworkImage(
                          width: MediaQuery.of(context).size.width * 0.8,
                          imageUrl:
                              "${AppConstants.baseUrl}${diseaseModel?.files?[index].path}",
                          fit: BoxFit.fill,
                        );
                      }),
                    ),
                  ),
                  DotsIndicator(
                    decorator: DotsDecorator(
                      activeColor: AppColors.bottomNavActiveIconColor,
                      color: AppColors.bottomNavNoActiveIconColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    dotsCount: diseaseModel?.files?.length ?? 0,
                    position: _index,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(diseaseModel?.nameUz ?? '--',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(diseaseModel?.contentUz ?? '--',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Html(
                    data: diseaseModel?.syndromesUz??'--',
                    shrinkWrap: false,
                  ),
                  Html(
                    data: diseaseModel?.treatmentMethodUz??'--',
                    shrinkWrap: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(S.of(context).baliqchilarUchratganBaliqlar,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Text(
                      S.of(context).oxshashMaskanlar,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  SizedBox(
                    height: 164,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.disease.length,
                        itemBuilder: (context, index) {
                          return buildTechnologyItem(context, state.disease[index], index);
                        }),
                  ),
                  const SizedBox(height: 16,)
                ],
              ),
            );
        },
      ),
    );
  }

  Widget buildTechnologyItem(
      BuildContext context, DiseaseModel? model, int index) {
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
                Text(model?.nameUz ?? '--')
              ],
            )
          ],
        ),
      ),
    );
  }
}
