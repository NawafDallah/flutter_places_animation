import 'package:flutter/material.dart';

import '../core/responsive.dart';
import 'coffee_menu.dart';
import 'data/coffee_model.dart';
import 'widget/shimmer_arrow.dart';

class MainPageCoffee extends StatefulWidget {
  const MainPageCoffee({super.key});

  @override
  State<MainPageCoffee> createState() => _MainPageCoffeeState();
}

class _MainPageCoffeeState extends State<MainPageCoffee>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController.unbounded(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(min: -0.5, max: 1.5);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDrag,
        child: Stack(
          children: [
            // the backgroind linear gradient
            const _GradientBackGround(),
            // const _FirstCoffee(),
            const _SecondCoffee(),
            const _ThirdCoffee(),
            const _FourthCoffee(),
            const _CoffeeLoge(),
            _AnimatiomShimmerArrow(animation: _animationController),
          ],
        ),
      ),
    );
  }

  void _onVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! < -10) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 750),
          reverseTransitionDuration: const Duration(milliseconds: 750),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          pageBuilder: (context, animation, _) =>
              CoffeeMenu(animation: animation),
        ),
      );
    }
  }
}

class _GradientBackGround extends StatelessWidget {
  const _GradientBackGround();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.brown, Colors.white],
          ),
        ),
      ),
    );
  }
}

// class _FirstCoffee extends StatelessWidget {
//   const _FirstCoffee();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.sizeOf(context).height;
//     return Positioned(
//       top: screenHeight * 0.2,
//       height: screenHeight * 0.35,
//       left: 0.0,
//       right: 0.0,
//       child: Image.asset(CoffeeServices.coffees[0].image),
//     );
//   }
// }

class _SecondCoffee extends StatelessWidget {
  const _SecondCoffee();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      top: isTablet ? screenHeight * 0.185 : screenHeight * 0.27,
      height: isTablet ? screenHeight * 0.55 : screenHeight * 0.45,
      left: 0.0,
      right: 0.0,
      child: Hero(
        tag: CoffeeServices.coffees[6].name,
        transitionOnUserGestures: true,
        child: Material(
          type: MaterialType.transparency,
          child: Image.asset(CoffeeServices.coffees[6].image),
        ),
      ),
    );
  }
}

class _ThirdCoffee extends StatelessWidget {
  const _ThirdCoffee();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      top: isTablet ? screenHeight * 0.52 : screenHeight * 0.4,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Hero(
        tag: CoffeeServices.coffees[7].name,
        child: Material(
          type: MaterialType.transparency,
          child: Transform.scale(
            scale: isTablet ? 2.5 : 1.5,
            child: Image.asset(CoffeeServices.coffees[7].image),
          ),
        ),
      ),
    );
  }
}

class _FourthCoffee extends StatelessWidget {
  const _FourthCoffee();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: isTablet ? -screenHeight * 0.67 : -screenHeight * 0.58,
      height: screenHeight * 0.7,
      child: Hero(
        tag: CoffeeServices.coffees[8].name,
        child: Material(
          type: MaterialType.transparency,
          child: Transform.scale(
            scale: isTablet ? 3.0 : 2.0,
            child: Image.asset(CoffeeServices.coffees[8].image),
          ),
        ),
      ),
    );
  }
}

class _CoffeeLoge extends StatelessWidget {
  const _CoffeeLoge();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isSmallPhone = Responsive.isSmallMobile(context);
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom:
          isSmallPhone || isTablet ? screenHeight * 0.235 : screenHeight * 0.19,
      height: screenHeight * 0.2,
      child: Image.asset("assets/images/coffee_images/logo.png"),
    );
  }
}

class _AnimatiomShimmerArrow extends StatelessWidget {
  const _AnimatiomShimmerArrow({required AnimationController animation})
      : _animationController = animation;

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      top: isTablet ? screenHeight * 0.085 : screenHeight * 0.14,
      left: 0.0,
      right: 0.0,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              transform: SlideShimmerArrow(
                animation: _animationController.value,
              ),
              colors: const [
                Colors.white60,
                Colors.brown,
                Colors.white60,
              ],
            ).createShader(bounds),
            child: child,
          );
        },
        child: Transform.scale(
          scale: isTablet ? 1.1 : 1.0,
          child: const ShimmerArrow(),
        ),
      ),
    );
  }
}

class SlideShimmerArrow extends GradientTransform {
  const SlideShimmerArrow({required this.animation});
  final double animation;
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0.0, bounds.height * (1 - animation), 0.0);
  }
}
