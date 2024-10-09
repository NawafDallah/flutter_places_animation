import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget/card_places_list.dart';
import 'widget/travel_navigation_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title:
            const Text("Feed", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: const Icon(CupertinoIcons.search),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.star),
          ),
        ],
      ),
      body: const CardPlacesList(),
      bottomNavigationBar: TravelNavigationBar(
        onTap: (value) {},
        items: [
          BottomTravelNavigationBar(
            icon: CupertinoIcons.chat_bubble,
            selectedIcon: CupertinoIcons.chat_bubble_fill,
          ),
          BottomTravelNavigationBar(
            icon: CupertinoIcons.square_split_2x2,
            selectedIcon: CupertinoIcons.square_split_2x2_fill,
          )
        ],
        currentIndex: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurple.shade800,
        foregroundColor: Colors.white,
        child: const Icon(Icons.location_on_rounded),
      ),
    );
  }
}

