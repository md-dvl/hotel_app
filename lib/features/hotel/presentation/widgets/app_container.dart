import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    this.isTop = false,
    this.isBottom = true,
    this.isBoth = false,
    super.key,
  });

  final Widget child;
  final bool isTop;
  final bool isBottom;
  final bool isBoth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isBoth
            ? const BorderRadius.all(Radius.circular(12))
            : isBottom
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )
                : isTop
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )
                    : null,
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
