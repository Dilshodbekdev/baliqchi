import 'dart:convert';
import 'dart:io';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/presentation/manager/disease_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:path_provider/path_provider.dart';

class DiseasesPage extends StatefulWidget {
  const DiseasesPage({super.key});

  @override
  State<DiseasesPage> createState() => _DiseasesPageState();
}

class _DiseasesPageState extends State<DiseasesPage> {
  late final bloc = context.read<DiseaseBloc>();

  @override
  void initState() {
    super.initState();
    bloc.diseases('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<DiseaseBloc, DiseaseState>(
          builder: (context, state) {
            return Scaffold(
                body: Column(
              children: [
                AppContainer(
                  margin: const EdgeInsets.all(16),
                  padding: EdgeInsets.zero,
                  child: TextField(
                    onChanged: (val) {
                      bloc.diseases(val);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      hintText: S.of(context).qidirish,
                      prefixIcon: const Icon(Icons.search),
                      border: appTextFiledTransparentBorder(),
                      enabledBorder: appTextFiledTransparentBorder(),
                      disabledBorder: appTextFiledTransparentBorder(),
                      focusedBorder: appTextFiledTransparentBorder(),
                      errorBorder: appTextFiledTransparentBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: LazyLoadScrollView(
                    isLoading: state.isPaging,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingDiseases(''),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount:
                          state.disease.length + (state.isPaging ? 1 : 0),
                      itemBuilder: (context, index) =>
                          index == state.disease.length
                              ? const Center(child: CircularProgressIndicator())
                              : buildNewsItem(context, state.disease[index],
                                  index, appState.lang),
                    ),
                  ),
                ),
              ],
            ));
          },
        );
      },
    );
  }

  Widget buildNewsItem(
      BuildContext context, DiseaseModel? model, int index, String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.diseaseDetails.name,
            pathParameters: {'id':model?.id??''});
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              height: 100,
              width: 100,
              imageUrl: "${AppConstants.baseUrl}${model?.files?.first.path}",
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
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              lang == 'uz' ? model?.nameUz ?? '--' : model?.nameRu ?? '--',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 100.ms);
  }

  Future<String> fetchImageUrl(String url) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60 * 1000),
        receiveTimeout: const Duration(seconds: 60 * 1000),
        listFormat: ListFormat.multiCompatible,
      ),
    );
    dio.interceptors.add(CookieManager(PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    )));

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      // Parse the response to get the image URL
      final imageUrl = response
          .data['imageUrl']; // Adjust this according to your API response
      return imageUrl;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
