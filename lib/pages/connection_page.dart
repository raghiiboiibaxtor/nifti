import "package:flutter/material.dart";
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/components/pin_code_field.dart';
import 'package:nifti_locapp/functions/frontend.dart';
import 'package:nifti_locapp/components/connection_modal.dart';
//import '../functions/frontend.dart';
import '../functions/functions.dart';
/* * ---------------- * END OF PACKAGES * ---------------- * */

// * ---------------- * (STATEFUL WIDGET) CLASS CONNECTOR (STATEFUL WIDGET) * ---------------- *
class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Connector()),
    );
  }
}

// * ---------------- * (STATEFUL WIDGET) CLASS CONNECTOR (STATEFUL WIDGET) * ---------------- *
class Connector extends StatefulWidget {
  const Connector({super.key});

  @override
  State<Connector> createState() => _ConnectorState();
}

// * ---------------- * (STATE) CLASS _ConnectorState (STATE) * ---------------- *
class _ConnectorState extends State<Connector> {
  // ? Global variables
  late Map<String, Object?> details = {};
  late Map<String, Object?> friend = {};
  final _pin1Controller = TextEditingController();
  final _pin2Controller = TextEditingController();
  final _pin3Controller = TextEditingController();
  final _pin4Controller = TextEditingController();
  String pincode = '';
  String staticPin = '';
  String combinedCode = '';
  // pincode = "${_pin1.text}${_pin2.text}${_pin3.text}${_pin4.text}";
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
   String? _pin1Error;
  String? _pin2Error;
  String? _pin3Error;
  String? _pin4Error;


  // ? Get user's data and store in Map<> details
  _getProfileData() async {
    details = await ReadUserData.getProfileData();
    if (details.isNotEmpty) {
      for (int i = 0; i < details.length; i++) {
        setState(() {});
      }
    }
    return details;
  }

  // ? get user's code and store in staticPin
  _getPincode() async {
    if (staticPin != '') {
      //setState(() {});
      return staticPin;
    } else {
      return staticPin = 'Pin not found';
    }
  }

  // ? get connections data and store in Map<> friend
  /*_getConnectionData() async {
    friend = await ReadUserData.getConnectionData(pincode);
    setState(() {});
    return friend;
  }*/

    // ? get connections data and store in Map<> friend
  _getConnectionData(String staticPin) async {
    if (staticPin != '') {
      friend = await ReadUserData.getConnectionData(staticPin);
      //setState(() {});
      return friend;
    } else {
      return staticPin = 'Pin not found';
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
    super.dispose();
  }

  // ? Running functions on page load
  @override
  initState() {
    _getProfileData();
    _getPincode();
    _getConnectionData(staticPin);
    super.initState();
  }

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? Page title
              Text(
                'CONNECT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: niftiGrey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ? Action prompt
              Text(
                'Enter someone’s code to connect with them',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: niftiGrey,
                ),
              ),
              // ? Space between
              const SizedBox(
                height: 15,
              ),
              // ? Top 2 PIN fields
              Form(
                    key: _formKey,
                    child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinBox(textEditingController: _pin1Controller, hasError: _pin1Error != null,),
                  const SizedBox(
                    width: 23,
                  ),
                  PinBox(textEditingController: _pin2Controller, hasError: _pin2Error != null,),
                ],
              ),
              // Space between
              const SizedBox(
                height: 23,
              ),
              // ? Bottom 2 PIN fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinBox(textEditingController: _pin3Controller, hasError: _pin3Error != null,),
                  const SizedBox(
                    width: 23,
                  ),
                  PinBox(textEditingController: _pin4Controller, hasError: _pin4Error != null,),
                ],
              ),

              // Space between
              const SizedBox(
                height: 30,
              ),
              // ? Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CTACancelButton(
                    text: 'Clear',
                    onTap: () {
                      _pin1Controller.clear();
                      _pin2Controller.clear();
                      _pin3Controller.clear();
                      _pin4Controller.clear();
                    },
                  ),
                  CTAConfirmButton(
                    text: 'Find',
                    onTap: () async {
                      combinedCode = "${_pin1Controller.text}${_pin2Controller.text}${_pin3Controller.text}${_pin4Controller.text}";
                      debugPrint(combinedCode);
                      if (combinedCode.length != 4) {
                              displayErrorMessage(context, 'Please enter all 4 digits');
                      } 
                      else{
                        // ? Match user pin & display pop up modal with their info
                        UserPincode(pincode: combinedCode);
                              staticPin = await UserPincode.getStaticPincode(
                                  combinedCode);
                              friend = await _getConnectionData(staticPin);
                          setState(
                                () async {
                                  hasError = false;
                                  if ('${friend['firstName']}' == 'null') {
                                    displayErrorMessage(context,
                                        "Oops! That's an invalid code. Please try again 👀");
                                    const SizedBox(
                                      height: 50,
                                    );
                                  } else {
                                    // ? Clear PIN fields when matched
                                    _pin1Controller.clear();
                                    _pin2Controller.clear();
                                    _pin3Controller.clear();
                                    _pin4Controller.clear();
                                    // ? Modal with matching connections details

                                    displayModalBottomSheet(
                                      context,
                                      '${friend['firstName']}'
                                          ' ${friend['lastName']}',
                                      '${friend['bio']}',
                                      '${friend['pronouns']}',
                                      '${friend['industry']}',
                                      '${friend['city/town']}',
                                      '${friend['role']}',
                                      '${friend['company']}',
                                      '${friend['yearsWorked']}',
                                      '${friend['imageLink']}',
                                      '${friend['pincode']}',
                                    );
                                  }
                                },
                              );
                      }
                    },
                  )
                ],
              ),
              ],),),
            ],
          ),
        ),
      ),
    );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _LoginPageState (STATE) * ---------------- *

/*


Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // ? Profile picture
                      details['imageLink'] != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: const AssetImage(
                                  'images/defaultProfileImage.png'),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    '${details['imageLink']}',
                                    scale: 1.0),
                              ),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/defaultProfileImage.png'),
                            ),
                    ],
                  ),
                  // ? Space between
                  const SizedBox(
                    width: 15,
                  ),

                  // ? Display user's personal code
                  CopyTool(
                    text: "${details['pincode']}",
                    fontSize: 88,
                    letterSpacing: 1,
                  ),
                ],
              ),

              // ? Space between
              const SizedBox(height: 40),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const BlankPage(),
              ),
 */
