import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/text_display.dart';


// ? ComingSoon == Placeholder page

// * ---------------- * (STATEFUL WIDGET) CLASS ComingSoon (STATEFUL WIDGET) * ---------------- *
class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}
// * ---------------- * END OF (STATE) CLASS ComingSoon (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ComingSoonState (STATE) * ---------------- *
class _ComingSoonState extends State<ComingSoon> {
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
            body: Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120,),
                  // ? Illustration
                  SizedBox(
                    height: 350,
                    width: 400,
                    child: Image.asset('images/construction.png'),
                  ),
                  // Space between
                  const SizedBox(
                    height: 10,
                  ),
                  // ? Title
                  Text(
                    'Coming Soon!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: niftiGrey,
                    ),
                  ),
                  // Space between
                  const SizedBox(
                    height: 10,
                  ),
                  // ? Description
                  const TextDisplay(
                    text: 'This feature will be available in the next Nifti version',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ComingSoonState (STATE) * ---------------- *
