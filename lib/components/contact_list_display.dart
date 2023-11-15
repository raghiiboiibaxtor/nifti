import "package:flutter/material.dart";
import "package:nifti_locapp/components/app_theme.dart";
import "package:nifti_locapp/components/text_display.dart";

//  ListDisplay == widget to display a card with contact details

// * ---------------- * (STATEFUL WIDGET) ListDisplay (STATEFUL WIDGET) * ---------------- *
class ListDisplay extends StatefulWidget {
  // Component Variables
  final String name;
  final String industry;
  final String pronouns;
  final String profileImageUrl;
  final Function()? onTap;
  // ? Required variables to be passed
  const ListDisplay({
    super.key,
    this.name = '',
    this.industry = '',
    this.pronouns = '',
    this.profileImageUrl = '',
    required this.onTap,
  });

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}
// * ---------------- * END OF (STATE) CLASS ListDisplay (STATE) * ---------------- *

// * ---------------- * (STATE) CLASS _ListDisplayState (STATE) * ----------------
class _ListDisplayState extends State<ListDisplay> {
  @override
  void initState() {
    super.initState();
  }

  // * ---------------- * (BUILD WIDGET) * ---------------- *
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: widget.onTap,
            child: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
              margin: const EdgeInsets.only(bottom: 15),
          alignment: AlignmentDirectional.topStart,
          width: 355,
          height: 90,
          decoration: BoxDecoration(
            color: niftiWhite,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0.8, 0.8),
              ),
            ],
          ),
          child:
              Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ? PROFILE INFO
                  // profile image stack + check
                  Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          widget.profileImageUrl != ''
                              ? CircleAvatar(
                                  radius: 35,
                                  backgroundImage: const AssetImage(
                                      'images/defaultProfileImage.png'),
                                  child: CircleAvatar(
                                    radius: 33,
                                    backgroundImage: NetworkImage(
                                        widget.profileImageUrl,
                                        scale: 1.0),
                                  ),
                                )
                              : const CircleAvatar(
                                  radius: 33,
                                  backgroundImage: AssetImage(
                                      'images/defaultProfileImage.png'),
                                ),
                          // ? Pronouns
                          widget.pronouns != ''
                              ? Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    // Gradient Border
                                    Container(
                                      width: 84,
                                      height: 17,
                                      decoration: BoxDecoration(
                                        gradient: niftiGradient,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    // Pronouns
                                    Container(
                                      alignment: AlignmentDirectional.center,
                                      width: 82,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: niftiWhite,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        widget.pronouns,
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
                            text: widget.name,
                            fontSize: 16,
                            fontWeight: FontWeight.w700, 
                          ),
                          // ? Divder & Space between
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 0.3,
                            width: 220,
                            color: niftiLightGrey,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // ? Contact Industry
                          TextDisplay(
                            text: widget.industry,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
        );
  }
  // * ---------------- * END OF (BUILD WIDGET) * ---------------- *
}
// * ---------------- * END OF (STATE) CLASS _ListDisplayState (STATE) * ---------------- *
