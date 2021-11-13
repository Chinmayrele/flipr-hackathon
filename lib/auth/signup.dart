import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/signin.dart';
import 'package:zomato_hackathon/common/buttons.dart';
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

  signUp() {
    setState(() {
      loading = true;
    });
    // auth
    //     .signUp(_nameController.text, selectedCollege, _emailController.text,
    //         _passwordController.text)
    //     .then((user) async {
    //   setState(() {
    //     loading = false;
    //   });
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return (user.emailVerified) ? LoadingScreen() : VerifyEmailScreen();
    //   }));
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
                    "👋 Hello!!!",
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
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
