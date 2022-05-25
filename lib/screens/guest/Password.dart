import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  final Function(int?, String?) onChangeStep;

  Password({
    Key? key,
    required this.onChangeStep,
  }) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isSecret = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _passWord = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () => widget.onChangeStep(0, null),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                Text(
                  'password'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
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
                        Text('Enter a password'),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          onChanged: (value) => setState(() {
                            _passWord = value;
                          }),
                          validator: (value) => '$value'.length < 6
                              ? 'Enter a valide password'
                              : null,
                          obscureText: _isSecret,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () => setState(() {
                                  _isSecret = !_isSecret;
                                }),
                                child: Icon(_isSecret
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: 'Ex: @glabv_dh!po',
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
                        ElevatedButton(
                          // color: Theme.of(context).primaryColor,
                          // elevation: 0,
                          // padding: EdgeInsets.symmetric(vertical: 15.0),
                          onPressed: '$_passWord'.length < 6
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.onChangeStep(null, _passWord);
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
          ),
        ),
      ),
    );
  }
}
