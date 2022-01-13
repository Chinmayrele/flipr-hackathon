import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

var _initValue = {
  'name': '',
  'number': '',
  'about': '',
  'image': '',
};

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  int flag = 0;

  void saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    flag = 1;
    _form.currentState!.save();
    _initValue = {
      'name': name,
      'number': number,
      'about': about,
      // 'image': profile.image.path,
    };
  }

  final _form = GlobalKey<FormState>();
  String name = '';
  String number = '';
  String about = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  decoration: const BoxDecoration(color: Colors.green),
                  child: SvgPicture.asset(
                    'assets/fonts/welcome.svg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(
                      'Fill Out Your Profile!!!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                        key: _form,
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: _initValue['name'],
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              maxLength: 20,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Name';
                                } else if (value.length < 3) {
                                  return 'Please Enter a Proper Name';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                name = val.toString();
                              },
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              initialValue: _initValue['number'],
                              maxLength: 10,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              decoration: InputDecoration(
                                prefix: const Text(
                                  '+91 ',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                labelText: 'Phone No.',
                                fillColor: Colors.green,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Number';
                                } else if (value.length != 10) {
                                  return 'Please Enter a Valid Mobile Number';
                                }
                                return null;
                              },
                              onSaved: (val) {
                                number = val.toString();
                              },
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              initialValue: _initValue['about'],
                              maxLength: 40,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              decoration: InputDecoration(
                                labelText: 'About You (optional)',
                                fillColor: Colors.green,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                              onSaved: (val) {
                                about = val.toString();
                              },
                            ),
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      saveForm();
                      if (flag == 1) {
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          msg: 'Profile Successfully Set!!!',
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16,
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 20),
                      alignment: Alignment.centerRight,
                      width: 140,
                      height: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.7),
                            Colors.green.withOpacity(0.8),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 8),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.thumb_up_alt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
