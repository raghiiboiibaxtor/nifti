import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/button.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/privacy_popup.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: niftiOffWhite,
        resizeToAvoidBottomInset: false,
        // ? Top bar that contains Nifti Logo
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(40))),
          // ? Appbar Theme
          iconTheme: CupertinoIconThemeData(color: niftiOffWhite, size: 23),
          elevation: 2,
          shadowColor: niftiGreyShadow,
          surfaceTintColor: niftiOffWhite,
          toolbarHeight: 40,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: niftiGradient,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(40))),
          ),
          // ? Go Back
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              semanticLabel: 'Back',
            ),
          ),
          // ? Nifti Logo
          title: SizedBox(
            width: 70,
            child: Image.asset('images/nifti_logo_white.png'),
          ),
        ),
        // *** Settings page UI & logic starts here
        body: Container(
          alignment: AlignmentDirectional.topStart,
          padding: const EdgeInsets.only(top: 15, left: 15, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: niftiGrey,
                ),
              ),
              // ? Logout
              const SizedBox(
                height: 10,
              ),
              // ? Account Title & Buttons
              TextDisplay(
                text: 'Account',
                color: niftiLightGrey,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                onTap: () {
                  // ! popup logic here
                },
                text: 'Change Email Address',
                icon: Icons.alternate_email_rounded,
                iconColor: niftiLightBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                onTap: () {
                  // ! popup logic here
                },
                text: 'Update Password',
                icon: Icons.lock_outline_rounded,
                iconColor: niftiLightBlue,
              ),
              // ? Divider & space between 
              const SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 0.5,
                color: niftiGreyShadow,
              ),
              const SizedBox(
                height: 10,
              ),
              // ? Account Title & Buttons
              TextDisplay(
                text: 'Privacy & Security',
                color: niftiLightGrey,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                onTap: () {
                  // ! popup logic here
                },
                text: 'FaceID',
                icon: Icons.alternate_email_rounded,
                iconColor: niftiDarkBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                onTap: () {
                  // ! popup logic here
                },
                text: 'Block List',
                icon: Icons.block,
                iconColor: niftiDarkBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                onTap: () {
                  // ! popup logic here
                  privacyPopup(context);
                },
                text: 'Privacy Policy',
                icon: Icons.privacy_tip_outlined,
                iconColor: niftiDarkBlue,
              ),
              // ? Divider & space between 
              const SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 0.5,
                color: niftiGreyShadow,
              ),
              const SizedBox(
                height: 15,
              ),
              // ? Danger Zone Title & Buttons
              TextDisplay(
                text: 'Danger Zone',
                color: niftiPink,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 20,
              ),
              Button(
                onTap: () {
                  // ! pop up logic here
                },
                text: 'Delete Account',
                icon: CupertinoIcons.delete,
                iconColor: niftiPink,
              ),
            ],
          ),
        ));
  }
}
