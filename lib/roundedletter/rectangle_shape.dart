import 'dart:ui';

import 'canvas_helper.dart';
import 'shape.dart';
import 'shape_configuration.dart';

class RectangleShape extends Shape {
  RectangleShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    double shapeWidthWithBorder =
        shapeConfiguration.shapeSize + shapeConfiguration.borderWidth;
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawRect(
          Rect.fromLTRB(0, 0, shapeWidthWithBorder, shapeWidthWithBorder),
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawRect(
        Rect.fromLTRB(
            shapeConfiguration.borderWidth,
            shapeConfiguration.borderWidth,
            shapeConfiguration.shapeSize,
            shapeConfiguration.shapeSize),
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }
}
