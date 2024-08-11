import 'package:chat_me/common/common_background/common_background.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:chat_me/constant/static_decoration.dart';
import 'package:chat_me/views/main_views/screen/contact_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      floatingChild: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: appPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ContactListScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add, color: appWhiteColor),
      ),
      title: "ChatMe",
      isLeading: false,
      child: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: grayColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: appPrimaryColor,
                  child: Text(
                    "${index + 1}",
                    style: AppTextStyle.normalSemiBold10
                        .copyWith(color: appWhiteColor),
                  ),
                ),
                width10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "+91 0123456789",
                        style: AppTextStyle.normalSemiBold10.copyWith(
                          fontSize: 14.0,
                          color: appPrimaryColor,
                        ), //.copyWith(color: appPrimaryColor),
                      ),
                      height05,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello how are you",
                            style: AppTextStyle.normalRegularBold12.copyWith(
                              color: appPrimaryColor,
                            ), //.copyWith(color: appPrimaryColor),
                          ),
                          Text(
                            "10:30  ",
                            style: AppTextStyle.normalSemiBold10.copyWith(
                              fontSize: 10.0,
                              color: appPrimaryColor,
                            ), //.copyWith(color: appPrimaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
