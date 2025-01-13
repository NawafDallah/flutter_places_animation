import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/responsive.dart';
import 'map_page.dart';
import 'styles.dart';
import 'widget/animal_icons.dart';

class OnMapText extends StatelessWidget {
  const OnMapText({
    super.key,
    required ValueNotifier pageListener,
    required AnimationController animation,
  })  : _pageListener = pageListener,
        _animation = animation;

  final ValueNotifier _pageListener;
  final AnimationController _animation;

  void goToMapPage(BuildContext context, double value) {
    if (value == 1.0 && _animation.status.isCompleted) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          pageBuilder: (context, animation, secondaryAnimation) =>
              MapPage(animation: animation),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      bottom: kBottomNavigationBarHeight / 1.5,
      left: isTablet ? 30.0 : 20.0,
      child: ValueListenableBuilder(
        valueListenable: _pageListener,
        builder: (context, value, child) => AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: value >= screenWidth * 0.8 ? 1.0 : 0.0,
          child: GestureDetector(
            onTap: () => goToMapPage(context, value / screenWidth),
            child: child,
          ),
        ),
        child: const Text(onMap, style: TextStyle(color: lighterGrey)),
      ),
    );
  }
}

class TravelDetails extends StatelessWidget {
  const TravelDetails({
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
    final the72TextHeight = screenHeight * 0.48;
    final isTablet = Responsive.isTablet(context);
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        double percent = 0.0;
        if (_pageListener.value >= screenWidth / 3) {
          percent = _pageListener.value / screenWidth;
        }
        final animation = 1 - _animation.value;
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + animation * (the72TextHeight + 130)
              : kToolbarHeight * 3 + animation * the72TextHeight - 16,
          left: isTablet
              ? 64.0 + (screenWidth / 2) * (1 - percent)
              : 32.0 + (screenWidth / 2) * (1 - percent),
          child: Opacity(
            opacity: percent,
            child: child!,
          ),
        );
      },
      child: IgnorePointer(
        child: Text(
          'Travel details',
          style: TextStyle(
            color: lighterGrey,
            fontSize: isTablet ? 24.0 : 18.0,
          ),
        ),
      ),
    );
  }
}

class VultureIconMainPage extends StatelessWidget {
  const VultureIconMainPage({
    super.key,
    required AnimationController animation,
  }) : _animation = animation;

  final AnimationController _animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double opacity = 0.0;
        if (_animation.value > 0.75) {
          opacity = _animation.value;
        }
        return Positioned(
          top: screenHeight / 3 + 50 * (1 - _animation.value),
          left: screenWidth / 6 - 50 * (1 - _animation.value),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: opacity,
            child: child!,
          ),
        );
      },
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

class LeopardIconMainPage extends StatelessWidget {
  const LeopardIconMainPage({
    super.key,
    required AnimationController animation,
  }) : _animation = animation;

  final AnimationController _animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double opacity = 0.0;
        if (_animation.value > 0.75) {
          opacity = _animation.value;
        }
        return Positioned(
          top: screenHeight / 2 + 50 * (1 - _animation.value),
          right: screenWidth / 6 - 50 * (1 - _animation.value),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: opacity,
            child: child!,
          ),
        );
      },
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

class VultureImage extends StatelessWidget {
  const VultureImage({
    super.key,
    required AnimationController animation,
    required ValueNotifier pageListener,
  })  : _animation = animation,
        _pageListener = pageListener;

  final AnimationController _animation;
  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        final animation = (_animation.value / 0.3).clamp(0.0, 1.0);
        return Positioned(
          top: 0.0,
          bottom: 100,
          width: isTablet ? screenWidth * 0.3 : screenWidth * 0.4,
          left: isTablet
              ? 1.15 * screenWidth - 0.8 * _pageListener.value
              : 1.1 * screenWidth - 0.8 * _pageListener.value,
          child: Transform.scale(
            scale: isTablet ? 1.1 - 0.2 * animation : 0.9 - 0.2 * animation,
            child: ClipRect(
              clipBehavior: Clip.none,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 8.0 * animation,
                  sigmaY: 8.0 * animation,
                ),
                child: Opacity(
                  opacity: 1 - 0.7 * animation,
                  child: child!,
                ),
              ),
            ),
          ),
        );
      },
      child: IgnorePointer(
        child: Image.asset("assets/images/animal_images/vulture.png"),
      ),
    );
  }
}

class VirticleLine extends StatelessWidget {
  const VirticleLine({super.key, required AnimationController animation})
      : _animation = animation;

  final AnimationController _animation;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    final lineHeight = screenHeight * 0.5;
    const verticalLineWitdth = 2.0;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final tabletHeight = (lineHeight + 120 + lineHeight / 8);
        final phoneHeight = (lineHeight - 20 + lineHeight / 8);
        return Positioned(
          left: screenWidth / 2 - verticalLineWitdth / 2,
          top: kToolbarHeight * 3,
          height: isTablet ? tabletHeight : phoneHeight,
          child: Padding(
            padding: EdgeInsets.only(
              top: isTablet
                  ? tabletHeight * (1 - _animation.value)
                  : phoneHeight * (1 - _animation.value),
            ),
            child: child!,
          ),
        );
      },
      child: const SizedBox(
        width: verticalLineWitdth,
        child: ColoredBox(color: white),
      ),
    );
  }
}

class VulturePage extends StatelessWidget {
  const VulturePage({
    super.key,
    required AnimationController animation,
    required ValueNotifier pageListener,
  })  : _animation = animation,
        _pageListener = pageListener;

  final AnimationController _animation;
  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _CircleVuture(pageListener: _pageListener, animation: _animation),
    );
  }
}

class _CircleVuture extends StatelessWidget {
  const _CircleVuture({
    required AnimationController animation,
    required ValueNotifier pageListener,
  })  : _animation = animation,
        _pageListener = pageListener;

  final AnimationController _animation;
  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenwidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        final percent = _pageListener.value / screenwidth;
        final bool = percent >= 0.9;
        double dimansion = 0.0;
        if (isTablet) {
          dimansion = bool ? 400 : 0.0;
        } else {
          dimansion = bool ? 200 : 0.0;
        }
        final animation = (_animation.value / 0.01).clamp(0.0, 1.0);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: dimansion * (1 - animation),
          width: dimansion * (1 - animation),
          margin: EdgeInsets.only(bottom: screenHeight * 0.35),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: lightGrey,
          ),
        );
      },
    );
  }
}
