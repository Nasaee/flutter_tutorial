import 'package:flutter/material.dart';

const keyList = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
];

class KeyboardView extends StatelessWidget {
  final List<String> excludedLetters;
  final Function(String) onPressed;
  const KeyboardView(
      {super.key, required this.excludedLetters, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: keyList
              .map(
                (row) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: row
                      .map(
                        (letter) => VirtualKey(
                          letter: letter,
                          excluded: excludedLetters.contains(letter),
                          onPressed: onPressed,
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class VirtualKey extends StatelessWidget {
  final String letter;
  final bool excluded;
  final Function(String) onPressed;
  const VirtualKey({
    super.key,
    required this.letter,
    required this.excluded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: excluded ? Colors.red : Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () => onPressed(letter),
        child: Text(letter),
      ),
    );
  }
}
