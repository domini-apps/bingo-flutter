import 'package:bingo_flutter/screens/bing_card_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BingoAcme());
}

class BingoAcme extends StatelessWidget {
  const BingoAcme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo Acme',
      theme: ThemeData.light(),
      home: Scaffold(
        body: BingoCardScreen(
          rows: 4,
          columns: 4,
          numbers: [11, 2, 3, 34, 5, 6, 72, 8, 75, 10, 10, 12, 13, 20, 22, 16],
        ),
      ),
    );
  }
}
