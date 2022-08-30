// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';

// import 'package:project/unbording_screen.dart';

// class splashScreen extends StatefulWidget {
//   splashScreen({Key? key}) : super(key: key);

//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }

// class _splashScreenState extends State<splashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 5),
//         () => Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => unbordingScreen())));
//   }

//   @override
//   Widget build(BuildContext context) {
//     var topRight = Alignment.topRight;
//     return Scaffold(
//       body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: topRight,
//                   end: Alignment.bottomRight,
//                   colors: [
//                 const Color(0x3EC70B),
//                 const Color(0xFFCE1010),
//               ])),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [
//                   Image.asset(
//                     'assets/images/splash.png',
//                     height: 200.0,
//                     width: 200.0,
//                   ),
//                   const Center(
//                     child: Center(
//                         child: Text(
//                       "Welcome to Waste Transformer\nWe transform your waste to Biogas",
//                       // ignore: prefer_const_constructors
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18.0,
                
//                       ),
//                     )),
//                   ),
//                   const Center(
//                     child: Center(
//                         child: Text(
//                       "We Transform your Waste to Gas",
//                       // ignore: prefer_const_constructors

//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18.0,
//                       ),
//                     )),
//                   ),
//                 ],
//               ),

//               // ignore: prefer_const_constructors

//               CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
//               ),
//             ],
//           )
//           ),
          
//     );
//   }
// }

