import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/customer/home_page.dart';
import 'package:zomato_hackathon/screens/customer/widgets/profile.dart';
import 'package:zomato_hackathon/styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  listTile(String title, IconData icon, Function ontap) {
    return ListTile(
      onTap: () => ontap(),
      leading: Icon(
        icon,
        color: kTextDarkColor,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(color: kTextDarkColor, fontSize: 16),
      ),
    );
  }

  divider() {
    return Divider(
      endIndent: 10,
      indent: 10,
      thickness: 1,
      color: kTextDarkColor.withOpacity(0.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPaddding = MediaQuery.of(context).padding.top;
    return SizedBox(
      width: 280,
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 80 + topPaddding,
              padding: EdgeInsets.only(top: topPaddding, left: 8),
              width: double.infinity,
              color: kPrimaryColor,
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome!!\n${FirebaseAuth.instance.currentUser!.displayName}",
                style: appDescriptionStyle,
              ),
            ),
            // divider(),
            listTile('Profile', EvaIcons.person, () {}),
            divider(),
            listTile('My Orders', EvaIcons.shoppingBag, () {}),
            divider(),
            listTile('About Us', EvaIcons.info, () {}),
            divider(),
            listTile('Share app', EvaIcons.shareOutline, () {}),
            divider(),
            const Spacer(),
            const ListTile(
              leading: Icon(
                EvaIcons.logOut,
                size: 28,
                color: backgroundColor,
              ),
              tileColor: kPrimaryColor,
              title: Text(
                "Logout",
                style: TextStyle(color: backgroundColor, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
