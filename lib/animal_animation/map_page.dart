import 'package:flutter/material.dart';

import '../core/responsive.dart';
import 'styles.dart';
import 'widget/animal_icons.dart';
import 'widget/header.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key, required this.animation});
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          _MapImage(animation: animation),
          _CurveLines(animation: animation),
          Header(animation: animation),
          _BackText(animation: animation),
          const _VultureIconMapPage(),
          _LeopardIconMapPage(animation: animation),
          _BaseCamp(animation: animation),
          _StartCamp(animation: animation),
          _ShareIcon(animation: animation),
        ],
      ),
    );
  }
}

class _BaseCamp extends StatelessWidget {
  const _BaseCamp({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: kToolbarHeight * 3,
      left: screenWidth * 0.63,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double opacity = 0.0;
          if (animation.value >= 0.6) {
            opacity = animation.value;
          }
          return Opacity(opacity: opacity, child: child);
        },
        child: const Material(
          type: MaterialType.transparency,
          child: Text(baseCamp, style: TextStyle(color: white)),
        ),
      ),
    );
  }
}

class _ShareIcon extends StatelessWidget {
  const _ShareIcon({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      bottom: kBottomNavigationBarHeight / 1.5,
      right: isTablet ? 30.0 : 20.0,
      child: const Material(
        type: MaterialType.transparency,
        child: Icon(Icons.share, color: white),
      ),
    );
  }
}

class _StartCamp extends StatelessWidget {
  const _StartCamp({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      bottom: kBottomNavigationBarHeight * 3,
      left: screenWidth * 0.45,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double opacity = 0.0;
          if (animation.value >= 0.6) {
            opacity = animation.value;
          }
          return Opacity(opacity: opacity, child: child);
        },
        child: const Material(
          type: MaterialType.transparency,
          child: Text(startCamp, style: TextStyle(color: white)),
        ),
      ),
    );
  }
}

class _VultureIconMapPage extends StatelessWidget {
  const _VultureIconMapPage();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: screenHeight / 1.9,
      left: screenWidth / 1.5,
      child: const Material(
        type: MaterialType.transparency,
        child: Hero(
          tag: 'vulture',
          child: VultureIcon(),
        ),
      ),
    );
  }
}

class _LeopardIconMapPage extends StatelessWidget {
  const _LeopardIconMapPage({required this.animation});
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: screenHeight / 3.0,
      left: screenWidth / 2.5,
      child: const Material(
        type: MaterialType.transparency,
        child: Hero(
          tag: 'leopard',
          child: LeopardIcon(),
        ),
      ),
    );
  }
}

class _BackText extends StatelessWidget {
  const _BackText({required this.animation});
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        double percent = 0.0;
        if (animation.value >= 0.7) {
          percent = animation.value;
        }
        return Positioned(
          top: kToolbarHeight / 1.5,
          right: isTablet ? percent * 40.0 : percent * 20.0,
          child: Opacity(
            opacity: percent,
            child: child!,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Material(
          type: MaterialType.transparency,
          child: Text(
            "BACK",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _MapImage extends StatelessWidget {
  const _MapImage({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.color),
        child: ScaleTransition(
          scale: Tween(begin: 2.0, end: 1.0).animate(animation),
          child: RotationTransition(
            turns: Tween(begin: 0.95, end: 1.0).animate(animation),
            child: Image.asset(
              "assets/images/animal_images/map-min.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _CurveLines extends StatelessWidget {
  const _CurveLines({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);

    return Positioned(
      top: kToolbarHeight * 3,
      bottom: kBottomNavigationBarHeight * 3,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => CustomPaint(
          painter: CurvePainter(animation.value),
          child: child,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Align(
                  alignment: const Alignment(0, 1.0),
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (_, __) => Container(
                      margin: EdgeInsets.only(right: 100 * animation.value),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white, width: 1),
                        color: mainBlack,
                      ),
                      height: isTablet ? 12.0 : 8.0,
                      width: isTablet ? 12.0 : 8.0,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -1),
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (_, __) => Container(
                      margin: EdgeInsets.only(left: 40 * animation.value),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                      ),
                      height: isTablet ? 12.0 : 8.0,
                      width: isTablet ? 12.0 : 8.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double animationValue;
  double width = 0.0;

  CurvePainter(this.animationValue);

  double interpolate(double x) {
    return width / 2 + (x - width / 2) * animationValue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    width = size.width;
    paint.color = white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    var path = Path();

//    print(interpolate(size, x))
    var startPoint = Offset(interpolate(width / 2 + 20), 4);
    var controlPoint1 = Offset(interpolate(width / 2 + 60), size.height / 4);
    var controlPoint2 = Offset(interpolate(width / 2 + 20), size.height / 4);
    var endPoint = Offset(interpolate(width / 2 + 55 + 4), size.height / 3);

    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    startPoint = endPoint;
    controlPoint1 = Offset(interpolate(width / 2 + 100), size.height / 2);
    controlPoint2 = Offset(interpolate(width / 2 + 20), size.height / 2 + 40);
    endPoint = Offset(interpolate(width / 2 + 50 + 2), 2 * size.height / 3 - 1);

    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    startPoint = endPoint;
    controlPoint1 =
        Offset(interpolate(width / 2 - 20), 2 * size.height / 3 - 10);
    controlPoint2 =
        Offset(interpolate(width / 2 + 20), 5 * size.height / 6 - 10);
    endPoint = Offset(interpolate(width / 2), 5 * size.height / 6 + 2);

    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    startPoint = endPoint;
    controlPoint1 = Offset(interpolate(width / 2 - 100), size.height - 80);
    controlPoint2 = Offset(interpolate(width / 2 - 40), size.height - 50);
    endPoint = Offset(interpolate(width / 2 - 50), size.height - 4);

    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
