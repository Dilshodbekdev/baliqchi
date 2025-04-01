import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/config/components/app_elevated_button.dart';
import 'package:baliqchi/src/config/components/text_field_components.dart';
import 'package:baliqchi/src/config/theme/app_colors.dart';
import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum SingingCharacter { text1, text2, text3 }

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  SingingCharacter? _character = SingingCharacter.text1;

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late final bloc = context.read<AuthBloc>();
    String question = "";

    final textCon = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).deleteAccount,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.hasError) {
            snackBar(state.errorMessage);
          }
          if(state.isDeleteAccount){
            context.goNamed(AppRoutes.login.name);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.info,
                          color: Colors.red,
                        ),
                        Text(
                          S.of(context).foydalanuvchiTizimdanOchirilgandanSongUningShaxsiyMalumotlariVaMurojaatlarBilan,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          S
                              .of(context)
                              .foydalanuvchiniTizimdanOchirishFoydalanuvchiningQarorigaQarabAmalgaOshiriladiHurmatliFoydalanuvchi,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      RadioListTile<SingingCharacter>(
                        title: Text(
                          S
                              .of(context)
                              .mobilTelefonBilanBogliqSabablarTelefonningYoqolishiBoshqaOdamgaBerib,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        value: SingingCharacter.text1,
                        activeColor: AppColors.buttonColorDark,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        title: Text(
                          S
                              .of(context)
                              .ilovaBilanBogliqSabablarIlovaningKorishiTushunarsizIlovadanFoydalanishQiyin,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        value: SingingCharacter.text2,
                        groupValue: _character,
                        activeColor: AppColors.buttonColorDark,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      RadioListTile<SingingCharacter>(
                        title: Text(
                          S.of(context).boshqaMasalalar,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        value: SingingCharacter.text3,
                        groupValue: _character,
                        activeColor: AppColors.buttonColorDark,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            cursorColor:
                            Theme.of(context).colorScheme.tertiary,
                            maxLines: 1000,
                            controller: textCon,
                            style: const TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText:
                              S.of(context).qoshimchaIzohQoldirish,
                              hintStyle: const TextStyle(fontSize: 14),
                              contentPadding: const EdgeInsets.all(12),
                              isCollapsed: true,
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .onTertiary,
                              errorStyle: const TextStyle(height: 0),
                              border: appTextFiledBorder(),
                              enabledBorder:
                              appTextFiledBorder(),
                              disabledBorder:
                              appTextFiledBorder(),
                              focusedBorder:
                              appTextFiledBorder(),
                              errorBorder: appTextFiledErrorBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                state.isLoading
                    ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.tertiary,
                    ))
                    : AppElevatedButton(
                    text: S.of(context).hisobniOchirish,
                    onClick: () {
                      bloc.deleteAccount();
                    }),

              ],
            ),
          );
        },
      ),
    );
  }
}
