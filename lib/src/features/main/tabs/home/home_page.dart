import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final bloc = context.read<HomeBloc>();
  String? _region;

  @override
  void initState() {
    super.initState();
    Prefs.getString(AppConstants.kRole).then((onValue) {
      if (onValue != null) {
        bloc.me();
      }
    });
    bloc.places(_region);
    bloc.regions('');
    bloc.technologies();
    checkForUpdate();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> checkForUpdate() async {
    try {
      // Check for updates
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // Perform immediate update (full screen, no user interaction until updated)
          await InAppUpdate.performImmediateUpdate();
        } else if (updateInfo.flexibleUpdateAllowed) {
          // Perform flexible update (user can continue using the app)
          await InAppUpdate.startFlexibleUpdate();
          // Show a button or dialog to complete the update later
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Update downloaded. Tap to install."),
              action: SnackBarAction(
                label: "Install",
                onPressed: () {
                  InAppUpdate.completeFlexibleUpdate();
                },
              ),
            ),
          );
        }
      }
    } catch (e) {
      print("Error checking for update: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      S.of(context).baliqOviUchunMaskanlar,
                      style: CustomTextStyle.h18SB,
                    ),
                  ),
                  (state.regions?.isNotEmpty == true)
                      ? AppContainer(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.zero,
                          child: DropdownButtonFormField(
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              fillColor:
                                  Theme.of(context).colorScheme.onTertiary,
                              prefixIcon:
                                  const Icon(Icons.location_on_outlined),
                              border: appTextFiledTransparentBorder(),
                              enabledBorder: appTextFiledTransparentBorder(),
                              disabledBorder: appTextFiledTransparentBorder(),
                              focusedBorder: appTextFiledTransparentBorder(),
                              errorBorder: appTextFiledTransparentBorder(),
                            ),
                            hint: Text(S.of(context).viloyatniTanlang),
                            borderRadius: BorderRadius.circular(8),
                            items: state.regions?.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(appState.lang == 'uz'
                                    ? e.nameUz ?? '--'
                                    : e.nameRu ?? '--'),
                              );
                            }).toList(),
                            onChanged: (val) {
                              bloc.places(val?.id);
                              _region = val?.id;
                            },
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 300,
                    child: LazyLoadScrollView(
                      scrollDirection: Axis.horizontal,
                      isLoading: state.isPaging,
                      onEndOfPage: () => bloc.pagingPlaces(_region),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount:
                            state.places.length + (state.isPaging ? 1 : 0),
                        itemBuilder: (context, index) => index ==
                                state.places.length
                            ? const Center(child: CircularProgressIndicator())
                            : buildPlacesItem(context, state.places[index],
                                index, appState.lang),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      S.of(context).baliqBoqishUsullari,
                      style: CustomTextStyle.h18SB,
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
                          return buildTechnologyItem(context,
                              state.technologies?[index], index, appState.lang);
                        }),
                  ),
                ],
              ),
            );
          },
        );
      },
    ));
  }

  Widget buildPlacesItem(
      BuildContext context, PlaceModel? model, int index, String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.placeDetails.name, pathParameters: {
          'id': model?.id ?? '',
          'title':
              lang == 'uz' ? model?.addressUz ?? '--' : model?.titleRu ?? '--'
        });
      },
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width * 0.8,
                  imageUrl:
                      "${AppConstants.baseUrl}${model?.files?.first.path}",
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
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.mainColor2,
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(lang == 'uz'
                        ? model?.addressUz ?? '--'
                        : model?.titleRu ?? '--'))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTechnologyItem(
      BuildContext context, TechnologyModel? model, int index, String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(8),
      onTab: () {
        context.pushNamed(AppRoutes.technologyDetails.name,
            pathParameters: {'id': jsonEncode(model)});
      },
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppConstants.baseUrl}${model?.files?.first.path}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: AppColors.mainColor2,
                  )),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lang == 'uz' ? model?.nameUz ?? '--' : model?.nameRu ?? '--',
              style: CustomTextStyle.h16M,
            )
          ],
        ),
      ),
    );
  }
}
