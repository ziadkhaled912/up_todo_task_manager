import 'package:flutter/material.dart';
import 'package:quran_app/generated/l10n.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).signIn,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: S.of(context).usernameOrEmail,
                labelText: S.of(context).usernameOrEmail,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).password,
                labelText: S.of(context).password,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).forgetPassword,
                )),
          ],
        ),
      ),
    );
  }
}
