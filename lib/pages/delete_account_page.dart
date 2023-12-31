// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:nifti_locapp/auth/auth.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/back_app_bar.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/text_form_field.dart';
import 'package:nifti_locapp/components/cta_cancel_button.dart';
import 'package:nifti_locapp/components/cta_confirm_button.dart';
import 'package:nifti_locapp/functions/frontend.dart';
import 'package:nifti_locapp/functions/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ? DeleteAccount == User access to permanently delete their account

// * ---------------- * (STATEFUL WIDGET) CLASS DeleteAccount (STATEFUL WIDGET) * ---------------- *
class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}
// * ---------------- * END OF (STATE) CLASS DeleteAccount (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _DeleteAccountState (STATE) * ---------------- *
class _DeleteAccountState extends State<DeleteAccount> {
  // Save the context before entering async code
  late BuildContext myContext;
  // ? Text Controllers - used to access the user's input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // ? Validation Variables
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;
  bool isError = false;
  bool accountDeleted = false;

  // ? Email & Password Login Method to Confirm Account Deletion
  Future login() async {
    // ? Loading Animation
    displayLoadingCircle(context);
    // ? Sign in check
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // ? Delete account
      NiftiFirestoreFunctions.deleteAccount();
      // ? Redirects to Login Page and remove previous page history
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AuthPage(),), (route) => false);

    } on FirebaseAuthException catch (error) {
      if (context.mounted) Navigator.pop(context);
      // ? Handle specific error codes and display custom messages
      if (error.code == 'invalid-email') {
        emailFormatError(_emailController.text, invalidEmailFormat,
            (error) => setState(() => _emailError = error));
      } else if (error.code == 'user-not-found') {
        emailNotFoundError(_emailController.text, emailNotFound,
            (error) => setState(() => _emailError = error));
      } else if (error.code == 'wrong-password') {
        passwordError(_passwordController.text, incorrectPassword,
            (error) => setState(() => _passwordError = error));
      }
    }
  }

  // ? Dispose controllers when not using - helps memory management
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    myContext = context;
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
                            child: Image.asset('images/delete.png'),
                          ),
                          // Space between
                          const SizedBox(
                            height: 10,
                          ),
                          // ? Title
                          Text(
                            'Delete Account',
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
                            text:
                                'CAUTION! This will permanently delete your account',
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
                                  labelText: 'Email',
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
                                  controller: _passwordController,
                                  labelText: 'Password',
                                  obscureText: true,
                                  hasError: _passwordError != null,
                                  errorText: _passwordError,
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
                                        text: 'Delete',
                                        onTap: () {
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
                                            // Password
                                            bool isPasswordValid =
                                                validateAndHandleError(
                                                    _passwordController.text,
                                                    emptyConfirmPasswordErrorMessage,
                                                    (error) => setState(() =>
                                                        _passwordError =
                                                            error));
                                            // If all fields are valid == proceed with registration
                                            if (isEmailValid &&
                                                isPasswordValid) {
                                              // ? Confirm login details prior to deletion delete
                                              login();
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
// * ---------------- * END OF (STATE) CLASS _DeleteAccountState (STATE) * ---------------- *
