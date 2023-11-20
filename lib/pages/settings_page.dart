import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/button.dart';
import 'package:nifti_locapp/components/button_with_switch.dart';
import 'package:nifti_locapp/components/logout_modal.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/privacy_popup.dart';
import 'package:nifti_locapp/pages/change_email_page.dart';
import 'package:nifti_locapp/pages/change_password_page.dart';
import 'package:nifti_locapp/pages/coming_soon_page.dart';
import 'package:nifti_locapp/pages/delete_account_page.dart';

// ? SettingsPage == display user's settings options

// * ---------------- * (STATEFUL WIDGET) CLASS SettingsPage (STATEFUL WIDGET) * ---------------- *
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
// * ---------------- * END OF (STATE) CLASS SettingdPage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _SettingsPageState (STATE) * ---------------- *
class _SettingsPageState extends State<SettingsPage> {
  // * * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: niftiOffWhite,
        resizeToAvoidBottomInset: false,
        // ? Top bar that contains Nifti Logo
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: BackAppBar(),
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
              // ? Change Email Button
              Button(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ChangeEmail();
                  },
                )),
                text: 'Change Email Address',
                icon: Icons.alternate_email_rounded,
                iconColor: niftiLightBlue,
                showArrowIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // ? Change Password Button
              Button(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ChangePassword();
                  },
                )),
                text: 'Update Password',
                icon: Icons.lock_outline_rounded,
                iconColor: niftiLightBlue,
                showArrowIcon: true,
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
              // ? Toggle FaceID Button
              ButtonSwitch(
                text: 'FaceID',
                icon: Icons.lock_person_outlined,
                iconColor: niftiDarkBlue,
                showSwitch: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // ? View Block List Button
              Button(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ComingSoon();
                  },
                )),
                text: 'Block List',
                icon: Icons.block,
                iconColor: niftiDarkBlue,
                showArrowIcon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // ? View Privacy Policy Button
              Button(
                onTap: () {
                  // ? Popup Modal
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
                color: niftiError,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              // ? Logout Button
              Button(
                onTap: () {
                  // ? Popup modal
                  confirmLogoutModal(context);
                },
                text: 'Logout',
                icon: Icons.logout_rounded,
                iconColor: niftiError,
              ),
              const SizedBox(
                height: 20,
              ),
              // ? Delete Account Button
              Button(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DeleteAccount();
                  },
                )),
                text: 'Delete Account',
                icon: CupertinoIcons.delete,
                iconColor: niftiError,
                showArrowIcon: true,
              ),
            ],
          ),
        ));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _SettingsPageState (STATE) * ---------------- *

