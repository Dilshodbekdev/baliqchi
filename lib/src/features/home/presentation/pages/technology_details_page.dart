import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TechnologyDetailsPage extends StatefulWidget {
  final String id;

  const TechnologyDetailsPage({super.key, required this.id});

  @override
  State<TechnologyDetailsPage> createState() => _TechnologyDetailsPageState();
}

class _TechnologyDetailsPageState extends State<TechnologyDetailsPage> {
  late final bloc = context.read<HomeBloc>();

  PageController controller = PageController();
  var _index = 0;
  TechnologyModel? model;

  @override
  void initState() {
    super.initState();
    model=TechnologyModel.fromJson(jsonDecode(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, appState) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appState.lang=='uz'?
            model?.nameUz??'--':
              model?.nameRu??'--'
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
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
                          model?.files?.length ?? 0, (index) {
                        return CachedNetworkImage(
                          width: MediaQuery.of(context).size.width * 0.8,
                          imageUrl:
                          "${AppConstants.baseUrl}${model?.files?[index].path}",
                          fit: BoxFit.fill,
                        );
                      }),
                    ),
                  ),
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
                      dotsCount: model?.files?.length ?? 0,
                      position: _index,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      appState.lang=='uz'?
                      model?.nameUz??'--':
                      model?.nameRu??'--',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(appState.lang=='uz'?
                    model?.contentUz??'--':
                    model?.contentRu??'--',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        S.of(context).baliqBoqishUsullari,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.technologies?.length,
                        itemBuilder: (context, index) {
                          return buildTechnologyItem(context, state.technologies?[index], index,appState.lang);
                        }),
                  ),
                  const SizedBox(height: 16,)
                ],
              ),
            );
        },
      ),
    );
  },
);
  }

  Widget buildTechnologyItem(
      BuildContext context, TechnologyModel? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.technologyDetails.name,pathParameters: {'id':jsonEncode(model)});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(lang=='uz'?
          model?.nameUz??'--':
          model?.nameRu??'--',style: CustomTextStyle.h16M,)
        ],
      ),
    );
  }
}
