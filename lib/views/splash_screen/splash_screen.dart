import 'dart:async';

import 'package:chat_me/common/storage_key.dart';
import 'package:chat_me/main.dart';
import 'package:chat_me/views/auth_views/screen/welcome_screen.dart';
import 'package:chat_me/views/main_views/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isConnected = false;
  @override
  void initState() {
    super.initState();
    //   if (!kIsWeb) monitorConnection();+
    Timer(const Duration(seconds: 3), () async {
      //     isConnected = await InternetConnectionChecker().hasConnection;
      //     if (!isConnected) {
      //       log("message");
      //     } else {
      navigateBasedOnUserStatus();
      //     }
    });
  }

  void navigateBasedOnUserStatus() {
    String? tokens = storage.read(userUID);

    if (tokens == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/app_logo.svg",
            ),
          ],
        ),
      ),
    );
  }
}
