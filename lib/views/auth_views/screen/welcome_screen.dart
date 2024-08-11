import 'dart:developer';

import 'package:chat_me/common/common_background/common_background.dart';
import 'package:chat_me/common/common_button/common_button.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:chat_me/constant/static_decoration.dart';
import 'package:chat_me/views/auth_views/provider/auth_provider.dart';
import 'package:chat_me/views/auth_views/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      title: "ChatMe",
      isLeading: false,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to ChatMe",
                style: AppTextStyle.normalSemiBold20,
              ),
              height20,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: appPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    authProvider.setContryCode(number.dialCode!);
                    debugPrint(number.dialCode);
                  },
                  onInputValidated: (bool isValid) {
                    debugPrint(isValid ? 'Valid number' : 'Invalid number');
                  },
                  spaceBetweenSelectorAndTextField: 0,
                  selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DROPDOWN,
                      showFlags: false),
                  initialValue: PhoneNumber(isoCode: 'IN'), // Default to India

                  textFieldController: authProvider.phoneController,
                  inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your phone number',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    hintStyle: AppTextStyle.normalRegularBold15,
                  ),

                  textStyle: AppTextStyle.normalRegularBold15,
                  formatInput: true,
                  selectorTextStyle: AppTextStyle.normalRegularBold15,
                ),
              ),
              customHeight(50),
              commonOutlineButton(
                title: authProvider.isLoading ? "Loading..." : "Send",
                onTap: () {
                  log("Phone number: ${authProvider.phoneController.text}");
                  authProvider
                      .verifyPhoneNumber(authProvider.phoneController.text)
                      .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const OtpScreen();
                              },
                            ),
                          ));
                },
                color: appPrimaryColor,
                textColor: appWhiteColor,
              ),
            ],
          );
        }),
      ),
    );
  }
}
