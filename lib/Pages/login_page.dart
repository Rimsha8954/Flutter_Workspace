import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veggie_vault/Pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/b.jpg'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "Signin to Continue",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(height: 8,),
                  const Text(
                    "Leafy & Fruity",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.limeAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Colors.green,
                            offset: Offset(3, 3),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {
                      _googleSignUp().then((value) => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                              builder: (context) => const HomePage(products: [],))));
                    },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    text: "Sign up with Facebook",
                    onPressed: () {},
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  const Text(
                    "By Signing in you are agreeing to our",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Center(
                      child: Text(" Terms and Privacy Policy",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
