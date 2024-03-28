import 'package:flutter/material.dart';

class BingoFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Bingo Form'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: BingoForm(),
        ),
      ),
    );
  }
}

class BingoForm extends StatefulWidget {
  @override
  _BingoFormState createState() => _BingoFormState();
}

class _BingoFormState extends State<BingoForm> {
  int _numRows = 4;
  int _numColumns = 4;
  int _gameSize = 75;
  bool _randomNumbersEnabled = false;

  void _generateCard() {
    // Implementar a lógica para gerar a cartela com base nos valores preenchidos
    print('Gerando cartela com $_numRows linhas, $_numColumns colunas e tamanho de $_gameSize');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
            hintText: 'Linhas (Padrão: 4)',
            contentPadding: EdgeInsets.only(bottom: 5.0),
          ),
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: '$_numRows'),
          onChanged: (value) {
            setState(() {
              _numRows = int.tryParse(value) ?? 4;
              if (_numRows < 2) {
                _numRows = 2;
              } else if (_numRows > 7) {
                _numRows = 7;
              }
            });
          },
        ),
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
            hintText: 'Colunas (Padrão: 4)',
            contentPadding: EdgeInsets.only(bottom: 5.0),
          ),
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: '$_numColumns'),
          onChanged: (value) {
            setState(() {
              _numColumns = int.tryParse(value) ?? 4;
              if (_numColumns < 2) {
                _numColumns = 2;
              } else if (_numColumns > 7) {
                _numColumns = 7;
              }
            });
          },
        ),
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
            hintText: 'Tamanho do Jogo (Padrão: 75)',
            contentPadding: EdgeInsets.only(bottom: 5.0),
          ),
          keyboardType: TextInputType.number,
          controller: TextEditingController(text: '$_gameSize'),
          onChanged: (value) {
            setState(() {
              _gameSize = int.tryParse(value) ?? 75;
              if (_gameSize < 75) {
                _gameSize = 75;
              } else if (_gameSize > 99) {
                _gameSize = 99;
              }
            });
          },
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Gerar Números Aleatórios', style: TextStyle(fontSize: 20.0)),
            Switch(
              value: _randomNumbersEnabled,
              onChanged: (value) {
                setState(() {
                  _randomNumbersEnabled = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            _generateCard();
            // Navegar para a próxima página
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: Text('Gerar Cartela', style: TextStyle(fontSize: 20.0)),
        ),
      ],
    );
  }
}
