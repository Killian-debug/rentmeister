import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int, String) onChangeStep;

  AuthScreen({
    Key? key,
    required this.onChangeStep,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  final RegExp emailRegex = RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}.[a-z]{2,4}");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Everyone has\n'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'knowledge'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' to share'.toUpperCase()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'It all starts here.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Enter your email'),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value!.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Please enter a valide email'
                                : null,
                        decoration: InputDecoration(
                            hintText: 'Ex: john.doe@domaine.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        onPressed: !emailRegex.hasMatch(_email)
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  print(_email);
                                  widget.onChangeStep(1, _email);
                                }
                              },
                        child: Text(
                          'Continue'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
