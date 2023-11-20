import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/profile_card.dart';
import 'package:nifti_locapp/widget_tree.dart';

// ? ContactProfile == display a contact's details

// * ---------------- * (STATEFUL WIDGET) CLASS ContactProfile (STATEFUL WIDGET) * ---------------- *
class ContactProfile extends StatefulWidget {
  // Variables
  final String imageLink;
  final String pronouns;
  final String fullName;
  final String bio;
  final String industry;
  final String city;
  final String role;
  final String company;
  final String yearsWorked;
  final String email;
  final String website;
  final String github;
  final String linkedin;
  final String instagram;
  final String phone;
  final String pincode;
  const ContactProfile({
    super.key,
    this.imageLink = '',
    this.pronouns = '',
    this.fullName = '',
    this.bio = '',
    this.industry = '',
    this.city = '',
    this.role = '',
    this.company = '',
    this.yearsWorked = '',
    this.email = '',
    this.website = '',
    this.github = '',
    this.linkedin = '',
    this.instagram = '',
    this.phone = '',
    this.pincode = '',
  });

  @override
  State<ContactProfile> createState() => _ContactProfileState();
}
// * ---------------- * END OF (STATE) CLASS SettingdPage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ContactProfileState (STATE) * ---------------- *
class _ContactProfileState extends State<ContactProfile> {
  // ? Variables
  String? selectedMenu;
  late Map<String, Object?> contactDetails = {};
  String staticPin = '';
  final MenuController menuController = MenuController();

  // ? Menu list
  final List<String> menu = ['Remove Contact'];

  // ? get connections data and store in Map<> contactDetails
  _getConnectionData() async {
    contactDetails =
        await NiftiFirestoreFunctions.getConnectionProfileData(staticPin);
    if (contactDetails.isNotEmpty) {
      for (int i = 0; i < contactDetails.length; i++) {
        setState(() {});
      }
    }
    return contactDetails;
  }

  // ? Run functions on page load
  @override
  void initState() {
    super.initState();
    _getConnectionData();
  }

  // * * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: niftiOffWhite,
        resizeToAvoidBottomInset: false,
        // ? Top bar that contains Nifti Logo
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), // Adjust the height as needed
          child: BackAppBar(),
        ),
        // *** Contact Profile page UI & logic starts here
        body: Container(
          alignment: AlignmentDirectional.topStart,
          padding:
              const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Page title
                  Text(
                    'PROFILE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: niftiGrey,
                    ),
                  ),
                  const SizedBox(
                    width: 242,
                  ),
                  // ? Options Button
                  MenuAnchor(
                      controller: menuController,
                      style: const MenuStyle(
                        surfaceTintColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      builder: (BuildContext context, MenuController controller,
                          Widget? child) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          icon: Icon(
                            Icons.more_horiz,
                            weight: 20,
                            size: 20,
                            color: niftiGrey,
                            semanticLabel: 'Options Menu',
                          ),
                        );
                      },
                      menuChildren: List<MenuItemButton>.generate(
                        1,
                        (int index) => MenuItemButton(
                          onPressed: () =>
                              setState(() => selectedMenu = menu[index]),
                          child: TextButton.icon(
                              onPressed: () {
                                // ? Close the menu when "Remove Contact" is tapped
                                menuController.close();
                                // ? Show the confirmation modal
                                confirmRemoveModal(context);
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                weight: 20,
                                size: 14,
                                color: niftiGrey,
                              ),
                              label: const TextDisplay(text: 'Remove Contact')),
                        ),
                      )),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: ProfileCard(
                      // ? Passing variables to profile card
                      imageLink: widget.imageLink,
                      pronouns: widget.pronouns,
                      fullName: widget.fullName,
                      bio: widget.bio,
                      industry: widget.industry,
                      city: widget.city,
                      role: widget.role,
                      company: widget.company,
                      yearsWorked: widget.yearsWorked,
                      email: widget.email,
                      website: widget.website,
                      github: widget.github,
                      linkedin: widget.linkedin,
                      instagram: widget.instagram,
                      phone: widget.phone,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
  // ? Confirm REMOVE MODAL
  void confirmRemoveModal(context) {
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
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 15),
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
                    'Are you sure you want to remove this person from your contacts?',
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
                          text: 'Remove',
                          onTap: () async {
                            NiftiFirestoreFunctions.deleteContact('2917').then(
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WidgetTree(),), (route) => false));
                            // Pops modal
                          },
                        ),
                      ]),
                ])
              ]));
        });
  } // ? END OF CONFIRM MODAL
}
// * ---------------- * END OF (STATE) CLASS _ContactProfileState (STATE) * ---------------- *

