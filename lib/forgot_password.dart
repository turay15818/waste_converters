import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
          showDialog(
          context: context,
          builder: (context) {
            return Container(
            decoration: BoxDecoration(
            color: Colors.blue,
            ),
              child: AlertDialog(
              elevation: 10,
                content: Text('Password Reset link has been sent to your email address! Please check and verify'),
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
            backgroundColor: Colors.green,
              content:Text('Sorry😞 but account information not found in our database',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.black,
              fontSize: 20,fontWeight: FontWeight.bold,
              )),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 0,
          shadowColor: Colors.deepPurpleAccent,
        ),
        body: Container(
        decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Text(
                      'Enter your Email Address and We will Send you a Password Resting Link',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                      )),
                ),
              ),
              SizedBox(height: 50),
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

              MaterialButton(
                  onPressed: passwordReset,
                  child: Text('Reset Password'),
                  color: Colors.deepOrange)
            ],
          ),
        ));
  }
}
