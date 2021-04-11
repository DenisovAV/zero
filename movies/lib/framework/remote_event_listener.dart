import 'package:flutter/material.dart';

@immutable
class RemoteEventListener {
  final Function moveUp;
  final Function moveDown;
  final Function moveLeft;
  final Function moveRight;

  const RemoteEventListener({
    required this.moveUp,
    required this.moveDown,
    required this.moveLeft,
    required this.moveRight,
  });
}
