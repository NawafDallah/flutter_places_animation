import 'package:flutter/material.dart';

import '../details_place.dart';
import '../models/travel_place_model.dart';
import 'card_place.dart';

class CardPlacesList extends StatelessWidget {
  const CardPlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: kBottomNavigationBarHeight + 20,
        ),
        physics: const BouncingScrollPhysics(),
        itemExtent: 350,
        itemCount: TravelPlace.places.length,
        itemBuilder: (context, index) {
          final place = TravelPlace.places[index];
          return Hero(
            tag: place.id,
            child: Material(
              child: CardPlace(
                place: place,
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: DetailsPlacePage(
                            place: place,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ));
                },
              ),
            ),
          );
        });
  }
}
