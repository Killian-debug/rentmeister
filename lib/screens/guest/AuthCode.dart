import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';

class AuthCodeScreen extends StatefulWidget {
  final Function(int, String) onChangeStep;
  //final String phone;
  AuthCodeScreen({
    Key? key,
    required this.onChangeStep(index, phone),
    //required this.phone,
  }) : super(key: key);

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verifier ',
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
              onSubmitted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Home()),
                      //     (route) => false);
                      widget.onChangeStep(2, '');
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // _verifyPhone() async {
  //   //print(widget.phone);
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: widget.phone,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             widget.onChangeStep(2, '');
  //             // Navigator.pushAndRemoveUntil(
  //             //     context,
  //             //     MaterialPageRoute(builder: (context) => Home()),
  //             //     (route) => false);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       codeSent: (String verficationID, int? resendToken) {
  //         setState(() {
  //           _verificationCode = verficationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 120));
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //  // _verifyPhone();
  // }
}
