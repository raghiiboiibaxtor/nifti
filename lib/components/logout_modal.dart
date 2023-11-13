import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/components/text_display.dart';

// ? Confirm LOGOUT MODAL
void confirmLogoutModal(context) {
  showModalBottomSheet<void>(
      context: context,
      barrierColor: const Color.fromARGB(179, 133, 157, 190),
      backgroundColor: niftiWhite,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(55))),
      builder: (BuildContext context) {
        return Container(
            height: 200,
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            child: ListView(children: [
              // ? Logout Confirmation Card
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // ? Popup heading
                TextDisplay(
                  text: 'JUST CHECKING',
                  color: niftiLightGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(
                  height: 10,
                ),
                // ? Divder & space between
                Container(
                  height: 0.5,
                  width: 360,
                  color: niftiLightGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                // ? Prompt text
                Text(
                  'Are you sure you want to logout?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: niftiGrey,
                  ),
                ),
                // Space between
                const SizedBox(
                  height: 20,
                ),
                // ? Buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // ? Cancel Button
                      CTACancelButton(
                        onTap: () {
                          // ? Closes modal
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      // ? Confirm Button
                      CTAConfirmButton(
                        text: 'Logout',
                        onTap: () async {
                          // Pops modal
                          Navigator.pop(context);
                          // Logs out
                          FirebaseAuth.instance.signOut();
                          // Pops page
                          Navigator.pop(context);
                        },
                      ),
                    ]),
              ])
            ]));
      });
} // ? END OF LOGOUT MODAL
