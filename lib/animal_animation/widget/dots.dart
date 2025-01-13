import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import '../styles.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required ValueNotifier pageListener,
    required AnimationController animationController,
    required this.color,
  })  : _pageListener = pageListener,
        _animationController = animationController;

  final ValueNotifier _pageListener;
  final AnimationController _animationController;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ListenableBuilder(
      listenable: Listenable.merge([
        _animationController,
        _pageListener,
      ]),
      builder: (context, child) {
        double percent = 0.0;
        if (_pageListener.value >= screenWidth / 3) {
          percent = _pageListener.value / screenWidth;
        }
        final double horizontalOffset = percent * screenWidth * 0.12;
        final double verticleOffset =
            color == mainBlack ? 0.0 : _animationController.value;
        final animation = (_animationController.value / 0.1).clamp(0.0, 1.0);
        final tabletHeight = the72TextHeight + 140 + the72TextHeight / 8;
        final phoneHeight = the72TextHeight - 9 + the72TextHeight / 8;
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + (1 - verticleOffset) * tabletHeight
              : kToolbarHeight * 3 + (1 - verticleOffset) * phoneHeight,
          right: color == mainBlack ? horizontalOffset * (1 - animation) : 0.0,
          left: color == white ? horizontalOffset * (1 - animation) : 0.0,
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: white, width: 1.0),
          color: color,
        ),
        height: isTablet ? 12.0 : 8.0,
        width: isTablet ? 12.0 : 8.0,
      ),
    );
  }
}

class AnimatedSmallDot extends StatelessWidget {
  const AnimatedSmallDot({
    super.key,
    required ValueNotifier pageListener,
    required AnimationController animationController,
    required this.isleft,
  })  : _pageListener = pageListener,
        _animationController = animationController;

  final ValueNotifier _pageListener;
  final AnimationController _animationController;
  final bool isleft;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ListenableBuilder(
      listenable: Listenable.merge([
        _animationController,
        _pageListener,
      ]),
      builder: (context, child) {
        double percent = 0.0;
        if (_pageListener.value >= screenWidth / 3) {
          percent = _pageListener.value / screenWidth;
        }
        final double horizontalOffset = percent * screenWidth * 0.035;
        final double verticleOffset = isleft
            ? _animationController.value / 3
            : _animationController.value / 1.5;
        final animation = (_animationController.value / 0.01).clamp(0.0, 1.0);
        final tabletHeight = the72TextHeight + 140 + the72TextHeight / 8;
        final phoneHeight = the72TextHeight - 9 + the72TextHeight / 8;
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + (1 - verticleOffset) * tabletHeight
              : kToolbarHeight * 3 + (1 - verticleOffset) * phoneHeight,
          right: isleft ? horizontalOffset * (1 - animation) : 0.0,
          left: isleft ? 0.0 : horizontalOffset * (1 - animation),
          child: Opacity(
            opacity: percent,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrey,
                border: _animationController.value >= 0.05
                    ? Border.all(color: white, width: 2, strokeAlign: 0.5)
                    : null,
              ),
              height: isTablet ? 12.0 : 6.0,
              width: isTablet ? 12.0 : 6.0,
            ),
          ),
        );
      },
    );
  }
}
