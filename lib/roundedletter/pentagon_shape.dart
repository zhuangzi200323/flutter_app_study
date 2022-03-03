import 'dart:ui';

import 'canvas_helper.dart';
import 'shape.dart';
import 'shape_configuration.dart';

class PentagonShape extends Shape {
  PentagonShape(ShapeConfiguration shapeConfiguration)
      : super(shapeConfiguration: shapeConfiguration);

  @override
  void draw(Canvas canvas, Size size) {
    if (shapeConfiguration.borderWidth > 0) {
      canvas.drawPath(
          CanvasHelper.getPolygonalPath(shapeConfiguration.shapeSize, 0, 5),
          CanvasHelper.getPaintWithColor(shapeConfiguration.borderColor));
    }
    canvas.drawPath(
        CanvasHelper.getPolygonalPath(
            shapeConfiguration.shapeSize, shapeConfiguration.borderWidth, 5),
        CanvasHelper.getPaintWithColor(shapeConfiguration.shapeColor));
    drawText(canvas);
  }

}
