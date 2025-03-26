import 'package:flutter/material.dart';
// import 'package:flutter_animation/animal_animation/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/coffee_model.dart';
import 'widget/coffee_menu_details.dart';
import 'widget/coffee_size_image.dart';

class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({
    super.key,
    required this.animtion,
    required this.coffee,
  });

  final Animation<double> animtion;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _DetailCoffeeName(coffee: coffee),
          _CoffeeImage(coffee: coffee),
          _CoffeeDetailsPrice(coffee: coffee, animtion: animtion),
          _CoffeeSmallSize(animtion: animtion),
          _CoffeeMediamSize(animtion: animtion),
          _CoffeeLargeSize(animtion: animtion),
        ],
      ),
    );
  }
}

class _CoffeeSmallSize extends AnimatedWidget {
  const _CoffeeSmallSize({required Animation<double> animtion})
      : super(listenable: animtion);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final animation = listenable as Animation<double>;
    return Positioned(
      bottom: (screenHeight * 0.07),
      left: screenWidth * 0.2,
      width: screenWidth * 0.15,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(-3.0, 3.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )),
        child: CoffeeSizeImage(
          letterSize: 'S',
          image: Image.asset("assets/images/coffee_images/taza_s.png"),
        ),
      ),
    );
  }
}

class _CoffeeMediamSize extends AnimatedWidget {
  const _CoffeeMediamSize({required Animation<double> animtion})
      : super(listenable: animtion);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final animation = listenable as Animation<double>;
    return Positioned(
      bottom: (screenHeight * 0.07),
      left: screenWidth / 2 - (screenWidth * 0.15) / 2,
      width: screenWidth * 0.15,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(0.0, 3.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )),
        child: CoffeeSizeImage(
          letterSize: 'M',
          image: Image.asset("assets/images/coffee_images/taza_m.png"),
        ),
      ),
    );
  }
}

class _CoffeeLargeSize extends AnimatedWidget {
  const _CoffeeLargeSize({required Animation<double> animtion})
      : super(listenable: animtion);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final animation = listenable as Animation<double>;
    return Positioned(
      bottom: (screenHeight * 0.07),
      right: screenWidth * 0.2,
      width: screenWidth * 0.15,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(3.0, 3.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )),
        child: CoffeeSizeImage(
          letterSize: 'L',
          image: Image.asset("assets/images/coffee_images/taza_l.png"),
        ),
      ),
    );
  }
}

class _CoffeeDetailsPrice extends AnimatedWidget {
  const _CoffeeDetailsPrice({
    required Animation<double> animtion,
    required this.coffee,
  }) : super(listenable: animtion);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final animation = listenable as Animation<double>;
    return Positioned(
      left: (screenWidth * 0.1),
      bottom: (screenHeight * 0.22),
      height: screenHeight * 0.12,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(-2.0, 3.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        )),
        child: FittedBox(
          child: Text(
            "${coffee.price[CoffeeSize.mediam].toString()}SR",
            softWrap: true,
            style: GoogleFonts.mali(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              shadows: [const BoxShadow(blurRadius: 35.0)],
            ),
          ),
        ),
      ),
    );
  }
}

class _CoffeeImage extends StatelessWidget {
  const _CoffeeImage({required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Positioned(
      top: screenHeight * 0.15,
      height: screenHeight * 0.5,
      left: 0.0,
      right: 0.0,
      child: Hero(
        tag: coffee.name,
        transitionOnUserGestures: true,
        child: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta! > 5.0) {
                Navigator.pop(context);
              }
            },
            child: Image.asset(coffee.image, fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
}

class _DetailCoffeeName extends StatelessWidget {
  const _DetailCoffeeName({required this.coffee});

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Positioned(
      left: screenWidth / 2 - (screenWidth * 0.75) / 2,
      width: screenWidth * 0.75,
      child: Hero(
        tag: 'text${coffee.name}',
        child: Material(
          type: MaterialType.transparency,
          child: CoffeeHeaderName(coffeeName: coffee.name),
        ),
      ),
    );
  }
}
