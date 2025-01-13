import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import '../styles.dart';

class StartCampLabel extends StatelessWidget {
  const StartCampLabel({
    super.key,
    required ValueNotifier pageListener,
  }) : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) {
        double percent = 0.0;
        if (value >= screenWidth / 3) {
          percent = value / screenWidth;
        }
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + the72TextHeight + 130 + the72TextHeight / 8
              : kToolbarHeight * 3 + the72TextHeight - 16 + the72TextHeight / 8,
          left: isTablet
              ? 72.0 * 2 - (screenWidth / 8) * (1 - percent)
              : 32.0 * 2 - (screenWidth / 8) * (1 - percent),
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Text(
        startCamp,
        style: TextStyle(color: lighterGrey, fontSize: isTablet ? 18.0 : null),
      ),
    );
  }
}

class StartCampTime extends StatelessWidget {
  const StartCampTime({super.key, required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) {
        double percent = 0.0;
        if (value >= screenWidth / 3) {
          percent = value / screenWidth;
        }
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + the72TextHeight + 130 + the72TextHeight / 4
              : kToolbarHeight * 3 + the72TextHeight - 16 + the72TextHeight / 4,
          left: isTablet
              ? 72.0 * 2.5 - (screenWidth / 5) * (1 - percent)
              : 32.0 * 2.5 - (screenWidth / 5) * (1 - percent),
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Text(
        startCampTime,
        style: TextStyle(color: lightGrey, fontSize: isTablet ? 14.0 : 12.0),
      ),
    );
  }
}

class BaseCampLabel extends StatelessWidget {
  const BaseCampLabel({
    super.key,
    required AnimationController animation,
    required ValueNotifier pageListener,
  })  : _animation = animation,
        _pageListener = pageListener;

  final AnimationController _animation;
  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        double percent = 0.0;
        if (_pageListener.value >= screenWidth / 3) {
          percent = _pageListener.value / screenWidth;
        }
        final tabletHeight = (1 - _animation.value) * (the72TextHeight + 130);
        final phoneHeight = (1 - _animation.value) * (the72TextHeight - 16);
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + tabletHeight + 70
              : kToolbarHeight * 3 + phoneHeight + the72TextHeight / 8,
          right: isTablet
              ? 72.0 * 2 - (screenWidth / 8) * (1 - percent)
              : 32.0 * 2 - (screenWidth / 8) * (1 - percent),
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Text(
        baseCamp,
        style: TextStyle(color: lighterGrey, fontSize: isTablet ? 18.0 : null),
      ),
    );
  }
}

class BaseCampTime extends StatelessWidget {
  const BaseCampTime({
    super.key,
    required AnimationController animation,
    required ValueNotifier pageListener,
  })  : _animation = animation,
        _pageListener = pageListener;

  final AnimationController _animation;
  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        double percent = 0.0;
        if (_pageListener.value >= screenWidth / 3) {
          percent = _pageListener.value / screenWidth;
        }
        final animation = 1 - _animation.value;
        final tabletHeight = animation * (the72TextHeight + 130);
        final phoneHeight = animation * (the72TextHeight - 16);
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + tabletHeight + the72TextHeight / 4
              : kToolbarHeight * 3 + phoneHeight + the72TextHeight / 4,
          right: isTablet
              ? 72.0 * 2.5 - (screenWidth / 5) * (1 - percent)
              : 32.0 * 2.5 - (screenWidth / 5) * (1 - percent),
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Text(
        baseCampTime,
        style: TextStyle(color: lightGrey, fontSize: isTablet ? 14.0 : 12.0),
      ),
    );
  }
}

class The72Km extends StatelessWidget {
  const The72Km({super.key, required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) {
        double percent = 0.0;
        if (value >= screenWidth / 3) {
          percent = value / screenWidth;
        }
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + the72TextHeight + 120 + the72TextHeight / 4
              : kToolbarHeight * 3 + the72TextHeight - 20 + the72TextHeight / 4,
          right: 0.0,
          left: 0.0,
          child: Opacity(
            opacity: percent,
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          the72Km,
          style: TextStyle(
            color: white,
            fontSize: isTablet ? 18.0 : null,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
