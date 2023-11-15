import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/profile_card.dart';


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
  const ContactProfile({super.key,
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
    this.phone = '',});

  @override
  State<ContactProfile> createState() => _ContactProfileState();
}
// * ---------------- * END OF (STATE) CLASS SettingdPage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ContactProfileState (STATE) * ---------------- *
class _ContactProfileState extends State<ContactProfile> {
  // ? Grabbing user
 // final currentUser = FirebaseAuth.instance.currentUser!;
  late Map<String, Object?> contactDetails = {};
  String staticPin = '';

  // ? get connections data and store in Map<> contactDetails
  _getConnectionData() async {
    contactDetails = await NiftiFirestoreFunctions.getConnectionProfileData(staticPin);
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
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 20),
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
                  width: 200,
                ),
                // ? Options Button
                TextButton.icon(
                  onPressed:() {
                    
                  },
                  icon: Icon(
                    Icons.more_vert_rounded,
                    weight: 20,
                    size: 12,
                    color: niftiGrey,
                  ),
                  label: Text(
                    'More',
                    style: TextStyle(color: niftiGrey),
                  ),
                ),
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
}
// * ---------------- * END OF (STATE) CLASS _ContactProfileState (STATE) * ---------------- *

