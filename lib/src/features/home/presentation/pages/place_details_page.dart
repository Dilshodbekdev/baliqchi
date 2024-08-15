import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/components/app_row.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceDetailsPage extends StatefulWidget {
  final String id;

  const PlaceDetailsPage({super.key, required this.id});

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
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
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
                          state.placeDetailsModel?.files?.length ?? 0, (index) {
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
                      dotsCount: state.placeDetailsModel?.files?.length ?? 0,
                      position: _index,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(state.placeDetailsModel?.titleUz ?? '--',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(state.placeDetailsModel?.contentUz ?? '--',
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
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List.generate(
                        state.placeDetailsModel?.fishTypes?.length ?? 0,
                        (index) {
                      return Chip(
                        side: BorderSide.none,
                          label: AppContainer(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            child: Text(state.placeDetailsModel?.fishTypes?[index]
                                    .nameUz ??
                                '--'),
                          ));
                    }),
                  ),
                  AppContainer(
                    margin: const EdgeInsets.all(16),
                    onTab: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            S.of(context).baliqchilarUchunMuhim,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainColor2
                            )
                        ),
                        AppRow(text1: S.of(context).mavsum, text2: "${state.placeDetailsModel?.startDate} ${state.placeDetailsModel?.endDate}"),
                        AppRow(text1: S.of(context).kirsh, text2: "${state.placeDetailsModel?.free==true?"Tekin":state.placeDetailsModel?.fee}"),
                        AppRow(text1: S.of(context).manzil, text2: state.placeDetailsModel?.addressUz??"--"),
                      ],
                    ),
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
                        itemCount: state.places.length,
                        itemBuilder: (context, index) {
                          return buildTechnologyItem(context, state.places[index], index);
                        }),
                  ),
                  const SizedBox(height: 16,)
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

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
