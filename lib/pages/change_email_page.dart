import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/text_form_field.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/functions/frontend.dart';
import 'package:nifti_locapp/functions/functions.dart';

// ? ChangeEmail == User access to update account email

// * ---------------- * (STATEFUL WIDGET) CLASS ChangeEmail (STATEFUL WIDGET) * ---------------- *
class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}
// * ---------------- * END OF (STATE) CLASS ChangeEmail (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ChangeEmailState (STATE) * ---------------- *
class _ChangeEmailState extends State<ChangeEmail> {
  // ? Text Controllers - used to access the user's input
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  //late String _email = _emailController.text;

  // ? Validation Variables
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _confirmEmailError;
  bool isError = false;

  Future _updateEmail() async {
    try {
      late dynamic userRef = FirebaseAuth.instance.currentUser!;
      late dynamic email = _confirmEmailController.text;
      await userRef.updateEmail(email);
    } catch (e) {
      //
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

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
            body: SingleChildScrollView(
                child: Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ? Illustration
                          SizedBox(
                            height: 300,
                            width: 400,
                            child: Image.asset('images/email.png'),
                          ),
                          // Space between
                          const SizedBox(
                            height: 10,
                          ),
                          // ? Title
                          Text(
                            'Update Email',
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
                            text: 'This will replace your current login email',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          // Space between
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // ? Email Field
                                TextFieldComponent(
                                  controller: _emailController,
                                  labelText: 'New Email',
                                  obscureText: false,
                                  hasError: _emailError == null,
                                  errorText: _emailError,
                                ),
                                // Space between
                                const SizedBox(
                                  height: 40,
                                ),
                                // ? Confirm Email Field
                                TextFieldComponent(
                                  controller: _confirmEmailController,
                                  labelText: 'Confirm Email',
                                  obscureText: false,
                                  hasError: _confirmEmailError != null,
                                  errorText: _confirmEmailError,
                                ),
                                // Space between
                                const SizedBox(
                                  height: 40,
                                ),
                                // ? Buttons
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // ? Cancel Button
                                      CTACancelButton(
                                        onTap: () {
                                          // ? Closes modal
                                          if (context.mounted) {
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                      // ? Update Button
                                      CTAConfirmButton(
                                        text: 'Update',
                                        onTap: () {
                                          _updateEmail();
                                          // ? Validate the form using the _formKey
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Email
                                            bool isEmailValid =
                                                validateAndHandleError(
                                                    _emailController.text,
                                                    emptyEmailErrorMessage,
                                                    (error) => setState(() =>
                                                        _emailError = error));

                                            // Confirm Email
                                            bool isConfirmEmailValid =
                                                validateAndHandleError(
                                                    _confirmEmailController
                                                        .text,
                                                    emptyConfirmPasswordErrorMessage,
                                                    (error) => setState(() =>
                                                        _confirmEmailError =
                                                            error));

                                            // Match Emails
                                            bool areEmailsMatching = fieldsMatch(
                                                _emailController.text,
                                                _confirmEmailController.text,
                                                emailsNotMatchingErrorMessage,
                                                (error) => setState(() =>
                                                    _confirmEmailError =
                                                        error));

                                            // If all fields are valid == proceed with registration
                                            if (isEmailValid &&
                                                isConfirmEmailValid &&
                                                areEmailsMatching) {
                                              // ! Update firestore function
                                              _updateEmail();
                                              // Pop loading context
                                              Navigator.pop(context);
                                            }
                                          }
                                        },
                                      ),
                                    ]),
                                // Space
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        ])))));
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ChangeEmailState (STATE) * ---------------- *
