import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nifti_locapp/components/profile_card.dart';
import 'package:nifti_locapp/components/profile_data_provider.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/pages/edit_profile_page.dart';
import 'package:provider/provider.dart';

// ? ProfilePage == display user's details + edit to choose banner images

// * ---------------- * (STATEFUL WIDGET) CLASS ProfilePage (STATEFUL WIDGET) * ---------------- *
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
// * ---------------- * END OF (STATE) CLASS ProfilePage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ProfilePageState (STATE) * ---------------- *
class _ProfilePageState extends State<ProfilePage> {
  // ? Grabbing user
  final currentUser = FirebaseAuth.instance.currentUser!;
  late Map<String, Object?> details = {};
  

  // ? Get user's data and store in Map<> details
  _getProfileData() async {
    details = await NiftiFirestoreFunctions.getUserProfileData();
    if (details.isNotEmpty) {
      for (int i = 0; i < details.length; i++) {
        setState(() {});
      }
    }
    return details;
  }

  // ? Run functions on page load
  @override
  void initState() {
    super.initState();
    // ? Reload user details on profilepage
    Provider.of<ProfileDataProvider>(context, listen: false).getProfileData();
    _getProfileData();
  }

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    Map<String, Object?> details = Provider.of<ProfileDataProvider>(context).details;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: niftiOffWhite,
        alignment: Alignment.topLeft,
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
                  width: 208,
                ),
                // ? Edit Button
                TextButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const EditProfilePage();
                    },
                  )),
                  icon: Icon(
                    Icons.mode_edit_outline_rounded,
                    weight: 20,
                    size: 12,
                    color: niftiGrey,
                  ),
                  label: Text(
                    'Edit',
                    style: TextStyle(color: niftiGrey),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: ProfileCard(
                    imageLink: '${details['imageLink']}',
                    pronouns: '${details['pronouns']}',
                    fullName: '${details['fullName']}',
                    bio: '${details['bio']}',
                    industry: '${details['industry']}',
                    city: '${details['city/town']}',
                    role: '${details['role']}',
                    company: '${details['company']}',
                    yearsWorked: '${details['yearsWorked']}',
                    email: '${details['email']}',
                    website: '${details['website']}',
                    github: '${details['github']}',
                    linkedin: '${details['linkedin']}',
                    instagram: '${details['instagram']}',
                    phone: '${details['phone']}',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ProfilePageState (STATE) * ---------------- *