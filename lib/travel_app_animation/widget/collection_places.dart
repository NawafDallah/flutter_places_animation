import 'package:flutter/material.dart';

import '../details_place.dart';

class CollectionPlaces extends StatelessWidget {
  const CollectionPlaces({
    super.key,
    required this.widget,
  });

  final DetailsPlacePage widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemExtent: 150,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: widget.place.imagesUrl.length,
      itemBuilder: (context, index) {
        final image = widget.place.imagesUrl[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
