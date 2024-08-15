import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTab;

  const AppContainer(
      {super.key, this.child, this.onTab, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab!=null? () => onTab!():null,
      child: Ink(
        child: Container(
          margin: margin??const EdgeInsets.all(8),
          padding: padding ?? const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
