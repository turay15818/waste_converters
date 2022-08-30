import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_converters/google_login.dart';
import 'package:waste_converters/Login.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 
//Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _haddressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _haddressController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //creating users
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //Adding user details to database
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        _haddressController.text.trim(),
      );
    }
  }

  Future addUserDetails(String firstName, lastName, email, hAddress) async {
    await FirebaseFirestore.instance.collection('users').add({
      "first name": firstName,
      "last name": lastName,
      "email": email,
      "home address": hAddress,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            image: DecorationImage(
              image: AssetImage('assets/images/bg2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 50, color: Colors.blue),
                      SizedBox(height: 10),
                      //Welcome Notes
                      Text('Hello There! 👋👋👋👋👋👋',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      SizedBox(height: 10),

                      Text('Register Now to be Part of Us',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      SizedBox(height: 10),

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
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'First Name',
                                  ))),
                        ),
                      ),

                      SizedBox(height: 10),
                      //Last Name
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
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Last Name',
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      //House Address
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
                                controller: _haddressController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Home Address',
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      //Email Address
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
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email Address',
                                )),
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
                                  hintText: 'Create Password',
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      //Confirm password input

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
                                controller: _confirmpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm Password',
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      SizedBox(height: 20),

                      //signing button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) {
                          //       return GoogleSignUp();
                          //     }));
                          //   },
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 20.0),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Image.asset(
                          //           'assets/images/google1.png',
                          //         ),
                          //         Text('Sign In',
                          //             style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 20,
                          //               color: Colors.blue,
                          //             )),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                onTap: signUp,
                                child: Container(
                                    padding: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                              )),

                          // Icon(Icons.google, size: 50, color: Colors.blue),
                        ],
                      ),

                      SizedBox(height: 10),

                      //not a member? create a new account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already a Member?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: Text(' Login Now',
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
    );
  }
}
