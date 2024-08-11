import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> _contacts = [];
  bool _isLoading = false;

  List<Contact> get contacts => _contacts;
  bool get isLoading => _isLoading;

  Future<bool> requestPermission() async {
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      status = await Permission.contacts.request();
    }
    return status.isGranted;
  }

  Future<void> fetchContacts() async {
    _isLoading = true;
    notifyListeners();

    if (await requestPermission()) {
      log("Permission granted. Fetching contacts...");

      // Retrieve all contacts with their properties
      List<Contact> allContacts =
          await FlutterContacts.getContacts(withProperties: true);

      // Filter out contacts that do not have any phone numbers
      _contacts =
          allContacts.where((contact) => contact.phones.isNotEmpty).toList();

      log("Contacts with phone numbers fetched: $_contacts");
    } else {
      log('Permission denied');
    }

    _isLoading = false;
    notifyListeners();
  }
}
