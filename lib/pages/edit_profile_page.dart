// ignore_for_file: use_build_context_synchronously
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:nifti_locapp/components/drop_menu.dart';
import 'package:nifti_locapp/components/profile_data_provider.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/text_field_character_limit.dart';
import 'package:nifti_locapp/components/text_form_field.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/functions/frontend.dart';
import 'package:provider/provider.dart';

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
  // ? Grabbing user
  final currentUser = FirebaseAuth.instance.currentUser!;
  late Map<String, Object?> details = {};
  late var connections = [];
  // ? Text Controllers - used to access the user's input
  Uint8List? _profileImage;
  Uint8List? memoryImage;
  late TextEditingController _fullNameController;
  String? _pronouns;
  late TextEditingController _cityController;
  late TextEditingController _bioController;
  late TextEditingController _industryController;
  late TextEditingController _roleTitleController;
  late TextEditingController _companyNameController;
  String? _yearsWorked;
  late TextEditingController _emailController;
  late TextEditingController _websiteController;
  late TextEditingController _linkedinController;
  late TextEditingController _instagramController;
  late TextEditingController _githubController;
  late TextEditingController _phoneController;
  bool _isDataLoaded = false;
  //final _fullNameController = TextEditingController();
  //String? _pronouns;
  /*final _cityController = TextEditingController();
  final _bio = TextEditingController();
  final _industry = TextEditingController();
  final _roleTitle = TextEditingController();
  final _companyName = TextEditingController();*/
  //String? _yearsWorked;
  /*final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _instagramController = TextEditingController();
  final _githubController = TextEditingController();
  final _phoneController = TextEditingController();*/

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
  selectProfileImage() async {
    Uint8List image = await pickImage();
    memoryImage = MemoryImage(_profileImage!) as Uint8List;
    setState(() {
      _profileImage = image;
    });
  }

  // ? Get user's data and store in Map<> details and text controllers
  _getProfileData() async {
    details = await NiftiFirestoreFunctions.getUserProfileData();
    connections = await NiftiFirestoreFunctions.getAllConnections();
    if (details.isNotEmpty) {
      for (int i = 0; i < details.length; i++) {
        setState(() {});
      }

      // Assign text controllers
      /*
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
    updatedDetails = details;*/
      // updatedDetails = details;
      // return updatedDetails;
      return details;
    }
  }

  // ? Set text controllers & trigger edit display
  Future<void> _loadData() async {
    // ? Delay for 2 seconds
    await Future.delayed(const Duration(seconds: 1));

    // ? Set text controllers & bool
    setState(() {
      _fullNameController =
          TextEditingController(text: '${details['fullName']}');
      _pronouns = '${details['pronouns']}';
      _emailController = TextEditingController(text: '${details['email']}');
      _cityController = TextEditingController(text: '${details['city/town']}');
      _bioController = TextEditingController(text: '${details['bio']}');
      _industryController =
          TextEditingController(text: '${details['industry']}');
      _roleTitleController = TextEditingController(text: '${details['role']}');
      _companyNameController =
          TextEditingController(text: '${details['company']}');
      _yearsWorked = '${details['yearsWorked']}';
      _websiteController = TextEditingController(text: '${details['website']}');
      _linkedinController =
          TextEditingController(text: '${details['linkedin']}');
      _instagramController =
          TextEditingController(text: '${details['instagram']}');
      _githubController = TextEditingController(text: '${details['github']}');
      _phoneController = TextEditingController(text: '${details['phone']}');
      // ? Update bool to true
      _isDataLoaded = true;
    });
  }

  Future editProfile(Map<String, Object?> details) async {
    final niftiFireUser = FirebaseAuth.instance.currentUser?.uid;
    var collectionReference = FirebaseFirestore.instance.collection('users');
    details = await NiftiFirestoreFunctions.getUserProfileData();
    late Map<String, Object?> updatedDetails;
    late Map<String, Object?> saveDetails = {};
    String code = '${details['pincode']}';

    // ? Creating local object to append cloud document
    updatedDetails = ({
      'fullName': _fullNameController.text,
      'pronouns': _pronouns,
      'email': _emailController.text,
      'city/town': _cityController.text,
      'bio': _bioController.text,
      'industry': _industryController.text,
      'role': _roleTitleController.text,
      'company': _companyNameController.text,
      'yearsWorked': _yearsWorked,
      'website': _websiteController.text,
      'linkedin': _linkedinController.text,
      'instagram': _instagramController.text,
      'github': _githubController.text,
      'phone': _phoneController.text,
      'pincode': code,
      'connections': connections,
    });
    try {
      // ? Fetching data & pushing it through a range based for loop to compare map.values and make decisions based on results

      if (details.isNotEmpty) {
        details.forEach((key, value) async {
          // ? If the updatedDetails value is not an empty string && is different from details.map save data into saveDetails
          if ((updatedDetails[key] != '') && (updatedDetails[key] != null)) {
            saveDetails[key] = updatedDetails[key];
          } else {
            saveDetails[key] = details[key];
          }
          await collectionReference.doc(niftiFireUser).update(saveDetails);
        });
      }
      return saveDetails;
    } catch (e) {
      return e;
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _bioController.dispose();
    _pronouns;
    _industryController.dispose();
    _roleTitleController.dispose();
    _companyNameController.dispose();
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
    _loadData();
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
                              onPressed: () async {
                                // ? Update firestore info
                                await editProfile(details);
                                // ? Reload user details on profilepage
                                Provider.of<ProfileDataProvider>(context,
                                        listen: false)
                                    .getProfileData();
                                // ? Pop edit page to show profile
                                Navigator.pop(context);
                                /*
                                _getProfileData()
                                    .then((value) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WidgetTree()),
                                        ));*/
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
                        // ? When data is loaded, edit options will display
                        _isDataLoaded
                            ? editContent()
                            : Container(
                                height: 550,
                                width: 400,
                                padding: const EdgeInsets.all(20),
                                child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ]),
                              ),
                        // Space between
                        const SizedBox(
                          height: 15,
                        ),
                      ])),
            )));
  }

  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
  Widget editContent() {
    return Column(children: [
      Row(children: [
        // ? Profile Picture Selection
        Stack(
          children: [
            details['imageLink'] != '' || details['imageLink'] != null
                ? CircleAvatar(
                    radius: 53,
                    backgroundImage:
                        const AssetImage('images/defaultProfileImage.png'),
                    child: CircleAvatar(
                      radius: 51,
                      backgroundImage:
                          NetworkImage('${details['imageLink']}', scale: 1.0),
                    ),
                  )
                : const CircleAvatar(
                    radius: 53,
                    backgroundImage:
                        AssetImage('images/defaultProfileImage.png'),
                  ),
            _profileImage != null
                ? CircleAvatar(
                    radius: 53,
                    backgroundImage:
                        const AssetImage('images/defaultProfileImage.png'),
                    child: CircleAvatar(
                      radius: 51,
                      backgroundImage: MemoryImage(_profileImage!),
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
                  controller: _bioController,
                  labelText: 'Bio',
                  obscureText: false,
                  hasError: false,
                ),
                Row(
                  children: [
                    // ? Industry Textfield
                    TextFieldComponent(
                      width: 155,
                      controller: _industryController,
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
                  controller: _roleTitleController,
                  labelText: 'Role Title',
                  obscureText: false,
                  hasError: false,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ? Company Textfield
                    TextFieldComponent(
                      width: 155,
                      controller: _companyNameController,
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
                                _yearsWorked = value as String;
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
                                _yearsWorked = value as String;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    ]);
  }
}
// * ---------------- * END OF (STATE) CLASS _EditProfilePageState (STATE) * ---------------- *

