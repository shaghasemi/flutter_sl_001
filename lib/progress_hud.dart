import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool isAsyncCall;
  final double opacity;
  final Color color;
  // final Animation<Color> valueColor;

  const ProgressHUD({
    Key? key,
    required this.child,
    required this.isAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    // required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgetList = new List<Widget>();
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
