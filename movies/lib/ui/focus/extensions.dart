import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/ui/widgets/platform.dart';

const kTvSize = Size(1920, 1080);

abstract class AdditionalLogicalKeyboardKey {
  static const LogicalKeyboardKey browseBack = LogicalKeyboardKey(0x10200000004,
      keyLabel: 'BrowseBack', debugName: kReleaseMode ? null : 'Browse back');
}

extension SubmitAction on RawKeyEvent {
  bool get hasSubmitIntent =>
      logicalKey == LogicalKeyboardKey.enter || logicalKey == LogicalKeyboardKey.select;

  bool get hasBrowseBackIntent =>
      this is RawKeyUpEvent && (logicalKey == AdditionalLogicalKeyboardKey.browseBack);
}

extension ScreenSizeExtension on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);
  Size get screenSize => MyPlatform.isTv ? kTvSize : _mediaQueryData.size;
}
