import 'package:chat_me/firebase_options.dart';
import 'package:chat_me/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

late GetStorage storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
  // NotificationRepo.init();

  storage = GetStorage();
  runApp(const MyApp());
}
