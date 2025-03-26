import 'package:flutter/material.dart';
import 'package:flutter_animation/coffee_animation/coffee_details_page.dart';

import '../core/responsive.dart';
import 'data/coffee_model.dart';
import 'widget/coffee_header.dart';
import 'widget/coffee_menu_details.dart';
import 'widget/coffee_shadow.dart';

const _initialPage = 8.0;
const _duration = Duration(seconds: 1);

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key, required this.animation});

  final Animation<double> animation;

  @override
  State<CoffeeMenu> createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  late final PageController _coffeePageController;
  late final PageController _textPageController;
  late final ValueNotifier<double> _pageListener;

  void listenToPage() => _pageListener.value = _coffeePageController.page!;

  @override
  void initState() {
    _coffeePageController = PageController(
      viewportFraction: 0.35,
      initialPage: _initialPage.toInt(),
    )..addListener(listenToPage);
    _textPageController = PageController(initialPage: _initialPage.toInt());
    _pageListener = ValueNotifier<double>(_initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _coffeePageController
      ..removeListener(listenToPage)
      ..dispose();
    _textPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _FooterShadow(pageListener: _pageListener),
          const _LeftShadow(),
          const CoffeeHeader(),
          // coffees vertical page view
          _CoffeesVerticalPageView(
            coffeePageController: _coffeePageController,
            textPageController: _textPageController,
            pageListener: _pageListener,
          ),
          // price & name of the coffee
          _CoffeeNameAndPrice(
            pageController: _textPageController,
            pageListener: _pageListener,
            animation: widget.animation,
          ),
        ],
      ),
    );
  }
}

class _FooterShadow extends StatelessWidget {
  const _FooterShadow({required ValueNotifier<double> pageListener})
      : _pageListener = pageListener;

  final ValueNotifier<double> _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return ValueListenableBuilder(
      valueListenable: _pageListener,
      builder: (_, value, child) {
        final isLastIndex = value > CoffeeServices.coffees.length - 1;
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          left: 0.0,
          right: 0.0,
          bottom: isLastIndex
              ? -kBottomNavigationBarHeight * 10.0
              : -kBottomNavigationBarHeight * 4.0,
          height: screenHeight * 0.2,
          child: child!,
        );
      },
      child: const CoffeeShadow(
        color: Colors.brown,
        blurRadius: 150,
        spreadRadius: 150.0,
      ),
    );
  }
}

class _LeftShadow extends StatelessWidget {
  const _LeftShadow();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      left: isTablet ? -screenHeight * 0.1 : -screenHeight * 0.19,
      top: kBottomNavigationBarHeight * 3.0,
      height: screenHeight * 0.2,
      child: const CoffeeShadow(
        color: Colors.brown,
        blurRadius: 100,
        spreadRadius: 150.0,
      ),
    );
  }
}

class _CoffeeNameAndPrice extends AnimatedWidget {
  const _CoffeeNameAndPrice({
    required PageController pageController,
    required ValueNotifier<double> pageListener,
    required Animation<double> animation,
  })  : _textPageController = pageController,
        _pageListener = pageListener,
        super(listenable: animation);

  final PageController _textPageController;
  final ValueNotifier<double> _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final animation = listenable as Animation<double>;
    final slideAnimation = (animation.value / 0.7).clamp(0.0, 1.0);
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: isTablet
          ? (screenHeight * 0.085) * slideAnimation
          : (screenHeight * 0.11) * slideAnimation,
      height: screenHeight / 4.5,
      child: PageView.builder(
        controller: _textPageController,
        itemCount: CoffeeServices.coffees.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final coffee = CoffeeServices.coffees[index];
          return ValueListenableBuilder(
            valueListenable: _pageListener,
            builder: (_, value, child) {
              final percent = _pageListener.value - index;
              final opacity = (percent / 0.5).clamp(0.0, 1.0);
              return Opacity(
                opacity: 1 - opacity,
                child: child,
              );
            },
            child: Column(
              children: [
                // Coffee name
                Hero(
                  tag: 'text${coffee.name}',
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: CoffeeHeaderName(coffeeName: coffee.name),
                  ),
                ),
                // space
                const SizedBox(height: 10.0),
                // Coffee Price
                CoffeeHeaderPrice(price: coffee.price[CoffeeSize.mediam]!),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CoffeesVerticalPageView extends StatelessWidget {
  const _CoffeesVerticalPageView({
    required PageController coffeePageController,
    required PageController textPageController,
    required ValueNotifier<double> pageListener,
  })  : _coffeePageController = coffeePageController,
        _textPageController = textPageController,
        _pageListener = pageListener;

  final PageController _coffeePageController;
  final PageController _textPageController;
  final ValueNotifier<double> _pageListener;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isTablet = Responsive.isTablet(context);
    return Transform.scale(
      alignment: Alignment.bottomCenter,
      scale: isTablet ? 1.85 : 1.6,
      child: PageView.builder(
        controller: _coffeePageController,
        scrollDirection: Axis.vertical,
        itemCount: CoffeeServices.coffees.length + 1,
        onPageChanged: (value) {
          _textPageController.animateToPage(
            value,
            duration: _duration,
            curve: const ElasticOutCurve(0.8),
          );
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox.shrink();
          }
          final coffee = CoffeeServices.coffees[index - 1];
          return ValueListenableBuilder<double>(
            valueListenable: _pageListener,
            builder: (_, value, child) {
              final percent = value - index;
              final animation = -0.4 * percent + 0.6;
              final fraction = animation.clamp(0.0, 1.0);
              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(0.0, screenHeight / 2.4 * (1 - fraction))
                  ..scale(fraction),
                child: Opacity(opacity: fraction, child: child!),
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (_, animation, __, child) =>
                            FadeTransition(opacity: animation, child: child),
                    pageBuilder: (_, animation, __) =>
                        CoffeeDetailsPage(animtion: animation, coffee: coffee),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: kBottomNavigationBarHeight * 0.5,
                ),
                child: Material(
                  type: MaterialType.transparency,
                  child: Hero(
                    tag: coffee.name,
                    child: Image.asset(coffee.image, fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
