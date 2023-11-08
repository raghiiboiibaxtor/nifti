import 'package:flutter/material.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:nifti_locapp/components/app_theme.dart';

// ? PRIVACY POLICY / CONDITIONS MODAL
void privacyPopup(context) {
  showModalBottomSheet<void>(
    backgroundColor: niftiWhite,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          height: 1720,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextDisplay(
                text: 'Privacy Policy and Conditions',
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(height: 12),
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'Welcome to Nifti, a social contacts app designed to help you connect easily. Protecting your privacy and ensuring a fair user experience are important to us. This Privacy Policy and Conditions document explains how we collect, use, and protect your personal information and the terms and conditions you agree to when using the app.'),
              ),
              const SizedBox(height: 12),
              const TextDisplay(
                text: 'Last Updated: 27 October, 2023',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              // ? Space & Divider
              const SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                color: niftiLightBlue,
              ),
              const SizedBox(
                height: 5,
              ),
              // ? One
              const TextDisplay(
                text: '1. Acceptance of Terms',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // ? Space & Divider
              const SizedBox(
                height: 5,
              ),
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'By downloading, accessing, or using the Nifti app, you accept and agree to be bound by these Terms & Conditions and Privacy Policy. If you do not agree with any part of these terms, please refrain from using the app.'),
              ),
              const SizedBox(
                height: 15,
              ),
              // ? Two
              // Title
              const TextDisplay(
                text: '2. User Registration',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'You agree to provide accurate and complete information during the registration process. It is your responsibility to maintain the confidentiality of your account details and to keep your PIN secure.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 3
              // Title
              const TextDisplay(
                text: '3. Privacy',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'Your use of the app is also governed by our Privacy Policy, which outlines how we collect, use, and disclose your personal information. Please review our Privacy Policy for more details.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 4
              // Title
              const TextDisplay(
                text: '4. Information We Collect',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'User Profile: We collect the information you provide, such as your name, photo, contact info, current work/study, and social links.'),
              ),
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'Usage Data: We collect data about your interactions with the app, including usage patterns, IP address, and device information.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 5
              // Title
              const TextDisplay(
                text: '5. How We Use Your Information',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const TextDisplay(
                  fontSize: 13,
                  text: 'We use your information for the following purposes:'),
              const TextDisplay(
                  fontSize: 13,
                  text: '- To create and maintain your Nifti account.'),
              const TextDisplay(
                  fontSize: 13,
                  text: '- To facilitate connections between users.'),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 6
              // Title
              const TextDisplay(
                text: '6. Data Security',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'We take data security seriously. Your information is securely stored in Firebase, and we implement measures to protect your data from unauthorized access.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 7
              // Title
              const TextDisplay(
                text: '7. User Conduct',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'You must use Nifti in compliance with all applicable laws and regulations. You agree not to engage in any activity that may harm, disrupt, or interfere with the app\'s operation or the experience of other users.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 8
              // Title
              const TextDisplay(
                text: '8. Third-Party Services',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'Nifti may use third-party services, such as Firebase, to provide its features. These services have their own privacy policies, and your use of Nifti implies acceptance of these policies.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 9
              // Title
              const TextDisplay(
                text: '9. Your Choices',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'You can update or delete your personal information within the app at any time.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 10
              // Title
              const TextDisplay(
                text: '10. Disclaimers',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'Nifti is provided "as-is" without any warranties. We do not guarantee the accuracy, reliability, or availability of the app. You use it at your own risk.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 11
              // Title
              const TextDisplay(
                text: '11. Termination',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'We reserve the right to terminate or suspend your account at our discretion for any reason, without prior notice.'),
              ),
              // Space
              const SizedBox(
                height: 15,
              ),
              // ? 12
              // Title
              const TextDisplay(
                text: '12. Changes to Privacy Policy and Terms',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const Expanded(
                flex: 0,
                child: TextDisplay(
                    fontSize: 13,
                    text:
                        'We may update this Privacy Policy and Terms & Conditions from time to time. You will be notified of any changes. Continued use of the app after updates constitutes acceptance of the new terms.'),
              ),
              // ? Space & Divider
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: niftiLightBlue,
              ),
              // Space
              const SizedBox(
                height: 10,
              ),
              // Title
              const TextDisplay(
                text: 'Thank you for using Nifti!',
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              // Space
              const SizedBox(
                height: 5,
              ),
              // Content
              const TextDisplay(fontSize: 13, text: 'The Nifti Team'),
              const TextDisplay(
                  fontSize: 13, text: 'Christchurch, New Zealand'),
              // Space
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    },
  );
} // End of terms of conditions