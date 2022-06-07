import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  final TextEditingController _Numcontroller = TextEditingController();
  // String _email = '';
  String _number = '';
  //final RegExp emailRegex = RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}.[a-z]{2,4}");
  final RegExp numRegex = RegExp("^[+][0-9]+\$");

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
                  text: 'Chacun a \n'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'propriété'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' à partager'.toUpperCase()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tout commence ici.',
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
                      Text('Entrez votre numéro ${_number}'),
                      SizedBox(
                        height: 10.0,
                      ),
                      IntlPhoneField(
                        searchText: "Chercher le pays",
                        invalidNumberMessage: "Numero invalide",
                        decoration: InputDecoration(
                            labelText: 'Numéro',
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
                        initialCountryCode: 'BJ',
                        validator: (value) {
                          _number = value!.completeNumber.toString();
                          if (!numRegex.hasMatch(_number)) {
                            return 'Entrez le numéro';
                          }
                          return null;
                        },
                        onChanged: (phone) {
                          // (value) =>
                          setState(
                              () => _number = phone.completeNumber.toString());
                          print(_number);
                        },
                        controller: _Numcontroller,
                      ),

                      // TextFormField(
                      //   onChanged: (value) => setState(() => _email = value),
                      //   validator: (value) =>
                      //       value!.isEmpty || !emailRegex.hasMatch(value)
                      //           ? 'Please enter a valide email'
                      //           : null,
                      //   decoration: InputDecoration(
                      //       hintText: 'Ex: john.doe@domaine.com',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(0.0),
                      //         borderSide: BorderSide(
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(0.0),
                      //         borderSide: BorderSide(
                      //           color: Colors.grey,
                      //         ),
                      //       )),
                      // ),
                      SizedBox(
                        height: 30.0,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (numRegex.hasMatch(_number)) {
                              print('test22 $_number');

                              widget.onChangeStep(1, _number);
                            }
                          }
                        },
                        child: Text(
                          'Continuer'.toUpperCase(),
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
