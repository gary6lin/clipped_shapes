import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

class _OvalBorder extends OutlinedBorder {
  const _OvalBorder({BorderSide side = BorderSide.none}) : super(side: side);

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(side.width);
  }

  @override
  ShapeBorder scale(double t) => _OvalBorder(side: side.scale(t));

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addOval(rect.deflate(side.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addOval(rect);
  }

  @override
  _OvalBorder copyWith({BorderSide? side}) {
    return _OvalBorder(side: side ?? this.side);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        canvas.drawOval(
          rect.deflate(side.width / 2.0),
          side.toPaint(),
        );
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _OvalBorder && other.side == side;
  }

  @override
  int get hashCode => side.hashCode;

  @override
  String toString() {
    return '${objectRuntimeType(this, 'OvalBorder')}($side)';
  }
}
