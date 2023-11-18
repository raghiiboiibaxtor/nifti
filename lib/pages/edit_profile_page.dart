import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/drop_menu.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/text_field_character_limit.dart';
import 'package:nifti_locapp/components/text_form_field.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/functions/frontend.dart';

// ? EditProfilePage == User access to update their profile details

// * ---------------- * (STATEFUL WIDGET) CLASS EditProfilePage (STATEFUL WIDGET) * ---------------- *
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}
// * ---------------- * END OF (STATE) CLASS EditProfilePage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _EditProfilePageState (STATE) * ---------------- *
class _EditProfilePageState extends State<EditProfilePage> {
  // ? Creating instance of user document
  NiftiFirestoreFunctions userProfile = NiftiFirestoreFunctions();
  // ? Grabbing user
  final currentUser = FirebaseAuth.instance.currentUser!;
  late Map<String, Object?> details = {};

  // ? Text Controllers - used to access the user's input
  Uint8List? _profileImage;
  final _fullNameController = TextEditingController();
  String? _pronouns;
  final _cityController = TextEditingController();
  final _bio = TextEditingController();
  final _industry = TextEditingController();
  final _roleTitle = TextEditingController();
  final _companyName = TextEditingController();
  String? _yearsWorked;
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _instagramController = TextEditingController();
  final _githubController = TextEditingController();
  final _phoneController = TextEditingController();

  // ? Pronoun dropdown list
  final List<String> pronouns = [
    'They / Them',
    'He / Him',
    'She / Her',
    'He / They',
    'She / They',
    'Prefer not to say'
  ];
  // ? Years in company dropdown list
  final List<String> years = [
    '< 1 year',
    '1+ year',
    '2+ years',
    '3+ years',
    '4+ years',
    '5+ years',
  ];

  // ? Profile image selection function
  void selectProfileImage() async {
    Uint8List image = await pickImage();
    setState(() {
      _profileImage = image;
    });
  }

  // ? Get user's data and store in Map<> details and text controllers
  _getProfileData() async {
    details = await NiftiFirestoreFunctions.getUserProfileData();
    late Map<String, Object?> updatedDetails;
    if (details.isNotEmpty) {
      for (int i = 0; i < details.length; i++) {
        setState(() {});
      }
      // Assign text controllers
      _fullNameController.text = '${details['fullName']}';
      _pronouns = '${details['pronouns']}';
      _emailController.text = '${details['email']}';
      _cityController.text = '${details['city/town']}';
      _bio.text = '${details['bio']}';
      _industry.text = '${details['industry']}';
      _roleTitle.text = '${details['role']}';
      _companyName.text = '${details['company']}';
      _yearsWorked = '${details['yearsWorked']}';
      _websiteController.text = '${details['website']}';
      _linkedinController.text = '${details['linkedin']}';
      _instagramController.text = '${details['instagram']}';
      _githubController.text = '${details['github']}';
      _phoneController.text = '${details['phone']}';
    }
    updatedDetails = details;
    return updatedDetails;
  }

  Future saveEditProfile(Map<String, Object?> updatedDetails) async {
    try {
      await userProfile.updateProfileData(updatedDetails);
    } catch (e) {
      //
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _bio.dispose();
    _pronouns;
    _industry.dispose();
    _roleTitle.dispose();
    _companyName.dispose();
    _yearsWorked;
    _emailController.dispose();
    _websiteController.dispose();
    _linkedinController.dispose();
    _instagramController.dispose();
    _githubController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // ? Run functions on page load
  @override
  void initState() {
    super.initState();
    _getProfileData();
    saveEditProfile();
  }

  // * * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: niftiOffWhite,
            resizeToAvoidBottomInset: true,
            // ? Top bar that contains Nifti Logo
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(40), // Adjust the height as needed
              child: BackAppBar(),
            ),
            // ? Page UI & logic starts here
            body: SingleChildScrollView(
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      top: 5, left: 15, right: 15, bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ? Page title
                        Row(
                          children: [
                            // Page title
                            Text(
                              'EDIT PROFILE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: niftiGrey,
                              ),
                            ),
                            const SizedBox(
                              width: 165,
                            ),
                            // ? Save Button
                            TextButton.icon(
                              onPressed: () {
                                // ! Update firestore function
                                saveEditProfile();
                                // Pop loading context
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.mode_edit_outline_rounded,
                                weight: 20,
                                size: 12,
                                color: niftiGrey,
                              ),
                              label: Text(
                                'Save',
                                style: TextStyle(color: niftiGrey),
                              ),
                            ),
                          ],
                        ),
                        // Space between
                        const SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          // ? Profile Picture Selection
                          Stack(
                            children: [
                              details['imageLink'] != ''
                                  ? CircleAvatar(
                                      radius: 53,
                                      backgroundImage: const AssetImage(
                                          'images/defaultProfileImage.png'),
                                      child: CircleAvatar(
                                        radius: 51,
                                        backgroundImage: NetworkImage(
                                            '${details['imageLink']}',
                                            scale: 1.0),
                                      ),
                                    )
                                  : const CircleAvatar(
                                      radius: 53,
                                      backgroundImage: AssetImage(
                                          'images/defaultProfileImage.png'),
                                    ),
                              _profileImage != null
                                  ? CircleAvatar(
                                      radius: 53,
                                      backgroundImage: const AssetImage(
                                          'images/defaultProfileImage.png'),
                                      child: CircleAvatar(
                                        radius: 51,
                                        backgroundImage:
                                            MemoryImage(_profileImage!),
                                      ),
                                    )
                                  : const SizedBox(),
                              Positioned(
                                bottom: -9,
                                left: 67,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 23,
                                      height: 23,
                                      decoration: BoxDecoration(
                                        gradient: niftiGradient,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 0.5,
                                            blurRadius: 2.0,
                                            offset: const Offset(0.5, 1),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    IconButton(
                                      color: niftiWhite,
                                      onPressed: selectProfileImage,
                                      icon: const Icon(
                                        CupertinoIcons.add_circled_solid,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // ? Space between next widget
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              // ? Name Textfield
                              TextFieldComponent(
                                width: 224,
                                controller: _fullNameController,
                                labelText: 'Name',
                                obscureText: false,
                                hasError: false,
                              ),

                              // ? Pronoun dropdown selector
                              // ? if _pronouns has value from firestore then display the user's selection
                              _pronouns != ''
                                  ? DropdownMenuComponent(
                                      savedValue: _pronouns,
                                      width: 224,
                                      value: _pronouns,
                                      labelText: 'Pronouns',
                                      itemsList: pronouns,
                                      onChanged: (value) {
                                        setState(() {
                                          _pronouns = value as String;
                                        });
                                      },
                                    )
                                  :
                                  // ? Else display empty default value
                                  DropdownMenuComponent(
                                      width: 224,
                                      value: _pronouns,
                                      labelText: 'Pronouns',
                                      itemsList: pronouns,
                                      onChanged: (value) {
                                        setState(() {
                                          _pronouns = value as String;
                                        });
                                      },
                                    ),
                            ],
                          ),
                        ]),
                        // Divider + spacing
                        const SizedBox(
                          height: 15,
                        ),
                        // ? Section Title
                        TextDisplay(
                          text: 'About Me',
                          color: niftiLightGrey,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // ? About Section
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              height: 175,
                              decoration: BoxDecoration(
                                color: niftiWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: niftiGreyShadow,
                                    spreadRadius: 1.0,
                                    blurRadius: 3.0,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(1),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // ? Bio Textfield
                                  TextFieldLimitComponent(
                                    maxLength: 80,
                                    controller: _bio,
                                    labelText: 'Bio',
                                    obscureText: false,
                                    hasError: false,
                                  ),
                                  Row(
                                    children: [
                                      // ? Industry Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _industry,
                                        labelText: 'Industry',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                      const SizedBox(width: 20),
                                      // ? City/Town Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _cityController,
                                        labelText: 'City / Town',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // ? Section Title
                        TextDisplay(
                          text: 'Current Role / Study',
                          color: niftiLightGrey,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // ? Role / Study Section
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              height: 175,
                              decoration: BoxDecoration(
                                color: niftiWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: niftiGreyShadow,
                                    spreadRadius: 1.0,
                                    blurRadius: 3.0,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(1),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // ? Role / Degree Textfield
                                  TextFieldComponent(
                                    controller: _roleTitle,
                                    labelText: 'Role Title',
                                    obscureText: false,
                                    hasError: false,
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ? Company Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _companyName,
                                        labelText: 'Company / Institute',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                      const SizedBox(width: 20),
                                      // ? Years Worked Dropdown
                                      // ? if _yearsWorked has value from firestore then display the user's selection
                                      _yearsWorked != ''
                                          ? DropdownMenuComponent(
                                              savedValue: _yearsWorked,
                                              width: 155,
                                              value: _yearsWorked,
                                              labelText: 'Years Worked',
                                              itemsList: years,
                                              onChanged: (value) {
                                                setState(() {
                                                  _yearsWorked =
                                                      value as String;
                                                });
                                              },
                                            )
                                          :
                                          // ? Else display empty default value
                                          DropdownMenuComponent(
                                              width: 155,
                                              value: _yearsWorked,
                                              labelText: 'YearsWorked',
                                              itemsList: years,
                                              onChanged: (value) {
                                                setState(() {
                                                  _yearsWorked =
                                                      value as String;
                                                });
                                              },
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // ? Section Title
                        TextDisplay(
                          text: 'Get In Touch',
                          color: niftiLightGrey,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // ? Get in touch Section
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              height: 320,
                              decoration: BoxDecoration(
                                color: niftiWhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: niftiGreyShadow,
                                    spreadRadius: 1.0,
                                    blurRadius: 3.0,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(1),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // ? Email Textfield
                                  TextFieldComponent(
                                    controller: _emailController,
                                    labelText: 'Email',
                                    obscureText: false,
                                    hasError: false,
                                  ),
                                  // ? Phone Textfield
                                  TextFieldComponent(
                                    controller: _phoneController,
                                    labelText: 'Phone',
                                    obscureText: false,
                                    hasError: false,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ? Website Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _websiteController,
                                        labelText: 'Website',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                      const SizedBox(width: 20),
                                      // ? LinkedIn Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _linkedinController,
                                        labelText: 'LinkedIn',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ? Instagram Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _instagramController,
                                        labelText: 'Instagram',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                      const SizedBox(width: 20),
                                      // ? Github Textfield
                                      TextFieldComponent(
                                        width: 155,
                                        controller: _githubController,
                                        labelText: 'Github',
                                        obscureText: false,
                                        hasError: false,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ])),
            )));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _EditProfilePageState (STATE) * ---------------- *
