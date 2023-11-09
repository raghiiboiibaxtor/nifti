import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:nifti_locapp/components/app_theme.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/button.dart';
import 'package:nifti_locapp/functions/functions.dart';
//import 'package:nifti_locapp/pages/connection_page.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  String pin = '3383';
  String email = 'email@mail.com';
  String password = 'password';
  //late ContactPincode pin;
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
                  NiftiFirestoreFunctions.deleteAccount();
                  Navigator.pop(context);
                },
                text: 'Delete Account',
              ),
              Button(
                onTap: () {
                  NiftiFirestoreFunctions.deleteProfile();
                  Navigator.pop(context);
                },
                text: 'Delete Profile',
              ),
              Text(pin),
              Button(
                onTap: () {
                  NiftiFirestoreFunctions.deleteContact(pin);
                  Navigator.pop(context);
                },
                text: 'Delete Contact',
              ),
              const Text('Authenticate with FaceID'),
              Button(
                onTap: () {
                  NiftiSystemSettings.getFaceID();
                  Navigator.pop(context);
                },
                text: 'Enable FaceID',
                color: niftiPink,
              ),
              const Text('Edit Account Info'),
              Text(email),
              Text(password),
              Button(
                onTap: () {
                  NiftiFirestoreFunctions.updateEmail(email);
                  Navigator.pop(context);
                },
                text: 'Update Account',
                color: niftiPink,
              ),
            ],
          ),
        ));
  }
}
