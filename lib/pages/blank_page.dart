import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/button.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // ? Top bar that contains Nifti Logo

        // *** Settings page UI & logic starts here
        body: Container(
          alignment: AlignmentDirectional.topStart,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // ? Logout
              const SizedBox(
                height: 20,
              ),
              Button(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                text: 'Logout',
                icon: Icons.logout_rounded,
                iconColor: niftiPink,
              ),
            ],
          ),
        ));
  }
}
