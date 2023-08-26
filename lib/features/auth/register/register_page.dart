import 'package:flutter/material.dart';
import 'package:quran_app/core/widgets/app_button.dart';
import 'package:quran_app/features/auth/register/widgets/register_form_card.dart';
import 'package:quran_app/features/home/home_page.dart';
import 'package:quran_app/generated/l10n.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/app_logo.png",
                    width: MediaQuery.sizeOf(context).width * 0.4,
                  ),
                  const SizedBox(height: 25),
                  const RegisterFormCard(),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: AppButton(
                      title: S.of(context).signUp,
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).alreadyHaveAnAccount,),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, child: Text(S.of(context).login)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
