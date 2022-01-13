import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/authhandler.dart';
import 'package:zomato_hackathon/auth/signin.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/common/selectpage.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;
  // AuthProvider auth;

  @override
  void initState() {
    // auth = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  signUp({bool google = false}) {
    setState(() {
      loading = true;
    });
    ((google)
            ? AuthHandler.signInWithGoogle()
            : AuthHandler.signUp(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: kPrimaryColor),
                          ),
                        ),
                        _buildTextField(_emailController, "Email"),
                        _buildTextField(_passwordController, "Password",
                            passwordField: true),
                        CustomButton(
                            title: (loading)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Register",
                                    style: buttonTextStyle,
                                  ),
                            onTap: signUp,
                            buttonType: ButtonType.text),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already registered?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                    return const SignInScreen();
                                  }));
                                },
                                child: const Text("Login",
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
                                const Text("Sign Up with Google")
                              ],
                            ),
                            onTap: () => signUp(google: true),
                            buttonType: ButtonType.outlined)
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    ));
  }

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
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

//  