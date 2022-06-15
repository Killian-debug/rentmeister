import 'package:flutter/material.dart';

class Term extends StatefulWidget {
  final Function(int) onChangeStep;
  final String terms;
  Term({
    Key? key,
    required this.onChangeStep,
    this.terms = '',
  }) : super(key: key);

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  bool _termsReaded = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _termsReaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => widget.onChangeStep(0),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.terms),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  onPressed: _termsReaded ? () => widget.onChangeStep(3) : null,
                  child: Text(
                    'Accept & continue'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
