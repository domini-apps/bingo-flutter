import 'package:flutter/material.dart';

class BingoCardScreen extends StatefulWidget {
  const BingoCardScreen({Key? key}) : super(key: key);

  @override
  _BingoCardScreenState createState() => _BingoCardScreenState();
}

class _BingoCardScreenState extends State<BingoCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
