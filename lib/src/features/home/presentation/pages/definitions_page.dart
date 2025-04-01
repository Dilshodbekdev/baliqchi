
import 'dart:convert';

import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_container.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/util/funs.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DefinitionsPage extends StatefulWidget {
  const DefinitionsPage({super.key});

  @override
  State<DefinitionsPage> createState() => _DefinitionsPageState();
}

class _DefinitionsPageState extends State<DefinitionsPage> {
  late final bloc = context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.definitions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).tariflar),
              ),
              body: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.mainColor2,
                    ))
                  : state.definitions?.isEmpty == true
                      ? Center(
                          child: Text(
                            S.of(context).malumotTopilmadi,
                            style: CustomTextStyle.h16SB,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: state.definitions?.length,
                          itemBuilder: (context, index) {
                            return buildNewsItem(
                                context, state.definitions?[index], index,appState.lang);
                          }),
            );
          },
        );
      },
    );
  }

  Widget buildNewsItem(
      BuildContext context, DefinitionModel? model, int index,String lang) {
    return AppContainer(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      onTab: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/img_fish.png', height: 100),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  lang=='uz'?
                  model?.paymentTypeUz ?? '--':
                  model?.paymentTypeRu ?? '--',
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.mainColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
            ],
          ),
          Text(
            getCurrencySymbol(model?.price?.toDouble() ?? 0),
            style: const TextStyle(
              fontSize: 32,
              color: AppColors.mainColor1,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: AppColors.mainColor1)),
                  padding: const EdgeInsets.all(0)),
              onPressed: () {
                context.pushNamed(AppRoutes.payMeCard.name,
                    pathParameters: {'model': jsonEncode(model)});
              },
              child: Text(
                S.of(context).tanlash,
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
    ).animate().move().fade().slideY(begin: 1, end: 0, duration: 200.ms);
  }
}
