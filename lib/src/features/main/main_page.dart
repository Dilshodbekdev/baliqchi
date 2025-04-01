import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_divider.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/config/theme/text_styles.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/app_state/localization.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/main/manger/main_cubit.dart';
import 'package:baliqchi/src/features/main/tabs/calculator/calculator_page.dart';
import 'package:baliqchi/src/features/main/tabs/diseases/diseases_page.dart';
import 'package:baliqchi/src/features/main/tabs/economic/economic_page.dart';
import 'package:baliqchi/src/features/main/tabs/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const CalculatorPage(),
    const DiseasesPage(),
    const EconomicPage()
  ];

  String getTitle(int index){
    List<String> titles=[
      "Baliqchiga Ko'makchi",
      S.of(context).boqilayotganBaliqlar,
      S.of(context).kasallikTurlari,
      S.of(context).iqtisodiyKorsatkichlar,
    ];
    return titles[index];
  }

  late final cubit = context.read<AppCubit>();

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return BlocBuilder<MainCubit, MainState>(
  builder: (context, stateMain) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(stateMain.selectedIndex)),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
           stateMain.name!=null?
           UserAccountsDrawerHeader(
              accountName: Text(stateMain.name??'--'),
              accountEmail: Text(stateMain.name??'--'),
              currentAccountPicture: CircleAvatar(
                child: Text(stateMain.name?[0].toUpperCase()??'',style: CustomTextStyle.h22SB,),
              ),
              onDetailsPressed: (){

              },
              decoration: const BoxDecoration(color: AppColors.mainColor1),
            ):DrawerHeader(child: Column(
              children: [
                AppElevatedButton(text: S.of(context).kirish, onClick: (){
                  context.pushNamed(AppRoutes.login.name);
                }),
              ],
            )),
            /*ListTile(
              dense: true,
              leading: SvgPicture.asset('assets/icons/ic_card.svg'),
              title: Text(
                S.of(context).tolovlarTarixi,
                style: CustomTextStyle.h16SB,
              ),
              onTap: () {
                context.pushNamed(AppRoutes.billings.name);
              },
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset('assets/icons/ic_subscription.svg'),
              title:  Text(
                S.of(context).tariflar,
                style: CustomTextStyle.h16SB,
              ),
              onTap: () {
                context.pushNamed(AppRoutes.definitions.name);
              },
            ),*/
            ExpansionTile(
              dense: true,
              leading: SvgPicture.asset(
                'assets/icons/ic_language.svg',
              ),
              title: Text(
                S.of(context).tilniOzgartirish,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              iconColor: Theme.of(context).colorScheme.tertiary,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppDivider(),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    cubit.changeLocale(Localization.uz, 'uz');
                  },
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SvgPicture.asset('assets/icons/uz.svg',height: 30,)),
                  title: const Text(
                    "O'zbek",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      value: state.lang=='uz',
                      onChanged: (v){
                        cubit.changeLocale(Localization.uz, 'uz');
                      }),
                ).animate().move().fade().slideY(duration: 200.ms),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: AppDivider(),
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    cubit.changeLocale(Localization.ru, 'ru');
                  },
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SvgPicture.asset('assets/icons/ru.svg',height: 30,)),
                  title: const Text(
                    "Русский",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: state.lang=='ru',
                      onChanged: (v){
                        cubit.changeLocale(Localization.ru, 'ru');
                      }),
                ).animate().move().fade().slideY(duration: 250.ms)
              ],
            ),
            const AppDivider(),
            ListTile(
              dense: true,
              leading: SvgPicture.asset('assets/icons/ic_logout.svg'),
              title: Text(
                S.of(context).chiqish,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.red
                )
              ),
              onTap: () {
                //_showMyDialog();
                context.goNamed(AppRoutes.login.name);
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(CupertinoIcons.delete,color: AppColors.mainRedColor,),
              title: Text(
                  S.of(context).deleteAccount,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red
                  )
              ),
              onTap: () {
                //_showMyDialog();
                context.pushNamed(AppRoutes.deleteAccount.name);
              },
            ),
          ],
        ),
      ),
      body: switch(stateMain.selectedIndex){
        0 || 2 => pages[stateMain.selectedIndex],
        1 || 3 => stateMain.name==null?Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    S.of(context).loremIpsumDolorSitAmetConsecteturAdipiscingElitSedDo,
                  style: CustomTextStyle.h16SB,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                AppElevatedButton(
                    text: S.of(context).tizimgaKirish,
                    onClick: () {
                      context.pushNamed(AppRoutes.login.name);
                    },
                    bgColor: AppColors.mainColor2,
                    textColor: Colors.white)
              ],
            ),
          ),
        ):pages[stateMain.selectedIndex],
        _ => const Center(child: Text('Error'))
    },
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            context.read<MainCubit>().selectTab(value);
          },
          currentIndex: stateMain.selectedIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                color: AppColors.mainColor2,
              ),
              icon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_calculator.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_calculator.svg',
                  color: AppColors.mainColor2,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_diseases.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_diseases.svg',
                  color: AppColors.mainColor2,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/ic_economic.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_economic.svg',
                  color: AppColors.mainColor2,
                ),
                label: ""),
          ]),
    );
  },
);
  },
);
  }
}
