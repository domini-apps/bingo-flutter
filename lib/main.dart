import 'package:bingo_flutter/screens/bing_card_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BingoAcme());
}

class BingoAcme extends StatelessWidget {
  const BingoAcme({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo Acme',
      theme: ThemeData.light(),
      home: Scaffold(body: BingoCardScreen(),),
    );
  }
}
