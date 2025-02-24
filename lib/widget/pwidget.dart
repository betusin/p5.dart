import 'package:flutter/material.dart';
import 'package:p5/painter.dart';

class PWidget extends StatelessWidget {
  Painter? painter;

  PWidget(Painter? p) {
    painter = p;
  }

  @override
  Widget build(BuildContext context) {
//    print("BUILDING WIDGET...");

//    print(painter);
    return new Container(
      width: painter!.fillParent ? null : painter!.width.toDouble(),
      height: painter!.fillParent ? null : painter!.height.toDouble(),
      constraints: painter!.fillParent ? BoxConstraints.expand() : null,
      //new
      margin: const EdgeInsets.all(0.0),
      child: new ClipRect(
          child: new CustomPaint(
        painter: painter,
        child: new GestureDetector(
          // The gesture detector needs to be declared here so it can
          // access the context from the CustomPaint, which allows to
          // transforms global positions into local positions relative
          // to the widget.
          onTapDown: (details) {
            painter!.onTapDown(context, details);
          },
          onPanStart: (details) {
            painter!.onDragStart(context, details);
          },
          onPanUpdate: (details) {
            painter!.onDragUpdate(context, details);
          },
          onTapUp: (details) {
            painter!.onTapUp(context, details);
          },
//              onTapCancel: (details) {
//
//              },
//              onPanCancel: (details) {
//
//              },
          onPanEnd: (details) {
            painter!.onDragEnd(context, details);
          },
        ),
      )),
    );
  }
}
