import "package:flutter/material.dart";
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/components/text_display.dart';
import '../functions/functions.dart';
import '../functions/frontend.dart';

// ? CONTACT CARD MODAL
displayModalBottomSheet(
    // ? Passing required variables for modal display
    context,
    String fullName,
    //String bio,
    String pronouns,
    String industry,
    //String city,
    // String role,
    // String company,
    // String yearsWorked,
    String profileImageUrl,
    String pincode) {
  // ? Build Context
  showModalBottomSheet(
      context: context,
      barrierColor: const Color.fromARGB(179, 133, 157, 190),
      backgroundColor: niftiWhite,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(55))),
      builder: (BuildContext context) {
        return Container(
            height: 300,
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            child: ListView(children: [
              // ? Connection Card
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextDisplay(
                  text: 'CONNECTION FOUND',
                  color: niftiLightGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(
                  height: 12,
                ),
                // ? PROFILE INFO
                // profile image stack + check
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        profileImageUrl != ''
                            ? CircleAvatar(
                                radius: 42,
                                backgroundImage: const AssetImage(
                                    'images/defaultProfileImage.png'),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(profileImageUrl, scale: 1.0),
                                ),
                              )
                            : const CircleAvatar(
                                radius: 42,
                                backgroundImage: AssetImage(
                                    'images/defaultProfileImage.png'),
                              ),
                        // Pronoun Stack + check
                        pronouns != ''
                            ? Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  // Gradient Border
                                  Container(
                                    width: 90,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      gradient: niftiGradient,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  // Pronouns
                                  Container(
                                    alignment: AlignmentDirectional.center,
                                    width: 88,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: niftiWhite,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      pronouns,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: niftiGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                    // Space between
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ? Display Full Name
                        TextDisplay(
                          text: fullName,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextDisplay(
                          text: industry,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // Divder
                Container(
                  height: 0.5,
                  width: 360,
                  color: niftiLightGrey,
                ),

                const SizedBox(
                  height: 20,
                ),

                Text(
                  'Connecting will add them to your contact list',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: niftiGrey,
                  ),
                ),

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
                        text: 'Connect',
                        onTap: () async {
                          // ?  find and add to contact list logic
                          await StoreUserData.updateConnectionsPincode(pincode);
                          // ? Closes modal
                          if (context.mounted) {
                            Navigator.pop(context);
                            // ? Show alert message
                            displayAlertMessage(context,
                                'You\'ve got a new pal on your contact list!');
                          }
                        },
                      ),
                    ]),
              ])
            ]));
      });
} // ? END OF CONTACT CARD MODAL
