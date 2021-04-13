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
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.left);
    } else if (LogicalKeyboardKey.arrowRight == key) {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.right);
    } else if (LogicalKeyboardKey.arrowUp == key) {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.up);
    } else if (LogicalKeyboardKey.arrowDown == key) {
      FocusManager.instance.primaryFocus!.focusInDirection(TraversalDirection.down);
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
}
