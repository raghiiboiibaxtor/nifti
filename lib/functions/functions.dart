// ? ----------------------------------------------------------------------------------------------------------------------------- * PACKAGES
//import 'dart:js_interop';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ? ---------------------------------------------------------------------------------------------------------------------- * GLOBAL VARIABLES
// ? Initialising global variables
String userRef = '';
final collectionReference = FirebaseFirestore.instance.collection('users');
final niftiFireUser = FirebaseAuth.instance.currentUser?.uid;

//  ------------------------------------------------------------------------------------------------------------------------ 🚀 FUNCTIONS 🚀

// ? ------------------------------------------------------------------------------------------------------------- { ... } GENERATE PINCODE
// ? Creating random pincode for user
class GeneratePincode {
  static createNewPincode() async {
    late String code;
    dynamic secure = Random.secure();
    dynamic secList = List.generate(4, (_) => secure.nextInt(10));
    code = secList
        .toString()
        .replaceAll('[', '')
        .replaceAll(',', '')
        .replaceAll(' ', '')
        .replaceAll(']', '');
    return code;
  }

  // ? Definfing and constructing the pincode object
  String pincode;
  GeneratePincode({required this.pincode});
  set setPincode(String pincode) => pincode; // ? setting pincode
  get getPincode => pincode; // ? getting pincode

  // ? Static getter allowing pincode to be accessed through ui
  static getStaticPincode(String pincode) {
    String staticPin = pincode;
    return staticPin;
  }
}

// ? ------------------------------------------------------------------------------------------------------------- { ... } SECURITY SETTINGS
class NiftiSystemSettings {
  static getFaceID() async {
    late final LocalAuthentication auth = LocalAuthentication();
    try {
      final isAuthenticated = await auth.authenticate(
        localizedReason: 'Authenticate with FaceID',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ), // ? Use sticky authentication (required for Face ID)
      );

      if (isAuthenticated) {
        // ? Authentication was successful
        return 'Authenticated';
      } else {
        // ? Authentication failed
        return 'Oops! Something went wrong. Please try again.';
      }
    } catch (e) {
      return e;
    }
  }
}

// ! ----------------------------------------------------------------------------------------------------------------------- 🔥 FIRESTORE 🔥
// ? ---------------------------------------------------------------------------------------------------------- { ... } NIFTI FIRE FUNCTIONS
// ? Encapsulating Nifti x Firebase functions as an object.
class NiftiFirestoreFunctions {
  //  ------------------------------------------------------------------------------------------------------- C R E A T E ( )
  // ? Add user info to Firestore
  Future createUserProfile(
    // ? Listing required variables to be added
    String fullName,
    String email,
    String code,
    String userID,
  ) async {
    // ? Error variable
    String response = "Error Occured";
    try {
      // ? Trying to set the document
      await collectionReference.doc(niftiFireUser).set({
        // ? Personal Data
        'fullName': fullName,
        'email': email,
        'city/town': '',
        'pronouns': '',
        'imageLink': '',
        'bio': '',
        'role': '',
        'industry': '',
        'company': '',
        'yearsWorked': '',
        // ? Socials
        'phone': '',
        'website': '',
        'linkedin': '',
        'instagram': '',
        'github': '',
        // ? Connection Variables
        'pincode': code,
        'userID': niftiFireUser,
        'connections': [],
      });
      response = 'Success';
    } catch (error) {
      // ? Error catch
      response = error.toString();
    }
    return response;
  }

  // ! FIREBASE-STORAGE 🔥💿 ------------------------------------------- 💿🔥
  // ? Update Add profile image to storage
  Future addUserImage(Uint8List file) async {
    // ? Reference points to object in memory
    // ignore: unused_local_variable
    Reference ref =
        FirebaseStorage.instance.ref().child(niftiFireUser.toString());
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectory =
        referenceRoot.child(niftiFireUser.toString());
    // ? Create reference for image storage
    Reference referenceImageUpload = referenceDirectory.child('profileImage');

    // ? UploadTask upload data to remote storage
    UploadTask uploadTask = referenceImageUpload.putData(file);
    // ? TaskSnapshot represents current state of an aync task
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  // ! ------------------------------------------ 💿🔥

  //  ----------------------------------------------------------------------------------------------------------  R E A D ( )
  // ? Reading user data from Firestore as map
  static getUserProfileData() async {
    var docSnapshot = await collectionReference.doc(niftiFireUser).get();
    Map<String, dynamic> data = {};
    if (docSnapshot.exists) {
      data = docSnapshot
          .data()!; // ? Assigning valid snapshot to map and returning object
    }
    return data;
  }

  // ? Reading connection data from Firestore using UserPincode object
  static getConnectionProfileData(String pincode) async {
    late Map<String, dynamic> data = {};
    await collectionReference
        .where("pincode",
            isEqualTo: pincode) // ? Finding the pincode in Firestore
        .get()
        .then((querySnapshot) {
      // ? Grabbing querySnapshot (list of all documents)
      for (var docSnapshot in querySnapshot.docs) {
        data = docSnapshot
            .data(); // ? Assigning valid snapshot to map and returning object
      }
    });
    return data;
  }

  // ? Reading connection data from Firestore using otp
  static getAllConnections() async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(niftiFireUser)
            .get();
    late dynamic data = [];
    if (documentSnapshot.exists) {
      final List<dynamic>? codelist = documentSnapshot.data()?[
          'connections']; // ? Copying Firestore Snapshot 'connections array' data into local array
      if (codelist != null) {
        data =
            codelist; // ? Assigning dynamic List into array so that data is easily extracted
      } else {
        data = [
          ['Sorry! We cant find this connection. Please try again later :)']
        ];
      }
    } else {
      data = [
        ['You have no connections']
      ];
    }
    return data;
  }

  //  ------------------------------------------------------------------------------------------------------  U P D A T E ( )
  // ? Appending Firestore document data
  static addConnection(String pincode) async {
    String pin = await GeneratePincode.getStaticPincode(
        pincode); // ? Ensuring we grab the correct pincode by accessing the static pincode getter
    try {
      late dynamic code = [];
      final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await collectionReference
              .doc(niftiFireUser)
              .get(); // ? Grabbing the user document

      if (docSnapshot.exists) {
        final List<dynamic>? snapshot = docSnapshot.data()?[
            'connections']; // ? Duplicating the 'connections' array from user firestore document

        if (snapshot!.isEmpty) {
          await collectionReference.doc(niftiFireUser).update({
            'connections': FieldValue.arrayUnion([pin])
          });
        } else {
          for (int i = 0; i < (snapshot.length + 1); i++) {
            if (snapshot.contains(pin)) {
              // ? do nothing;
              code = [...snapshot];
            } else {
              code = [
                ...snapshot,
                pin
              ]; // ? Copying the existing data and adding the new pincode to the array
            }
          }
          await collectionReference.doc(niftiFireUser).update(
            {
              'connections':
                  code, // ? Pushing the new array for appending within the desired firestore document
            },
          );
        }
        return pincode;
      } else {}
    } catch (e) {
      // ? Catching errors
      return "Sorry! Error adding connection.";
    }
  }

  static updateEmail(String email) {
    FirebaseAuth.instance.currentUser!.updateEmail('hello@email.com');
  }

  // ! FIREBASE-STORAGE 🔥💿 ------------------------------------------- 💿🔥
  // ? Update ImageUrl in firestore (change profile picture)
  Future updateFirestoreImageLink(Uint8List file) async {
    // ? this relies on the userImage being added to storage
    String imageUrl = await addUserImage(file);
    var docRef = collectionReference.doc(niftiFireUser);
    docRef.update({
      'imageLink': imageUrl,
    });
  }
  // ! ------------------------------------------ 💿🔥

  //  ------------------------------------------------------------------------------------------------------  D E L E T E ( )
  static deleteAccount() async {
    var docSnapshot = await collectionReference.doc(niftiFireUser).get();
    if (docSnapshot.exists) {
      collectionReference
          .doc(niftiFireUser)
          .delete(); // ? Deleteing DocumentSnapshot
      await FirebaseAuth.instance.currentUser?.delete();
    }
    return 'Account & profile data permanently deleted';
  }

  static deleteProfile() async {
    var docSnapshot = await collectionReference.doc(niftiFireUser).get();
    if (docSnapshot.exists) {
      collectionReference
          .doc(niftiFireUser)
          .delete(); // ? Deleteing DocumentSnapshot
    }
    return 'Profile data permanently deleted';
  }

  static deleteContact(String contact) async {
    late List<dynamic>? contacts;
    // ? Instantiating Firestore references

    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(niftiFireUser)
            .get();
    late dynamic data = [];
    if (documentSnapshot.exists) {
      contacts = await documentSnapshot.data()?[
          'connections']; // ? Copying Firestore 'connections[]' into local array
      contacts!.remove(contact);
    }

    await collectionReference.doc(niftiFireUser).update(
      {
        'connections': contacts,
        // ? Pushing the new array for appending within the desired firestore document
      },
    );
    return data;
  }
}
//  --------------------------------------------------------------------------------------------------------------------  END OF FUNCTIONS 🚀 
