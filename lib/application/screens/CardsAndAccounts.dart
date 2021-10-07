import 'package:flutter/material.dart';

class CardsAndAccountsScreen extends StatefulWidget {
  const CardsAndAccountsScreen({Key? key}) : super(key: key);

  @override
  _CardsAndAccountsScreenState createState() => _CardsAndAccountsScreenState();
}

class _CardsAndAccountsScreenState extends State<CardsAndAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cards and Accounts"),
    );
  }
}
