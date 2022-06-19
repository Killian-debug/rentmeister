import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flututo/models/UserModel.dart';
import 'package:pinput/pinput.dart';

class AuthCodeScreen extends StatefulWidget {
  final Function(int, UserModel) onChangeStep;
  static String phone = "";
  AuthCodeScreen({
    Key? key,
    required this.onChangeStep(index, phone),
  }) : super(key: key);

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final PinTheme pinPutDecoration = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 25.0,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 226, 227, 236),
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: const Color.fromRGBO(126, 203, 224, 1),
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Verification OTP'),
      ),
      body: Form(
        key: _formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                "Verifier " + AuthCodeScreen.phone,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(180, 0, 126, 161),
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 126, 161),
                  ),
                ),
              ),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedPinTheme: pinPutDecoration,
              focusedPinTheme: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              // onCompleted: (pin) {
              //   print(_pinPutController.text);
              // },
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(
                    PhoneAuthProvider.credential(
                      verificationId: _verificationCode,
                      smsCode: pin,
                    ),
                  )
                      .then((value) async {
                    if (value.user != null) {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Home()),
                      //     (route) => false);
                      print(value);
                      widget.onChangeStep(
                          2,
                          UserModel(
                            telUser: AuthCodeScreen.phone,
                          ));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          ),
          // ElevatedButton(
          //   // color: Theme.of(context).primaryColor,
          //   // elevation: 0,
          //   // padding: EdgeInsets.symmetric(vertical: 15.0),
          //   style: ElevatedButton.styleFrom(
          //     fixedSize: Size(100, 52.0),
          //     primary: Theme.of(context).primaryColor,
          //   ),
          //   onPressed: () {
          //     if (_formKey.currentState!.validate()) {
          //       widget.onChangeStep(3, '');
          //     }
          //   },
          //   child: Text(
          //     'Continue'.toUpperCase(),
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

  _verifyPhone() async {
    //print(widget.phone);
    String number = AuthCodeScreen.phone;
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              widget.onChangeStep(
                  2,
                  UserModel(
                    telUser: AuthCodeScreen.phone,
                  ));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
