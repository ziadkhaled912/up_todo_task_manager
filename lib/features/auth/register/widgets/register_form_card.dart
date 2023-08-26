import 'package:flutter/material.dart';
import 'package:quran_app/generated/l10n.dart';

class RegisterFormCard extends StatefulWidget {
  const RegisterFormCard({super.key});

  @override
  State<RegisterFormCard> createState() => _RegisterFormCardState();
}

class _RegisterFormCardState extends State<RegisterFormCard> {
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
              S.of(context).signUp,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: S.of(context).username,
                labelText: S.of(context).username,
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "This Field Is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: S.of(context).email,
                labelText: S.of(context).email,
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "This Field Is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).password,
                labelText: S.of(context).password,
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "This Field Is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).confirmPassword,
                labelText: S.of(context).confirmPassword,
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "This Field Is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
