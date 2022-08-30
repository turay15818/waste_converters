// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:waste_converters/Login.dart';
import 'package:waste_converters/forgot_password.dart';
import 'package:waste_converters/pages/dashboard.dart';
import 'package:waste_converters/pages/Homepage.dart';
import 'package:waste_converters/pages/message.dart';
import 'package:waste_converters/pages/setting.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  ThemeData _lightDark = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );
}

bool _light = true;

class _HomePageState extends State<HomePage> {
// @override
  int _selectedIndex = 0;
//  Final user => FirebaseAuth.instance.currentUser!;
  // ignore: non_constant_identifier_names
  static final List<Widget> _HomePage = <Widget>[
    Home(),
    Dashboard(),
    Message(),
    Setting(),
  ];

  Widget build(BuildContext context) {
    // // var Provider;
    // var Provider;
    // ThemeProvider themeProvider =Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4756DF),
        scrolledUnderElevation: 20,
      ),

      //Drawer Navigator
      drawer: Container(
        child: Drawer(
          elevation: 10,
          // backgroundColor: Colors.lightBlue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Musa Turay'),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/bg3.png',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //drawer items
              ListTile(
                leading: Icon(
                  Icons.dashboard_customize,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Dashboard',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Dashboard();
                  }));
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Notification',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Message();
                  }));
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.policy,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Policy',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordPage();
                  }));
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Setting',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Setting();
                  }));
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Share',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Colors.deepPurpleAccent,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordPage();
                  }));
                },
              ),

              Column(
                children: [
                  ListTile(
                    leading: Container(
                        child: Icon(
                      Icons.social_distance,
                      color: Colors.deepPurpleAccent,
                      size: 40,
                    )),
                    title: Text('Follow Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.w900,
                        )),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPasswordPage();
                      }));
                    },
                  ),
                ],
              ),

              ListTile(
                leading: Icon(
                  Icons.toggle_on_outlined,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordPage();
                  }));
                },
              ),

              Divider(color: Colors.amberAccent),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app_sharp,
                  color: Colors.deepPurpleAccent,
                  size: 40,
                ),
                title: Text('Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.lime,
                      fontWeight: FontWeight.w900,
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage(
                      showRegisterPage: () {},
                    );
                  }));
                },
              ),
              // Switch(
              //   value: themeProvider.getTheme == darkTheme,
              //   activeColor: themeProvider.getTheme == darkTheme
              //       ? Colors.white
              //       : Colors.black,
              //   onChanged: (d) {
              //     themeProvider.changeTheme();
              //   })
            ],
          ),
        ),
      ),

      body: Center(
        child: _HomePage.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        color: Colors.deepPurpleAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
          child: GNav(
            backgroundColor: Colors.deepPurpleAccent,
            tabBackgroundColor: Colors.indigo,
            color: Colors.black,
            activeColor: Colors.amberAccent,
            padding: EdgeInsets.all(10),
            gap: 10,
            iconSize: 30,
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 35,
                backgroundColor: Colors.white,
                iconActiveColor: Colors.greenAccent,
                iconColor: Colors.amberAccent,
                text: ('Home'),
              ),
              GButton(
                icon: Icons.dashboard,
                iconSize: 35,
                backgroundColor: Colors.white,
                iconColor: Colors.blueGrey,
                iconActiveColor: Colors.greenAccent,
                text: ('Dashboard'),
              ),
              GButton(
                icon: Icons.message_sharp,
                iconSize: 35,
                backgroundColor: Colors.white,
                iconActiveColor: Colors.greenAccent,
                iconColor: Colors.red,
                text: ('Messages'),
              ),
              GButton(
                icon: Icons.settings,
                iconSize: 35,
                backgroundColor: Color(0xFF4756DF),
                iconActiveColor: Color(0xFFA716DA),
                iconColor: Colors.black,
                text: ('Setting'),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
