import 'package:flutter/material.dart';
import 'package:quran_app/core/widgets/app_button.dart';
import 'package:quran_app/features/auth/login/widgets/login_form_card.dart';
import 'package:quran_app/features/auth/register/register_page.dart';
import 'package:quran_app/generated/l10n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  width: MediaQuery.sizeOf(context).width * 0.4,
                ),
                const SizedBox(height: 25),
                const LoginFormCard(),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: AppButton(
                    title: S.of(context).login,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).newUser,),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                      child: Text(S.of(context).signUp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
