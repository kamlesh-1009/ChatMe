import 'package:chat_me/common/common_background/common_background.dart';
import 'package:chat_me/constant/app_colors.dart';
import 'package:chat_me/constant/app_style.dart';
import 'package:chat_me/constant/static_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contact_provider.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      title: 'Contacts',
      floatingChild: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: appPrimaryColor,
        onPressed: () {
          Provider.of<ContactProvider>(context, listen: false).fetchContacts();
        },
        child: const Icon(Icons.refresh, color: appWhiteColor),
      ),
      child: ChangeNotifierProvider(
        create: (context) => ContactProvider()
          ..requestPermission()
          ..fetchContacts(),
        child: Consumer<ContactProvider>(
          builder: (context, contactProvider, child) {
            if (contactProvider.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: appPrimaryColor,
              ));
            }

            if (contactProvider.contacts.isEmpty) {
              return const Center(child: Text('No contacts found.'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                final contact = contactProvider.contacts[index];
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
                        child: contact.photo == null
                            ? Text(
                                (contact.displayName).split(' ')[0][0],
                                style: AppTextStyle.regularBold20.copyWith(
                                  color: appWhiteColor,
                                ),
                              )
                            : Image.memory(contact.photo!, fit: BoxFit.fill),
                      ),
                      width10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (contact.displayName),
                              style: AppTextStyle.normalSemiBold10.copyWith(
                                fontSize: 14.0,
                                color: appPrimaryColor,
                              ), //.copyWith(color: appPrimaryColor),
                            ),
                            height05,
                            Text(
                              contact.phones.first.number,
                              style: AppTextStyle.normalRegularBold12.copyWith(
                                color: appPrimaryColor,
                              ), //.copyWith(color: appPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
