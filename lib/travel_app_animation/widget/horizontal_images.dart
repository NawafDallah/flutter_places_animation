import 'dart:math';

import 'package:flutter/material.dart';

import '../models/travel_place_model.dart';

class HorizontalImages extends StatefulWidget {
  const HorizontalImages({super.key, required this.place});
  final TravelPlace place;

  @override
  State<HorizontalImages> createState() => _HorizontalImagesState();
}

class _HorizontalImagesState extends State<HorizontalImages> {
  late final PageController _pageController;
  late final ValueNotifier<double> _pagelistener;

  @override
  void initState() {
    _pagelistener = ValueNotifier<double>(0.0);
    _pageController = PageController(viewportFraction: 0.9)
      ..addListener(onListen);
    super.initState();
  }

  onListen() {
    _pagelistener.value = _pageController.page!;
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(onListen)
      ..dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: widget.place.imagesUrl.length,
            onPageChanged: (value) => setState(() {
              currentIndex = value;
            }),
            itemBuilder: (context, index) {
              final images = widget.place.imagesUrl[index];
              return ValueListenableBuilder(
                valueListenable: _pagelistener,
                builder: (_, value, __) {
                  final percent = (value - index).clamp(0.0, 1.0);
                  return Opacity(
                    opacity: 1 - percent,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..scale(1 - percent)
                        ..rotateY(pi * percent),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(images),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.place.imagesUrl.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 5.0),
              height: 3,
              width: currentIndex == index ? 30 : 15,
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
