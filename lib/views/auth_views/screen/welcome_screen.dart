import 'package:chat_me/common/common_background/common_background.dart';
import 'package:chat_me/common/text_widgets/input_text_field_widget.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:chat_me/constant/static_decoration.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      title: "ChatMe",
      isLeading: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to ChaMe",
            style: AppTextStyle.normalSemiBold20,
          ),
          height10,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: appPrimaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CountryCodePicker(
                  onChanged: (element) => debugPrint(element.toLongString()),
                  initialSelection: 'TF',
                  showCountryOnly: false,
                  showFlag: false,
                  showFlagDialog: true,
                  showOnlyCountryWhenClosed: false,
                  textStyle: AppTextStyle.normalRegularBold15,
                  favorite: const ['+91', 'FR'],
                ),
                const SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    color: appPrimaryColor,
                  ),
                ),
                Expanded(
                  child: textFormField(
                      maxLines: 1,
                      keyboardType: const TextInputType.numberWithOptions()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
