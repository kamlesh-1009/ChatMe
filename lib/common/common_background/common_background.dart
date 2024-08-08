import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  // const CommonBackground({Key? key}) : super(key: key);
  final String title;
  final bool isLeading;
  final Widget? child;
  const CommonBackground(
      {super.key, required this.title, this.isLeading = true, this.child});

  @override

  /// This widget represents the common background for various screens in the app.
  ///
  /// It consists of an app bar with a leading icon button and a title.
  /// The body of the scaffold is a container with rounded corners and a white background color.
  ///
  /// The [title] parameter is the title of the app bar.
  /// The [isLeading] parameter is a boolean indicating whether to show the leading icon button.
  /// The [child] parameter is the widget to be displayed inside the body container.
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the scaffold.
      backgroundColor: appPrimaryColor,

      // Define the app bar widget.
      appBar: AppBar(
        centerTitle: true, // Center the title in the app bar.
        backgroundColor:
            appPrimaryColor, // Set the background color of the app bar.
        elevation: 0.0, // Remove the elevation of the app bar.

        // Define the leading icon button.
        leading: isLeading
            ? IconButton(
                onPressed: () {
                  // When the leading icon button is pressed, navigate back.
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: appWhiteColor, // Set the color of the icon.
                ),
              )
            : const SizedBox(), // If isLeading is false, display an empty widget.

        // Define the title widget.
        title: Text(
          title,
          style: AppTextStyle.normalRegularBold25.copyWith(
              color: appWhiteColor), // Set the text style of the title.
        ),
      ),

      // Define the body of the scaffold.
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Set the width of the container.
        height: MediaQuery.of(context)
            .size
            .height, // Set the height of the container.
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                30), // Set the top border radius of the container.
          ),
          color: appWhiteColor, // Set the background color of the container.
        ),
        child: child, // Display the child widget inside the container.
      ),
    );
  }
}
