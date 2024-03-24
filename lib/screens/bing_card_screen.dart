import 'package:bingo_flutter/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class BingoCardScreen extends StatefulWidget {
  final int rows;
  final int columns;
  final List<int> numbers; // Lista de números para preencher a tabela de bingo

  const BingoCardScreen({
    super.key,
    this.rows = 4,
    this.columns = 4,
    required this.numbers, // Recebe a lista de números como parâmetro
  });

  @override
  State<BingoCardScreen> createState() => _BingoCardScreenState();
}

class _BingoCardScreenState extends State<BingoCardScreen> {
  late List<int> _filledNumbers;
  late List<bool> _cellPressed;

  @override
  void initState() {
    super.initState();
    _initializeLists();
  }

  void _initializeLists() {
    _filledNumbers = [];
    _cellPressed = List<bool>.filled(widget.rows * widget.columns, false);
    _fillNumbers();
  }

  void _fillNumbers() {
    if (widget.numbers.length < widget.rows * widget.columns) {
      _filledNumbers = List<int>.generate(
        widget.rows * widget.columns,
        (index) => index + 1,
      );
      _filledNumbers.shuffle();
    } else {
      _filledNumbers = widget.numbers;
    }
  }

  void _toggleCellPressed(int index) {
    setState(() {
      _cellPressed[index] = !_cellPressed[index];
    });
  }

  bool _isAllCellsPressed() {
    return _cellPressed.every((element) => element);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final firstContainerHeight = screenHeight * 0.4;
    final firstContainerWidth = screenWidth * 0.8;
    // final secondContainerWidth = screenWidth * 0.538;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: firstContainerHeight,
              width: firstContainerWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < widget.rows; i++)
                      Expanded(
                        child: Row(
                          children: [
                            for (int j = 0; j < widget.columns; j++)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _toggleCellPressed(i * widget.columns + j);
                                    if (_isAllCellsPressed()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'BINGO! Parabéns você foi o ganhador.'),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: j < widget.columns - 1
                                            ? const BorderSide(
                                                color: ThemeColors.secondary,
                                                width: 1)
                                            : BorderSide.none,
                                        bottom: i < widget.rows - 1
                                            ? const BorderSide(
                                                color: ThemeColors.secondary,
                                                width: 1)
                                            : BorderSide.none,
                                      ),
                                    ),
                                    child: _cellPressed.isNotEmpty &&
                                            _cellPressed[i * widget.columns + j]
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Container(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  decoration: const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: ThemeColors
                                                                .primaryVariant,
                                                            offset:
                                                                Offset(0, 2.5)),
                                                      ],
                                                      shape: BoxShape.circle,
                                                      color: ThemeColors
                                                          .primary // You can set the color of the circle here
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                _filledNumbers[
                                                        i * widget.columns + j]
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'Akshar',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            _filledNumbers[
                                                    i * widget.columns + j]
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Akshar',
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: ThemeColors.secondary,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 53),
            // Container(
            //   width: secondContainerWidth,
            //   child: Column(
            //     children: [
            //       Text(
            //         'NÚMEROS PASSADOS',
            //         style: TextStyle(
            //           fontFamily: 'Akshar',
            //           fontSize: 20,
            //           fontWeight: FontWeight.normal,
            //           color: ThemeColors.secondary,
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(4.0),
            //         child: Container(
            //           height: 1,
            //           color: ThemeColors.secondary,
            //         ),
            //       ),
            //       Text(
            //         '77 12 32 54',
            //         style: TextStyle(
            //           fontFamily: 'Akshar',
            //           fontSize: 26,
            //           fontWeight: FontWeight.normal,
            //           color: ThemeColors.secondary,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
