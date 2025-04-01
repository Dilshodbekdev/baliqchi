import 'dart:async';

import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      final String token = await Prefs.getString(AppConstants.kRole) ?? "";
      debugPrint(token);
      context.goNamed(AppRoutes.main.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/img_logo_splash.png')),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/img_splash.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          },
        ));
  }
}
