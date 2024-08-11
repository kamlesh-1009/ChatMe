import 'package:chat_me/common/common_background/common_background.dart';
import 'package:chat_me/common/common_button/common_button.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:chat_me/constant/static_decoration.dart';
import 'package:chat_me/views/auth_views/provider/auth_provider.dart';
import 'package:chat_me/views/main_views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      title: "ChatMe",
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to ChatMe",
                style: AppTextStyle.normalSemiBold20,
              ),
              height20,
              Text(
                "Enter SMS code",
                style: AppTextStyle.normalSemiBold15,
              ),
              height20,
              PinCodeTextField(
                appContext: context,
                length: 6,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }
                },
                controller: authProvider.otpController,
                pinTheme: PinTheme(
                  activeColor: appPrimaryColor,
                  selectedColor: appPrimaryColor,
                  inactiveColor: appPrimaryColor,
                  selectedFillColor: appWhiteColor,
                  inactiveFillColor: appWhiteColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
              ),
              customHeight(50),
              commonOutlineButton(
                title: "Done",
                onTap: () {
                  authProvider
                      .signInWithOTP(authProvider.otpController.text, context)
                      .then(
                    (value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
                      }
                    },
                  );
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const HomeScreen();
                  //     },
                  //   ),
                  //   (route) => false,
                  // );
                },
                color: appPrimaryColor,
                textColor: appWhiteColor,
              ),
            ],
          ),
        );
      }),
    );
  }
}
