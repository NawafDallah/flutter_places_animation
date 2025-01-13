import 'package:flutter/material.dart';

import '../core/responsive.dart';
import 'styles.dart';

class LeopardPage extends StatelessWidget {
  const LeopardPage({super.key, required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final the72TextHeight = screenHeight * 0.48;
    final isTablet = Responsive.isTablet(context);
    return Padding(
      padding: isTablet
          ? const EdgeInsets.only(left: 40.0)
          : const EdgeInsets.only(left: 20.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTablet
              ? SizedBox(height: kToolbarHeight * 3 + the72TextHeight + 130)
              : SizedBox(height: kToolbarHeight * 3 + the72TextHeight - 16),
          _LeopardLapel(pageListener: _pageListener),
          const Spacer(),
          _LeopardDescription(pageListener: _pageListener),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  const LeopardImage({
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
    return ListenableBuilder(
      listenable: Listenable.merge([_animation, _pageListener]),
      builder: (context, child) {
        final animation = (_animation.value / 0.3).clamp(0.0, 1.0);
        return Positioned(
          top: 0.0,
          bottom: 0.0,
          width: screenWidth * 1.6,
          left: 0.85 * -_pageListener.value,
          child: Transform.scale(
            alignment: Alignment(1.5 * animation, -8 * animation),
            scale: 1.0 - 0.01 * animation,
            child: child!,
          ),
        );
      },
      child: IgnorePointer(
          child: Image.asset(
        "assets/images/animal_images/leopard.png",
        fit: BoxFit.contain,
      )),
    );
  }
}

class _LeopardLapel extends StatelessWidget {
  const _LeopardLapel({required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (context, value, child) {
        final double percent = value / screenWidth;
        final double opacity = (percent / 0.3).clamp(0.0, 1.0);
        return Opacity(
          opacity: 1 - opacity,
          child: child!,
        );
      },
      child: const IgnorePointer(
        child: Text(
          leopardLapal,
          style: TextStyle(
            fontSize: 18,
            color: lighterGrey,
          ),
        ),
      ),
    );
  }
}

class _LeopardDescription extends StatelessWidget {
  const _LeopardDescription({required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) {
        final double percent = value / screenWidth;
        final double opacity = (percent / 0.3).clamp(0.0, 1.0);
        return Opacity(
          opacity: 1 - opacity,
          child: child,
        );
      },
      child: const IgnorePointer(
        child: Text(
          leopardDescription,
          style: TextStyle(
            color: lightGrey,
            letterSpacing: 1.8,
            wordSpacing: 1.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class The72Number extends StatelessWidget {
  const The72Number({super.key, required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    final the72TextHeight = screenHeight * 0.48;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) => Positioned(
        height: isTablet ? the72TextHeight * 1.15 : the72TextHeight,
        top: screenHeight / 2 - the72TextHeight * 1.4 / 2,
        left: -the72TextHeight / 4 - value * 2.0,
        child: child!,
      ),
      child: const IgnorePointer(
        child: RotatedBox(
          quarterTurns: 1,
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            child: Text(
              '72',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
