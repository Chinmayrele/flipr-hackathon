import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/authhandler.dart';
import 'package:zomato_hackathon/auth/signup.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/common/selectpage.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  signIn({bool google = false}) {
    setState(() {
      loading = true;
    });
    ((google)
            ? AuthHandler.signInWithGoogle()
            : AuthHandler.signIn(
                _emailController.text, _passwordController.text))
        .then((value) {
      if (value != null) {
        replaceNavigateTo(context: context, page: const SelectViewScreen());
      }
    }).catchError((err) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(60)),
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                          ),
                          _buildTextField(_emailController, "Email Id"),
                          _buildTextField(_passwordController, "Password"),
                          CustomButton(
                              title: (loading)
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Login",
                                      style: buttonTextStyle,
                                    ),
                              onTap: signIn,
                              buttonType: ButtonType.text),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("New User?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return const SignUpScreen();
                                    }));
                                  },
                                  child: const Text("Register",
                                      style: TextStyle(color: kPrimaryColor)))
                            ],
                          ),
                          CustomButton(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/google.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text("Sign In with Google")
                                ],
                              ),
                              onTap: () => signIn(google: true),
                              buttonType: ButtonType.outlined)
                        ]),
                  ),
                ),
              ),
            ))
      ],
    ));
  }

  //

  Widget _buildTextField(TextEditingController controller, String label,
      {bool passwordField = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: passwordField,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
