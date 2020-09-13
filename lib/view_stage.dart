import 'package:eWalle/views/home.dart';
import 'package:eWalle/views/menu.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ViewStage extends StatefulWidget {
  @override
  _ViewStageState createState() => _ViewStageState();
}

class _ViewStageState extends State<ViewStage>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;
  bool _canBeDragged = true;
  static const double maxSlide = 200;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      // duration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void toggle() {
    _ctrl.value > 0 ? _close() : _open();
  }

  /// Starts an animation to open the drawer.
  void _open() {
    _ctrl.fling(velocity: 1.0);
  }

  /// Starts an animation to close the drawer.
  void _close() {
    _ctrl.fling(velocity: -1.0);
  }

  _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        _ctrl.isDismissed && details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight =
        _ctrl.isCompleted && details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragCloseFromRight || isDragOpenFromLeft;
  }

  _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      _ctrl.value += delta;
    }
  }

  _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double _kMinFlingVelocity = 365.0;

    if (_ctrl.isDismissed || _ctrl.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _ctrl.fling(velocity: visualVelocity);
    } else if (_ctrl.value < 0.5) {
      _close();
    } else {
      _open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MenuView(
          closeDrawer: _close,
        ),
        GestureDetector(
          onHorizontalDragStart: _onDragStart,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          child: AnimatedBuilder(
              animation: _ctrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: HomeView(
                  openDrawer: _open,
                ),
              ),
              builder: (BuildContext context, Widget child) {
                double scale = 1 - _ctrl.value * .3;
                double degree = _ctrl.value * -15;
                double transX = _ctrl.value * 200;
                double transY = _ctrl.value * 150;

                return Transform(
                  transform: Matrix4Transform()
                      .scale(scale)
                      .rotateDegrees(degree, origin: Offset(25, 25))
                      .translate(x: transX, y: transY)
                      .matrix4,
                  child: child,
                );
              }),
        ),
        // HomeView(),
      ],
    );
  }
}
