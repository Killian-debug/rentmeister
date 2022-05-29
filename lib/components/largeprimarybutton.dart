import 'package:flutter/material.dart';

class largeprimarybutton extends StatefulWidget {
  final Function(int) onChangeStep;

  largeprimarybutton({
    Key? key,
    required int pageIndex,
    required this.onChangeStep,
    required String description,
  }) : super(key: key);

  @override
  State<largeprimarybutton> createState() => _largeprimarybuttonState();
}

class _largeprimarybuttonState extends State<largeprimarybutton> {
  final bool _flag = true;

  get description => null;

  get pageIndex => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      height: 60 + MediaQuery.of(context).padding.bottom,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: _flag ? Colors.pink : Colors.teal,
        ),
        onPressed: () {
          widget.onChangeStep(pageIndex);
        },
        child: Text("$description".toUpperCase()),
      ),
    );
  }
}
