import 'package:flutter/material.dart';
import 'package:nifti_locapp/functions/functions.dart';

// ? Provider for profile function call from edit profile page
class ProfileDataProvider extends ChangeNotifier {
  Map<String, Object?> details = {};
  Future<void> getProfileData() async {
    details = await NiftiFirestoreFunctions.getUserProfileData();
    notifyListeners();
  }
}
