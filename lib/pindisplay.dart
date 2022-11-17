import 'package:flutter/material.dart';

class PinDisplay extends StatelessWidget {
  final String input;

  /// required PIN length.
  final int pinLength;

  /// PIN display decoration
  final Decoration? decoration;

  /// PIN display padding
  final EdgeInsetsGeometry? padding;

  ///PIN display margin
  final EdgeInsetsGeometry? margin;

  /// to mask PIN or not. default is true.
  final bool maskInput;
  const PinDisplay(
    this.pinLength,
    this.input,
    this.maskInput, [
    this.decoration,
    this.padding,
    this.margin,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      margin: margin,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: maskInput
              ? Iterable.generate(
                  pinLength,
                  (n) => Icon(
                        n >= input.length ? Icons.lock : Icons.lock_open,
                        size: 20.0,
                      )).toList()
              : [
                  Text(input,
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ]),
    );
  }
}
