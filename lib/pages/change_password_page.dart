import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/text_form_field.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/functions/frontend.dart';

// ? ChangePassword == User access to update account email

// * ---------------- * (STATEFUL WIDGET) CLASS ChangePassword (STATEFUL WIDGET) * ---------------- *
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}
// * ---------------- * END OF (STATE) CLASS ChangePassword (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ChangePasswordState (STATE) * ---------------- *
class _ChangePasswordState extends State<ChangePassword> {
  // ? Text Controllers - used to access the user's input
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // ? Validation Variables
  final _formKey = GlobalKey<FormState>();
  String? _currentPasswordError;
  String? _passwordError;
  String? _confirmPasswordError;
  bool isError = false;

  Future _updatePassword() async {
    try {
      late dynamic userRef = FirebaseAuth.instance.currentUser!;
      late dynamic password = _confirmPasswordController.text;
      await userRef.updatePassword(password);
    } catch (e) {
      //
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
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
                            child: Image.asset('images/password.png'),
                          ),
                          // Space between
                          const SizedBox(
                            height: 10,
                          ),
                          // ? Title
                          Text(
                            'Update Password',
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
                            text: 'This will replace your current password',
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
                                // ? Current Password Field
                                TextFieldComponent(
                                  controller: _passwordController,
                                  labelText: 'Current Password',
                                  obscureText: true,
                                  hasError: _currentPasswordError == null,
                                  errorText: _currentPasswordError,
                                ),
                                // Space between
                                const SizedBox(
                                  height: 30,
                                ),
                                // ? New Password Field
                                TextFieldComponent(
                                  controller: _newPasswordController,
                                  labelText: 'New Password',
                                  obscureText: true,
                                  hasError: _passwordError == null,
                                  errorText: _passwordError,
                                ),
                                // Space between
                                const SizedBox(
                                  height: 30,
                                ),
                                // ? Confirm Password Field
                                TextFieldComponent(
                                  controller: _confirmPasswordController,
                                  labelText: 'Confirm Password',
                                  obscureText: true,
                                  hasError: _confirmPasswordError != null,
                                  errorText: _confirmPasswordError,
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
                                          // ? Validate the form using the _formKey
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // Current Password
                                            bool isCurrentPasswordValid =
                                                validateAndHandleError(
                                                    _passwordController.text,
                                                    emptyPasswordErrorMessage,
                                                    (error) => setState(() =>
                                                        _currentPasswordError =
                                                            error));

                                            // New Password
                                            bool isNewPasswordValid =
                                                validateAndHandleError(
                                                    _newPasswordController.text,
                                                    emptyPasswordErrorMessage,
                                                    (error) => setState(() =>
                                                        _passwordError =
                                                            error));

                                            // Confirm password
                                            bool isConfirmPasswordlValid =
                                                validateAndHandleError(
                                                    _confirmPasswordController
                                                        .text,
                                                    emptyConfirmPasswordErrorMessage,
                                                    (error) => setState(() =>
                                                        _confirmPasswordError =
                                                            error));

                                            // Match Passwords
                                            bool arePasswordsMatching = fieldsMatch(
                                                _newPasswordController.text,
                                                _confirmPasswordController.text,
                                                passwordsNotMatchingErrorMessage,
                                                (error) => setState(() =>
                                                    _confirmPasswordError =
                                                        error));

                                            // If all fields are valid == proceed with registration
                                            if (isCurrentPasswordValid &&
                                                isNewPasswordValid &&
                                                isConfirmPasswordlValid &&
                                                arePasswordsMatching) {
                                              // ! Update firestore function
                                              _updatePassword();
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
// * ---------------- * END OF (STATE) CLASS _ChangePasswordState (STATE) * ---------------- *
