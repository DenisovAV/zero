import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'remote_event_listener.dart';

class RemoteController {
  static RemoteController? _instance;

  factory RemoteController() => _instance ?? RemoteController._();

  RemoteEventListener? rawListener;

  RemoteController._();

  void triggerKey(LogicalKeyboardKey key) {
    if (LogicalKeyboardKey.arrowLeft == key) {
      _moveLeft();
    } else if (LogicalKeyboardKey.arrowRight == key) {
      _moveRight();
    } else if (LogicalKeyboardKey.arrowUp == key) {
      _moveUp();
    } else if (LogicalKeyboardKey.arrowDown == key) {
      _moveDown();
    } else if ((LogicalKeyboardKey.backspace == key) || (LogicalKeyboardKey.escape == key)) {
      final message = const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
      ServicesBinding.instance!.defaultBinaryMessenger
          .handlePlatformMessage('flutter/navigation', message, (_) {});
    }
  }

  void init() {
    RawKeyboard.instance.addListener((event) {
      if (event is! RawKeyUpEvent) {
        return;
      }

      triggerKey(event.logicalKey);
    });
  }

  void _moveUp() {
    if (rawListener?.moveUp != null) {
      rawListener!.moveUp();
    } else {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.up);
    }
  }

  void _moveDown() {
    if (rawListener?.moveDown != null) {
      rawListener!.moveDown();
    } else {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.down);
    }
  }

  void _moveLeft() {
    if (rawListener?.moveLeft != null) {
      rawListener!.moveLeft();
    } else {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.left);
    }
  }

  void _moveRight() {
    if (rawListener?.moveRight != null) {
      rawListener!.moveRight();
    } else {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.right);
    }
  }
}
