import 'package:flutter/material.dart';

class DirectDebitScreen extends StatefulWidget {
  const DirectDebitScreen({Key? key}) : super(key: key);

  @override
  _DirectDebitScreenState createState() => _DirectDebitScreenState();
}

class _DirectDebitScreenState extends State<DirectDebitScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Direct Debits"),
    );
  }
}
