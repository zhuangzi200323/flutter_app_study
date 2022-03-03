import 'dart:ui';

import 'canvas_helper.dart';
import 'shape.dart';
import 'shape_configuration.dart';

class TriangleShape extends Shape {
  TriangleShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawPath(
          CanvasHelper.getTrianglePath(shapeConfiguration.shapeSize, 0),
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawPath(
        CanvasHelper.getTrianglePath(
            shapeConfiguration.shapeSize, shapeConfiguration.borderWidth),
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }

  @override
  double getTextOffsetY(double height) {
    return super.getTextOffsetY(height) + height/4;
  }


}
