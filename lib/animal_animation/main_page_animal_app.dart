import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/responsive.dart';
import 'vulture_page.dart';
import 'widget/camp_time_and_lapel.dart';
import 'widget/dots.dart';
import 'leopard_page.dart';
import 'styles.dart';
import 'dart:math' as math;

import 'widget/header.dart';

class MainPageAnimal extends StatefulWidget {
  const MainPageAnimal({super.key});

  @override
  State<MainPageAnimal> createState() => _MainPageAnimalState();
}

class _MainPageAnimalState extends State<MainPageAnimal>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final ValueNotifier _pageListener;
  late final AnimationController _animationController;

  @override
  void initState() {
    _pageController = PageController()..addListener(_listenToPage);
    _pageListener = ValueNotifier(0.0);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    super.initState();
  }

  _listenToPage() => _pageListener.value = _pageController.offset;

  @override
  void dispose() {
    _pageController
      ..removeListener(_listenToPage)
      ..dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final animationHeight = MediaQuery.sizeOf(context).height / 2;
    if (_pageController.page != 1.0) {
      return;
    } else {
      _animationController.value -= details.primaryDelta! / animationHeight;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    final animationHeight = MediaQuery.sizeOf(context).height / 2;
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed ||
        _pageController.page != 1.0) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / animationHeight;
    if (flingVelocity < 0.0) {
      _animationController.fling(velocity: math.max(1.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _animationController.fling(velocity: math.min(-1.0, -flingVelocity));
    } else {
      _animationController.fling(
          velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      body: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final isAnimated = _animationController.status.isAnimating ||
                    _animationController.status.isCompleted;
                return AbsorbPointer(absorbing: isAnimated, child: child);
              },
              child: PageView(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                children: [
                  LeopardPage(pageListener: _pageListener),
                  VulturePage(
                    pageListener: _pageListener,
                    animation: _animationController,
                  )
                ],
              ),
            ),
            The72Number(pageListener: _pageListener),
            LeopardImage(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            VultureImage(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            const Header(),
            _Footer(pageListener: _pageListener),
            _Arrow(
              animation: _animationController,
              pageController: _pageController,
            ),
            TravelDetails(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            OnMapText(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            StartCampLabel(pageListener: _pageListener),
            BaseCampLabel(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            StartCampTime(pageListener: _pageListener),
            BaseCampTime(
              pageListener: _pageListener,
              animation: _animationController,
            ),
            The72Km(pageListener: _pageListener),
            VirticleLine(animation: _animationController),
            AnimatedDot(
              pageListener: _pageListener,
              color: mainBlack,
              animationController: _animationController,
            ),
            AnimatedSmallDot(
              pageListener: _pageListener,
              isleft: true,
              animationController: _animationController,
            ),
            AnimatedSmallDot(
              pageListener: _pageListener,
              isleft: false,
              animationController: _animationController,
            ),
            AnimatedDot(
              pageListener: _pageListener,
              color: white,
              animationController: _animationController,
            ),
            VultureIconMainPage(animation: _animationController),
            LeopardIconMainPage(animation: _animationController),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required ValueNotifier pageListener})
      : _pageListener = pageListener;

  final ValueNotifier _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      bottom: kBottomNavigationBarHeight / 1.5,
      right: isTablet ? 30.0 : 20.0,
      width: screenWidth / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
              valueListenable: _pageListener,
              builder: (_, value, child) {
                final percent = value / screenWidth;
                return Row(
                  children: [
                    const SizedBox(width: 10.0),
                    Icon(
                      CupertinoIcons.circle_fill,
                      color: percent != 1.0 ? white : lightGrey,
                      size: 8.0,
                    ),
                    const SizedBox(width: 6.0),
                    Icon(
                      CupertinoIcons.circle_fill,
                      color: percent == 1.0 ? white : lightGrey,
                      size: 8.0,
                    ),
                  ],
                );
              }),
          const Icon(Icons.share, color: white),
        ],
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({
    required AnimationController animation,
    required PageController pageController,
  })  : _animationController = animation,
        _pageController = pageController;

  final AnimationController _animationController;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final the72TextHeight = screenHeight * 0.48;
    final isTablet = Responsive.isTablet(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final value = _animationController.value;
        return Positioned(
          top: isTablet
              ? kToolbarHeight * 3 + (1 - value) * (the72TextHeight + 130)
              : kToolbarHeight * 3 + (1 - value) * the72TextHeight - 20,
          right: 16.0,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: -0.5).animate(_animationController),
            child: child!,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_pageController.page == 1.0) {
            _animationController.forward();
          }
        },
        child: Icon(
          Icons.keyboard_arrow_up,
          color: lighterGrey,
          size: isTablet ? 40.0 : 30.0,
        ),
      ),
    );
  }
}
