// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:waste_converters/page/profile_page.dart';

// import '../main.dart';
// import '../utils/user_preferences.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   await UserPreferences.init();

//   runApp(MyApp());
// }

// class Setting extends StatelessWidget {
//   static final String title = 'User Profile';

//   @override
//   Widget build(BuildContext context) {
//     final user = UserPreferences.getUser();

//   }
// }

// import 'package:flutter/cupertino.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_converters/page/profile_page.dart';
import 'package:waste_converters/themes.dart';
import 'package:waste_converters/utils/user_preferences.dart';
// import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  // runApp(MyApp());
}
// void main() {
//   runApp(Setting());
// }

class Setting extends StatelessWidget {
  static final String title = 'User Profile';
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = UserPreferences.getUser();
    final ThemeSwitcherState switcher = ThemeSwitcher.of(context)!;
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     backgroundColor: Colors.white.withOpacity(.94),
    //     appBar: AppBar(
    //       title: Text(
    //         "Settings",
    //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //       ),
    //       centerTitle: true,
    //       backgroundColor: Colors.transparent,
    //       elevation: 0,
    //     ),
    //     body: Padding(
    //       padding: const EdgeInsets.all(10),
    //       child: ListView(
    //         children: [
    //           // user card
    //           SimpleUserCard(
    //             userName: "Musa Turay",
    //             userProfilePic: NetworkImage("https://turay15818.github.io/myapi/Musa-Turay.jpg"),
    //           ),
    //           SettingsGroup(
    //             items: [
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: CupertinoIcons.pencil_outline,
    //                 iconStyle: IconStyle(),
    //                 title: 'Appearance',
    //                 subtitle: "Waste Converters",
    //               ),
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: Icons.fingerprint,
    //                 iconStyle: IconStyle(
    //                   iconsColor: Colors.white,
    //                   withBackground: true,
    //                   backgroundColor: Color.fromARGB(255, 86, 244, 54),
    //                 ),
    //                 title: 'Privacy',
    //                 subtitle: "Waste Converters'App to improve your privacy",
    //               ),
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: Icons.dark_mode_rounded,
    //                 iconStyle: IconStyle(
    //                   iconsColor: Colors.white,
    //                   withBackground: true,
    //                   backgroundColor: Colors.red,
    //                 ),
    //                 title: 'Dark mode',
    //                 subtitle: "Automatic",
    //                 trailing: Switch.adaptive(
    //                   value: false,
    //                   onChanged: (value) {},
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SettingsGroup(
    //             items: [
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: Icons.info_rounded,
    //                 iconStyle: IconStyle(
    //                   backgroundColor: Colors.purple,
    //                 ),
    //                 title: 'About',
    //                 subtitle: "Learn more about Waste Converters 'App",
    //               ),
    //             ],
    //           ),
    //           // You can add a settings title
    //           SettingsGroup(
    //             settingsGroupTitle: "Account",
    //             items: [
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: Icons.exit_to_app_rounded,
    //                 title: "Sign Out",
    //               ),
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: CupertinoIcons.repeat,
    //                 title: "Change email",
    //               ),
    //               SettingsItem(
    //                 onTap: () {},
    //                 icons: CupertinoIcons.delete_solid,
    //                 title: "Delete account",
    //                 titleStyle: TextStyle(
    //                   color: Colors.red,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeProvider.of(context),
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
