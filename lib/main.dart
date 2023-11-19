import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nifti_locapp/auth/auth.dart';
import 'package:nifti_locapp/components/profile_data_provider.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:provider/provider.dart';

// ? MyApp == root of application

// * ---------------- * (main)* ---------------- * */
void main() async {
  // ? Access to native code
  //NiftiSystemSettings.getFaceID();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileDataProvider(),
      child: const MyApp(),
    ),
  );
}

// * ---------------- * (STATELESS WIDGET) CLASS MyApp (STATELESS WIDGET) * ---------------- *
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  // ? This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATELESS WIDGET) CLASS MyApp (STATELESS WIDGET) * ---------------- *
