import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  final List<String> menuItems = [
    'Home',
    'Profile',
    'Settings',
    'Notifications',
    'Help',
    'About Us',
    'Contact Us',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 10,bottom: 0),
                  title: Text(menuItems[index]),
                  onTap: () {
                    // Handle menu item tap
                    Navigator.pop(context); // Close the drawer
                    // Implement navigation logic here based on the selected item
                  },
                );
              },
            ),
          ),
          const Divider(),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '© 2024 ${Constants.cms}',
              style: TextStyles.regularBlackTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
