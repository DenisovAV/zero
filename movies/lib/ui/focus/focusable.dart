import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:movies/ui/focus/extensions.dart';

typedef FocusableBuilder = Widget Function(
  BuildContext context,
  Widget? child,
  bool isFocused,
);

class FocusableWidget extends StatefulWidget {
  final FocusableBuilder builder;
  final Widget? child;
  final ValueChanged<bool>? onFocusChange;

  const FocusableWidget({
    required this.builder,
    this.child,
    this.onFocusChange,
    Key? key,
  }) : super(key: key);

  @override
  _FocusableWidgetState createState() => _FocusableWidgetState();
}

class _FocusableWidgetState extends State<FocusableWidget> {
  bool _isFocused = false;
  final _key = GlobalKey();
  late VoidCallback _onSubmit;

  void _extractSubmit(Element element) {
    final widget = element.widget;

    if (widget is GestureDetector) {
      _onSubmit = widget.onTap ?? () {};
      return;
    }

    if (widget is InkWell) {
      _onSubmit = widget.onTap ?? () {};
      return;
    }

    element.visitChildElements(_extractSubmit);
  }

  bool _onKeyHandler(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      return true;
    }
    if (event.hasSubmitIntent) {
      _onSubmit();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _key.currentContext!.visitChildElements(_extractSubmit);
    });
  }

  @override
  Widget build(BuildContext context) {
    var focusChild = widget.child;

    focusChild = widget.builder(context, widget.child, _isFocused);

    return Focus(
      autofocus: true,
      key: _key,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);

        setState(() {
          _isFocused = value;
        });
      },
      onKey: _onKeyHandler,
      child: focusChild,
    );
  }
}
