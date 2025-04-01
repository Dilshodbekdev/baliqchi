import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_elevated_button1.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class PlaceDetailsPage extends StatefulWidget {
  final String id;
  final String title;

  const PlaceDetailsPage({super.key, required this.id, required this.title});

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late final bloc = context.read<HomeBloc>();

  PageController controller = PageController();
  var _index = 0;

  @override
  void initState() {
    super.initState();
    bloc.placeDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              if (state.placeDetailsModel != null) {
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
                              state.placeDetailsModel?.files?.length ?? 0,
                              (index) {
                            return CachedNetworkImage(
                              width: MediaQuery.of(context).size.width * 0.8,
                              imageUrl:
                                  "${AppConstants.baseUrl}${state.placeDetailsModel?.files?[index].path}",
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
                          dotsCount:
                              state.placeDetailsModel?.files?.length ?? 0,
                          position: _index,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            appState.lang == 'uz'
                                ? state.placeDetailsModel?.titleUz ?? '--'
                                : state.placeDetailsModel?.titleRu ?? '--',
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Text(appState.lang == 'uz'
                            ? state.placeDetailsModel?.contentUz ?? '--'
                            : state.placeDetailsModel?.contentRu ?? '--',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(S.of(context).baliqchilarUchratganBaliqlar,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Wrap(
                        spacing: 3,
                        runSpacing: 2,
                        children: List.generate(state.placeDetailsModel?.fishTypes?.length ?? 0, (index) {
                          return Chip(
                            padding: EdgeInsets.zero,
                              side: BorderSide.none,
                              label: AppContainer(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Text(
                                  appState.lang == 'uz'
                                      ? (state.placeDetailsModel?.fishTypes?[index].nameUz ?? '--')
                                      : (state.placeDetailsModel?.fishTypes?[index].nameUz ?? '--'),
                                ),
                              ));
                        }),
                      ),
                      AppContainer(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        onTab: () {
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).baliqchilarUchunMuhim,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.mainColor2)),
                            AppRow(
                                text1: S.of(context).mavsum,
                                text2:
                                    "${state.placeDetailsModel?.startDate} ${state.placeDetailsModel?.endDate}"),
                            AppRow(
                                text1: S.of(context).kirsh,
                                text2: state.placeDetailsModel?.free == true
                                    ? "Tekin"
                                    : getCurrencySymbol(double.parse(
                                        state.placeDetailsModel?.fee ?? '0'))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).manzil,
                        style: CustomTextStyle.hint,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          appState.lang == 'uz'
                              ? state.placeDetailsModel?.addressUz ?? '--'
                              : state.placeDetailsModel?.addressRu ?? '--',
                          style: CustomTextStyle.h16SB,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                          ],
                        ),
                      ),
                      AppElevatedButton1(
                          text: S.of(context).seeMap,
                          onClick: () {
                            openMapsSheet(context);
                          }),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        );
      },
    );
  }

  Future<void> _openMap() async {
    try {
      final availableMaps = await MapLauncher.installedMaps;

      if (availableMaps.isNotEmpty) {
        await availableMaps.first.showMarker(
          coords: Coords(37.759392, -122.5107336),
          title: 'title',
        );
      } else {
        print("No maps installed");
      }
    } catch (e) {
      print(e);
    }
  }

  openMapsSheet(context) async {
    try {
      final coords = Coords(37.759392, -122.5107336);
      final title = "Ocean Beach";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  /*Future<void> _moveToLocation(double lat,double lon) async{
    (await mapController.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear,duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(target: Point(latitude: lat, longitude: lon),zoom: 16),
      )
    );
  }*/

  Widget buildTechnologyItem(
      BuildContext context, PlaceModel? model, int index) {
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
                Text(model?.addressUz ?? '--')
              ],
            )
          ],
        ),
      ),
    );
  }
}
