import "package:flutter/material.dart";
import 'package:nifti_locapp/functions/functions.dart';
import 'package:nifti_locapp/components/contact_list_display.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/pages/contact_profile_page.dart';

// * ---------------- * (STATEFUL WIDGET) CLASS ContactsPage (STATEFUL WIDGET) * ---------------- *
class ContactsPage extends StatefulWidget {
  const ContactsPage({
    super.key,
    
  });

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}
// * ---------------- * END OF (STATE) CLASS ContactsPage (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ContactsPageState (STATE) * ---------------- *
class _ContactsPageState extends State<ContactsPage> {
  // Variables
  late dynamic pincodes = [];
  late String code = '';
  late List<Map<String, Object?>> friends = [];
  String imageUrl = '';

  // ? get connection data that matches array of pincodes and store in Map<> friends
  _getAllConnectionsData() async {
    pincodes = await NiftiFirestoreFunctions
        .getAllConnections(); // ? Assigning pincodes with map of Firestore > document > connections []
    if (pincodes != null) {
      friends = [];
      for (int i = 0; i <= pincodes.length; i++) {
        code = pincodes[i]; // ? Extracting the user pincode
        Map<String, Object?> friendData =
            await NiftiFirestoreFunctions.getConnectionProfileData(
                code); // ? grabbing the object associated with user pincode
        friends.add(friendData); // ? Copying obj into friends
        setState(() {}); // ? Changing ui
      }
      setState(() {}); // ? Resetting ui
    }
  }

  // ? display connection data in ListDisplay
  List<Widget> _friendListDisplay() {
  List<Widget> friendsList = [];
  for (int i = 0; i < friends.length; i++) {
    Map<String, Object?> friend = friends[i];

    friendsList.add(
        ListDisplay(
          name: '${friend['fullName']}',
          industry: '${friend['industry']}',
          pronouns: '${friend['pronouns']}',
          profileImageUrl: '${friend['imageLink']}',
          onTap: () {
          // Navigate to the profile page with the selected contact's details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactProfile(
                    // ? Passing variables to contact profile
                    imageLink: '${friend['imageLink']}',
                    pronouns: '${friend['pronouns']}',
                    fullName: '${friend['fullName']}',
                    bio: '${friend['bio']}',
                    industry: '${friend['industry']}',
                    city: '${friend['city/town']}',
                    role: '${friend['role']}',
                    company: '${friend['company']}',
                    yearsWorked: '${friend['yearsWorked']}',
                    email: '${friend['email']}',
                    website: '${friend['website']}',
                    github: '${friend['github']}',
                    linkedin: '${friend['linkedin']}',
                    instagram: '${friend['instagram']}',
                    phone: '${friend['phone']}',
                  ),
            ),
          );
        },
        ),
    );
  }
  return friendsList;
}

  // ? Run functions on page load
  @override
  void initState() {
    _getAllConnectionsData();
    super.initState();
  }

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: niftiOffWhite,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // ? Page title
            Text(
              'CONTACT PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: niftiGrey,
              ),
            ),
            // ? Space between
            const SizedBox(
              height: 15,
            ),
            // ? Contact List
            if (pincodes == null)
              // ? Text prompt
              const TextDisplay(
                text: 'No friends to show yet!',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(115, 142, 247, 1),
              )
            else
              // ? Display contact list
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: _friendListDisplay(),
              )
          ]),
        ));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ContactsPageState (STATE) * ---------------- *
