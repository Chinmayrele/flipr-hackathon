import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/signup.dart';
import 'package:zomato_hackathon/common/buttons.dart';
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
  // AuthProvider auth;

  @override
  void initState() {
    // auth = Provider.of<AuthProvider>(context, listen: false);
    // getColleges();
    super.initState();
  }

  signIn() {
    // setState(() {
    //   loading = true;
    // });
    // auth.signIn(_emailController.text, _passwordController.text).then((result) {
    //   setState(() {
    //     loading = false;
    //   });
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return (result.emailVerified) ? LoadingScreen() : VerifyEmailScreen();
    //   }));
    //   showCustomSnackBar(context, "Sign In Successfull!");
    // }).catchError((err) {
    //   setState(() {
    //     loading = false;
    //   });
    //   showCustomSnackBar(context, err.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "👋 Welcome Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: kPrimaryColor),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
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
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
