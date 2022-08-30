// import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waste_converters/Home.dart';
import 'package:waste_converters/forgot_password.dart';
// import 'package:waste_converters/Home.dart';
// import 'LoginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // if (UserCredential.user != null)Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => HomePage(),));
  runApp(LoginPage(
    showRegisterPage: () {},
  ));
}

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Final user => FirebaseAuth.instance.currentUser!;
//Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late GoogleSignInAccount userObj;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        image: DecorationImage(
          image: AssetImage('assets/images/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.amberAccent],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock, size: 100, color: Colors.blue),
                        SizedBox(height: 10),
                        //Welcome Notes
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            // color:Colors.grey[300],
                            // borderRadius: BorderRadius.circular(15,),
                            // boxShadow:[
                            // BoxShadow(color:Colors.grey.shade500, offset:Offset(2.0,2.0),blurRadius:10.0,spreadRadius:1.0),
                            // BoxShadow(color:Colors.grey.shade500, offset:Offset(-2.0,-2.0),blurRadius:10.0,spreadRadius:1.0),
                            // ],
                            // ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text('Hello Again!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      )),
                                ),
                                SizedBox(height: 10),
                                Text('Welcome Back, you\'ve been missed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        //Email Address

                        Container(
                          // decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(15,),
                          // boxShadow:[
                          // BoxShadow(color:Colors.grey.shade500, offset:Offset(4.0,4.0),blurRadius:15.0,spreadRadius:1.0),
                          // BoxShadow(color:Colors.grey.shade500, offset:Offset(-4.0,-4.0),blurRadius:15.0,spreadRadius:1.0),
                          // ],
                          // ),

                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // fillColor: Colors.white,
                                      // filled:true,
                                      hintText: 'Email Address',
                                    )),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        //password input

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Password',
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPasswordPage();
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Forgot Password 🔐🔐🔐🔐',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        //signing button
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: signIn,
                              child: Container(
                                  padding: EdgeInsets.all(25),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                            )),

                        SizedBox(height: 25),

                        Container(
                          child: TextButton(
                              onPressed: () => signInWithGoogle(),
                              
                              child: Text('Google Sign In'),
                              // UserCredential userCredential =await FirebaseAuth.instance.signInWith
                              
                              
                              
                              
                              // onPressed: () async {
                              //   await GoogleSignIn().signIn().then((value) {
                              //     setState(() {
                              //       userObj = value!;
                              //     });
                              //   });

                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => HomePage()));
                              // }
                              ),
                        ),

                        // onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),}
                        //not a member? create a new account
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not a Member?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: Text(' Register Now',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<Object> signInWithGoogle() async {
  final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth =
      await googleuser!.authentication;

  final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  Fluttertoast.showToast(msg: "Account created");
  
  return await FirebaseAuth.instance.signInWithCredential(credential);
  
  
}

