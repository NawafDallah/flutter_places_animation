import 'dart:ui';
import 'package:flutter/material.dart';

import 'widgets/my_container.dart';

class IosPage extends StatefulWidget {
  const IosPage({super.key});

  @override
  State<IosPage> createState() => _IosPageState();
}

class _IosPageState extends State<IosPage> {
  late final PageController _pageController;
  final ValueNotifier<double> _pageListener = ValueNotifier(0.0);

  @override
  void initState() {
    _pageController = PageController()..addListener(_onListenPage);
    super.initState();
  }

  _onListenPage() => _pageListener.value = _pageController.page!;

  @override
  void dispose() {
    _pageController
      ..removeListener(_onListenPage)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: kToolbarHeight * 2.0,
            left: 0.0,
            right: 0.0,
            height: size.height * 0.4,
            child: PageView.builder(
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MyAnimatedContainer(
                      index: index,
                      pageListener: _pageListener,
                    ),
                    BlurAnimation(index: index, pageListener: _pageListener),
                    AnimatedImage(index: index, pageListener: _pageListener),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required ValueNotifier<double> pageListener,
    required this.index,
  }) : _pageListener = pageListener;

  final ValueNotifier<double> _pageListener;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (context, value, child) {
        final percent = value - index;
        final animation = (percent / 0.5);
        return Positioned(
          top: -75.0,
          height: screenHeight * 0.35,
          right: 25.0 + 100 * animation,
          child: child!,
        );
      },
      child: Image.asset("assets/images/animal_images/vulture.png"),
    );
  }
}

class MyAnimatedContainer extends StatelessWidget {
  const MyAnimatedContainer({
    super.key,
    required ValueNotifier<double> pageListener,
    required this.index,
  }) : _pageListener = pageListener;

  final ValueNotifier<double> _pageListener;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Positioned(
      left: 0.0,
      right: 0.0,
      height: screenHeight * 0.4,
      child: ValueListenableBuilder(
        valueListenable: _pageListener,
        builder: (_, value, child) {
          final percent = value - index;
          final animation = percent / 0.75;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-animation),
            child: child,
          );
        },
        child: const MyContainer(color: Colors.blueGrey),
      ),
    );
  }
}

class BlurAnimation extends StatelessWidget {
  const BlurAnimation({
    super.key,
    required this.index,
    required ValueNotifier<double> pageListener,
  }) : _pageListener = pageListener;

  final ValueNotifier<double> _pageListener;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Positioned(
      left: 0.0,
      right: 0.0,
      height: screenHeight * 0.4,
      child: ValueListenableBuilder(
        valueListenable: _pageListener,
        builder: (_, value, child) {
          final percent = value - index;
          final blur = percent.abs() * 10.0;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-percent),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: child,
              ),
            ),
          );
        },
        child: const ColoredBox(color: Colors.transparent),
      ),
    );
  }
}
