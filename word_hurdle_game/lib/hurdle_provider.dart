import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:word_hurdle_game/wordle.dart';

class HurdleProvider extends ChangeNotifier {
  final random = Random.secure();
  List<String> totalWords = [];
  List<String> rowInputs = [];
  List<String> excludedLetters = [];
  List<Wordle> hardleBoard = [];
  String targetWord = '';
  int count = 0;
  int index = 0;
  final lettersPerRow = 5;
  bool wins = false;

  init() {
    totalWords = words.all.where((element) => element.length == 5).toList();
    generateBoard();
    generateRandomWord();
  }

  generateBoard() {
    hardleBoard = List.generate(30, (index) => Wordle(letter: ''));
  }

  generateRandomWord() {
    targetWord = totalWords[random.nextInt(totalWords.length)].toUpperCase();
    print(targetWord);
  }

  bool get isAValidWord =>
      totalWords.contains(rowInputs.join('').toLowerCase());

  bool get shouldCheckForAnswer => rowInputs.length == lettersPerRow;

  inputLetter(String letter) {
    if (count < lettersPerRow) {
      rowInputs.add(letter);
      hardleBoard[index] = Wordle(letter: letter);
      count++;
      index++;
      print(rowInputs);
    }
    notifyListeners();
  }

  deleteLetter() {
    if (rowInputs.isNotEmpty) {
      rowInputs.removeLast();
      // print(rowInputs);
      if (count > 0) {
        hardleBoard[index - 1] = Wordle(letter: '');
        count--;
        index--;
      }

      notifyListeners();
    }
  }

  void checkAnswer() {
    final input = rowInputs.join('').toLowerCase();
    if (targetWord == input) {
      wins = true;
    }
  }
}
