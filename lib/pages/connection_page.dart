import "package:flutter/material.dart";
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/components/pin_code_field.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/connection_modal.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
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
  String errorMessage = '';
  String? _pin1Error;
  String? _pin2Error;
  String? _pin3Error;
  String? _pin4Error;

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
  _getConnectionData(String staticPin) async {
    if (staticPin != '') {
      friend =
          await NiftiFirestoreFunctions.getConnectionProfileData(staticPin);
      //setState(() {});
      return friend;
    } else {
      return staticPin = 'Pin not found';
    }
  }

  // ? Function to break PIN text into chunks of 2 characters
  List<String> chunkText(String text, int chunkSize) {
    List<String> chunks = [];
    for (int i = 0; i < text.length; i += chunkSize) {
      chunks.add(text.substring(i, i + chunkSize));
    }
    return chunks;
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
    // ? Variables for user PIN 2x2 format display
    // Get the pin code from Firestore
    String pinCode = '${details['pincode']}';
    // Break the pin code into chunks of 2 characters each
    List<String> pinCodeChunks = chunkText(pinCode, 2);
    // ? Connection page
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: niftiOffWhite,
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ? Page title
                  Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    child: Text(
                      'CONNECT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: niftiGrey,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  // ? Action prompt

                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      //'Enter someone’s code to connect with them',
                      'Enter each other\'s code to connect!',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: niftiGrey,
                      ),
                    ),
                  ),

                  // ? Space between
                  const SizedBox(
                    height: 20,
                  ),
                  // ? Top 2 PIN fields
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PinBox(
                            textEditingController: _pin1Controller,
                            hasError: _pin1Error != null,
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                          PinBox(
                            textEditingController: _pin2Controller,
                            hasError: _pin2Error != null,
                          ),
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
                          PinBox(
                            textEditingController: _pin3Controller,
                            hasError: _pin3Error != null,
                          ),
                          const SizedBox(
                            width: 23,
                          ),
                          PinBox(
                            textEditingController: _pin4Controller,
                            hasError: _pin4Error != null,
                          ),
                        ],
                      ),

                      // Space between
                      const SizedBox(
                        height: 8,
                      ),

                      // ? Action Buttons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ? Error message text
                          Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 35)),
                              if (errorMessage.isNotEmpty)
                                Text(
                                  errorMessage,
                                  style: TextStyle(
                                      color: niftiPink,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              // ? If no error then display sized box to keep space
                              else
                                const SizedBox(
                                  height: 17,
                                ),
                            ],
                          ),
                          // Space between
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // ? Clear PIN fields & errors
                              CTACancelButton(
                                text: 'Clear',
                                onTap: () {
                                  setState(() {
                                    errorMessage = '';
                                  });
                                  _pin1Controller.clear();
                                  _pin2Controller.clear();
                                  _pin3Controller.clear();
                                  _pin4Controller.clear();
                                },
                              ),
                              // ? Find user button
                              CTAConfirmButton(
                                text: 'Find',
                                onTap: () async {
                                  combinedCode =
                                      "${_pin1Controller.text}${_pin2Controller.text}${_pin3Controller.text}${_pin4Controller.text}";
                                  debugPrint(combinedCode);
                                  // ? If less than 4 digits entered == show error
                                  if (combinedCode.length != 4) {
                                    setState(() {
                                      errorMessage =
                                          '* Please enter all 4 digits';
                                    });
                                  } else {
                                    // ? Match user pin & display pop up modal with their info
                                    GeneratePincode(pincode: combinedCode);
                                    staticPin =
                                        await GeneratePincode.getStaticPincode(
                                            combinedCode);
                                    friend =
                                        await _getConnectionData(staticPin);
                                    setState(
                                      () async {
                                        // Clear error message
                                        setState(() {
                                          errorMessage = '';
                                        });
                                        hasError = false;
                                        // ? If no match found == show error
                                        if ('${friend['fullName']}' == 'null') {
                                          setState(() {
                                            errorMessage =
                                                'Oops! That\'s an invalid code. Please try again!';
                                          });
                                        } else {
                                          // ? Clear PIN fields & any error message when matched
                                          setState(() {
                                            errorMessage = '';
                                          });
                                          _pin1Controller.clear();
                                          _pin2Controller.clear();
                                          _pin3Controller.clear();
                                          _pin4Controller.clear();
                                          // ? Modal with matching connections details

                                          displayModalBottomSheet(
                                            context,
                                            '${friend['fullName']}',
                                            '${friend['pronouns']}',
                                            '${friend['industry']}',
                                            '${friend['imageLink']}',
                                            '${friend['pincode']}',
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ), // End of PIN Actions
                  // Space between PIN & Quick Card
                  const SizedBox(
                    height: 40,
                  ),
                  // ? Quick Card
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        width: 290,
                        height: 140,
                        decoration: BoxDecoration(
                          color: niftiWhite,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: const Offset(1, -0.5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDisplay(
                              text: 'MY QUICK CARD',
                              color: niftiLightGrey,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // ? PROFILE INFO
                            // profile image stack + check
                            Row(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    details['imageLink'] != ''
                                        ? CircleAvatar(
                                            radius: 38,
                                            backgroundImage: const AssetImage(
                                                'images/defaultProfileImage.png'),
                                            child: CircleAvatar(
                                              radius: 36,
                                              backgroundImage: NetworkImage(
                                                  '${details['imageLink']}',
                                                  scale: 1.0),
                                            ),
                                          )
                                        : const CircleAvatar(
                                            radius: 38,
                                            backgroundImage: AssetImage(
                                                'images/defaultProfileImage.png'),
                                          ),
                                    // Pronoun Stack + check
                                    details['pronouns'] != ''
                                        ? Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              // Gradient Border
                                              Container(
                                                width: 86,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  gradient: niftiGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              // Pronouns
                                              Container(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                width: 84,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: niftiWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  '${details['pronouns']}',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: niftiGrey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                // Space between
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ? Display Full Name
                                    TextDisplay(
                                      text: '${details['fullName']}',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1,
                                    ),
                                    // ? Divder & Space between
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 0.3,
                                      width: 175,
                                      color: niftiLightGrey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextDisplay(
                                      text: '${details['industry']}',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // ? Code Container
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        width: 100,
                        height: 140,
                        decoration: BoxDecoration(
                          color: niftiWhite,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1.0,
                              blurRadius: 3.0,
                              offset: const Offset(1, -0.5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDisplay(
                              text: 'MY CODE',
                              color: niftiLightGrey,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // ? Pin Code Display
                            Column(
                              // ? map 2 characters per line
                              children: pinCodeChunks.map((chunk) {
                                return GradientText(
                                  chunk,
                                  colors: const [
                                    Color.fromRGBO(209, 147, 246, 1),
                                    Color.fromRGBO(115, 142, 247, 1),
                                    Color.fromRGBO(116, 215, 247, 1),
                                  ],
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 11,
                                    height: 1.2,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _LoginPageState (STATE) * ---------------- *