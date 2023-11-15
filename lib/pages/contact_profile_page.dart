import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/profile_card.dart';


// ? ContactProfile == display a contact's details

// * ---------------- * (STATEFUL WIDGET) CLASS ContactProfile (STATEFUL WIDGET) * ---------------- *
class ContactProfile extends StatefulWidget {
  const ContactProfile({super.key});

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
          padding: const EdgeInsets.only(top: 15, left: 15, right: 20),
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
                  width: 208,
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
                    'Options',
                    style: TextStyle(color: niftiGrey),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: ProfileCard(
                    imageLink: '${contactDetails['imageLink']}',
                    pronouns: '${contactDetails['pronouns']}',
                    fullName: '${contactDetails['fullName']}',
                    bio: '${contactDetails['bio']}',
                    industry: '${contactDetails['industry']}',
                    city: '${contactDetails['city/town']}',
                    role: '${contactDetails['role']}',
                    company: '${contactDetails['company']}',
                    yearsWorked: '${contactDetails['yearsWorked']}',
                    email: '${contactDetails['email']}',
                    website: '${contactDetails['website']}',
                    github: '${contactDetails['github']}',
                    linkedin: '${contactDetails['linkedin']}',
                    instagram: '${contactDetails['instagram']}',
                    phone: '${contactDetails['phone']}',
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

