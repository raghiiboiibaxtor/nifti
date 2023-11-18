import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nifti_locapp/components/app_theme.dart';
import 'package:nifti_locapp/components/text_display.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatefulWidget {
  // Component Variables
  final String imageLink;
  final String pronouns;
  final String fullName;
  final String bio;
  final String industry;
  final String city;
  final String role;
  final String company;
  final String yearsWorked;
  final String email;
  final String website;
  final String github;
  final String linkedin;
  final String instagram;
  final String phone;

  const ProfileCard({
    super.key,
    this.imageLink = '',
    this.pronouns = '',
    this.fullName = '',
    this.bio = '',
    this.industry = '',
    this.city = '',
    this.role = '',
    this.company = '',
    this.yearsWorked = '',
    this.email = '',
    this.website = '',
    this.github = '',
    this.linkedin = '',
    this.instagram = '',
    this.phone = '',
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // Function to open links
  onLaunch(url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // Gradient "border container"
        Container(
          height: 590,
          decoration: BoxDecoration(
            gradient: niftiGradient,
            boxShadow: [
              BoxShadow(
                color: niftiGreyShadow,
                spreadRadius: 1.0,
                blurRadius: 3.0,
                offset: const Offset(0, 1),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(1),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        // Profile Container
        Container(
          width: 357,
          height: 587,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1),
              topRight: Radius.circular(49),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // ? PROFILE INFO
              // profile image stack + check
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  widget.imageLink != ''
                      ? CircleAvatar(
                          radius: 75,
                          backgroundImage: const AssetImage(
                              'images/defaultProfileImage.png'),
                          child: CircleAvatar(
                            radius: 72,
                            backgroundImage:
                                NetworkImage(widget.imageLink, scale: 1.0),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 75,
                          backgroundImage:
                              AssetImage('images/defaultProfileImage.png'),
                        ),
                  // Pronoun Stack + check
                  widget.pronouns != ''
                      ? Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            // Gradient Border
                            Container(
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                gradient: niftiGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            // Pronouns
                            Container(
                              alignment: AlignmentDirectional.center,
                              width: 97,
                              height: 23,
                              decoration: BoxDecoration(
                                color: niftiWhite,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.pronouns,
                                style: TextStyle(
                                  fontSize: 12,
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
              // Spacing
              const SizedBox(
                height: 15,
              ),
              // ? Display Full Name
              TextDisplay(
                text: widget.fullName,
                fontSize: 34,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
              // Divider + spacing
              const SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: niftiLightBlue,
              ),
              const SizedBox(
                height: 5,
              ), // End of divider + spacing
              // ? Display About
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDisplay(
                      text: 'About Me',
                      color: niftiLightGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Bio + check
                    widget.bio == ''
                        ? Column(children: [
                            const SizedBox(
                              height: 45,
                            ),
                            TextDisplay(
                              text:
                                  'TAP EDIT TO FINISH SETTING UP YOUR PROFILE! 🥳',
                              fontSize: 16,
                              color: niftiDarkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ])
                        : TextDisplay(
                            text: widget.bio,
                            fontSize: 13,
                          ),

                    const SizedBox(
                      height: 10,
                    ),
                    // Tags == Industry & City
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Industry
                        widget.industry != ''
                            ? Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.building_2_fill,
                                    size: 14,
                                    color: niftiGrey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextDisplay(
                                    text: widget.industry,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        // City / Town
                        widget.city != ''
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 14,
                                    color: niftiGrey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextDisplay(
                                    text: widget.city,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
              // Divider + spacing
              const SizedBox(
                height: 10,
              ),
              widget.role != ''
                  ? Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: niftiLightBlue,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 5,
              ), // End of divider + spacing
              // ? Display Role / Study
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.role != ''
                        ? TextDisplay(
                            text: 'Current Role / Study',
                            color: niftiLightGrey,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.role != ''
                        ? Row(
                            children: [
                              Icon(
                                CupertinoIcons.star,
                                size: 14,
                                color: niftiGrey,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              TextDisplay(
                                text: widget.role,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    // Tags == Company & Years Worked
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Industry
                        widget.company != ''
                            ? Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.pin,
                                    size: 13,
                                    color: niftiGrey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextDisplay(
                                    text: widget.company,
                                    fontSize: 13,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        // City / Town
                        widget.yearsWorked != ''
                            ? Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.time,
                                    size: 13,
                                    color: niftiGrey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextDisplay(
                                    text: widget.yearsWorked,
                                    fontSize: 13,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
              // Divider + spacing
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: niftiLightBlue,
              ),
              const SizedBox(
                height: 5,
              ), // End of divider + spacing
              // ? Contact details
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDisplay(
                      text: 'Get In Touch',
                      color: niftiLightGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),

                    // ? Display email + copy function
                    widget.email != ''
                        ? Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              // Base shape
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1.0,
                                      blurRadius: 3.0,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  color: niftiWhite,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(1),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              // Icon Shape
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0.5,
                                      blurRadius: 3.0,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  color: niftiWhite,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(1),
                                    bottomLeft: Radius.circular(17),
                                  ),
                                ),
                                child: Icon(
                                  CupertinoIcons.mail,
                                  color: niftiGrey,
                                  size: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Tooltip(
                                      message: 'Copy ${widget.email}',
                                      preferBelow: false,
                                      showDuration: const Duration(seconds: 5),
                                      decoration: ShapeDecoration(
                                          color: niftiGrey,
                                          shape: const ToolTipCustomShape()),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          overlayColor:
                                              // removing spash visuals
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                        ),
                                        onPressed: () {
                                          // ? Open
                                          onLaunch(
                                              'mailto:${widget.email}?subject=&body=');
                                          // ? Copy
                                          Clipboard.setData(ClipboardData(
                                              text: widget.email));
                                        },
                                        child: GradientText(
                                          widget.email,
                                          colors: const [
                                            Color.fromRGBO(209, 147, 246, 1),
                                            Color.fromRGBO(115, 142, 247, 1),
                                            Color.fromRGBO(116, 215, 247, 1),
                                          ],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          )
                        : // If no email, then don't show UI
                        Container(),
                    // ? Website, Social, & Contact Links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ? Website Link
                        widget.website != ''
                            ? Container(
                                padding: const EdgeInsets.only(right: 23),
                                child: IconButton(
                                  // Open Link
                                  onPressed: () {
                                    onLaunch(widget.website);
                                  },
                                  icon: const Icon(CupertinoIcons.globe),
                                  color: niftiGrey,
                                  style: ButtonStyle(
                                    overlayColor:
                                        // removing spash visuals
                                        MaterialStateProperty.all(
                                            Colors.transparent),
                                  ),
                                ),
                              )
                            : Container(),
                        // ? Linkedin Link
                        widget.linkedin != ''
                            ? Container(
                                padding: const EdgeInsets.only(right: 23),
                                child: SocialMediaButton.linkedin(
                                  // Open Link
                                  onTap: () {
                                    onLaunch(widget.linkedin);
                                  },
                                  size: 25,
                                  color: niftiGrey,
                                ),
                              )
                            : Container(),
                        // ? Instagram Link
                        widget.instagram != ''
                            ? Container(
                                padding: const EdgeInsets.only(right: 23),
                                child: SocialMediaButton.instagram(
                                  // Open link
                                  onTap: () async {
                                    onLaunch(widget.instagram);
                                  },
                                  size: 25,
                                  color: niftiGrey,
                                ),
                              )
                            : Container(),
                          // ? Github Link
                        widget.github != ''
                            ? Container(
                                padding: const EdgeInsets.only(right: 23),
                                child: SocialMediaButton.github(
                                  // Open Link
                                  onTap: () {
                                    onLaunch(widget.github);
                                  },
                                  size: 25,
                                  color: niftiGrey,
                                ),
                              )
                            : Container(),
                        // ? Phone number
                        widget.phone != ''
                            ? IconButton(
                                // Open messaging
                                onPressed: () {
                                  onLaunch('sms:${widget.phone}');
                                },
                                icon: const Icon(CupertinoIcons.phone),
                                color: niftiGrey,
                                style: ButtonStyle(
                                  overlayColor:
                                      // removing spash visuals
                                      MaterialStateProperty.all(
                                          Colors.transparent),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  // * ---------------- * END OF (PROFILE DISPLAY) * ---------------- *
}

// ? Custom tooltip appearance
class ToolTipCustomShape extends ShapeBorder {
  final bool usePadding;
  const ToolTipCustomShape({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 20)
      ..relativeLineTo(10, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
