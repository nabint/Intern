import 'package:flutter/material.dart';
import 'package:sqflite/utils/utils.dart';

class UserDetailWidget extends StatelessWidget {
  final user;
  UserDetailWidget(this.user);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: Color(0xffFAF1E5),
          elevation: 2,
          child: Column(
            children: [
              listItem(
                "#4D83BF",
                "ID",
                user.id.toString(),
                icon: Icon(
                  Icons.create,
                  color: Colors.white,
                ),
              ),
              listItem("#D46960", "Name", user.name,
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              listItem("#E6BF73", "UserName", user.username,
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  )),
              listItem("#68B5B0", "Email", user.email,
                  icon: Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                  )),
              listItem("#808DDE", "Phone", user.phone,
                  icon: Icon(
                    Icons.phone_iphone,
                    color: Colors.white,
                  )),
              listItem("#e76eb1", "Address", user.address.street,
                  icon: Icon(
                    Icons.place,
                    color: Colors.white,
                  )),
              listItem("#b08069", "Website", user.website,
                  icon: Icon(
                    Icons.web,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(String bgColor, String title, String subtitle,
      {Widget icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: hexToColor(bgColor),
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: ListTile(
            title: Row(
              children: <Widget>[
                icon ?? Icon(Icons.access_alarm),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
