import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    super.key,
    required this.color,
    this.isBottom = false,
  });
  final Widget child;
  final Color color;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: isBottom,
          child: ColoredBox(
            color: color,
            child: child,
          ),
        ),
      ),
    );
  }
}
