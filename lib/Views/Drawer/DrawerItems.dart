import 'package:appointzz_1/Services/ColorPicker.dart';
import 'package:appointzz_1/Views/Drawer/drawer_itembox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';


class MyDrawer extends StatefulWidget {
  MyDrawer({Key key,}) : super(key: key);


  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  String text =
      'http://play.google.com/store/apps/details?id=com.healthSolutions';
  String subject = '';
  List<String> imagePaths = [];

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        backgroundColor: cleanDarkBlueGrey,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Drawer(
            backgroundColor: cleanDarkBlueGrey,
            child: ListView(
              children: <Widget>[


                Container(
                  color: cleanDarkBlueGrey,
                  padding: EdgeInsets.only(left: 10),
                  height: MediaQuery.of(context).size.height * 0.14,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.account_circle,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\n  Stuart',
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                DrawerItemBox(
                  blockIcon: Icons.home_outlined,
                  blockName: "Home",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.call,
                  blockName: "Call Us",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.history_rounded,
                  blockName: "History",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.people_alt_outlined,
                  blockName: "Our Partners",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.share,
                  blockName: "Share",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.notifications_active_outlined,
                  blockName: "Notifications",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.medical_services_outlined,
                  blockName: "Doctor Advice",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.description_outlined,
                  blockName: "Terms and Conditions",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.login_outlined,
                  blockName: "Logout",
                  blockTapAction: (){},
                ),

                DrawerItemBox(
                  blockIcon: Icons.info_outlined,
                  blockName: "Version",
                  blockTapAction: (){},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
