import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  /// decoration for the KeyPad.
  final Decoration? decoration;

  /// decoration for the buttons on the KeyPad.
  final ButtonStyle? buttonStyle;

  /// to scramble the position of input keys.
  final bool scrambleKeys;

  final ValueChanged<String> addInput;

  final ValueChanged removeInput;

  final ValueChanged clear;

  final List<int> numbers;

  /// styles for the buttons on the KeyPad
  final TextStyle? buttonTextStyle;

  const KeyPad(this.numbers, this.addInput, this.removeInput, this.clear,
      [this.scrambleKeys = true,
      this.decoration,
      this.buttonStyle,
      this.buttonTextStyle,
      Key? key])
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Column(
        children: <Widget>[
          _buildRow(numbers.sublist(0, 3)),
          _buildRow(numbers.sublist(3, 6)),
          _buildRow(numbers.sublist(6, 9)),
          _buildLastRow()
        ],
      ),
    );
  }

  Widget _buildRow(List<int> inputs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: inputs
          .map((value) => ElevatedButton(
                style: buttonStyle,
                child: Text(value.toString(), style: buttonTextStyle),
                onPressed: () => addInput(value.toString()),
              ))
          .toList(),
    );
  }

  Widget _buildLastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => clear(null),
        ),
        IconButton(
          icon: Text(numbers.last.toString(), style: buttonTextStyle),
          onPressed: () => addInput(numbers.last.toString()),
        ),
        IconButton(
          icon: const Icon(Icons.backspace),
          onPressed: () => removeInput(null),
        ),
      ],
    );
  }
}
