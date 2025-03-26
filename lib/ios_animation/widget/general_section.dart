import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ios_box_icon.dart';

class GeneralListTile extends StatelessWidget {
  const GeneralListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("General"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.settings,
        color: Color.fromARGB(255, 142, 141, 146),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class AccessibilityListTile extends StatelessWidget {
  const AccessibilityListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Accessibility"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.person_alt_circle_fill,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class CameraListTile extends StatelessWidget {
  const CameraListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Camera"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.camera_fill,
        color: Color.fromARGB(255, 142, 141, 146),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class ControlCenterListTile extends StatelessWidget {
  const ControlCenterListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Control Center"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.game_controller_solid,
        color: Color.fromARGB(255, 142, 141, 146),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class BrightnessListTile extends StatelessWidget {
  const BrightnessListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Display & Brightness"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.brightness_solid,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class HomeScreenListTile extends StatelessWidget {
  const HomeScreenListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Home Screen & App Library"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.calendar,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class SearchListTile extends StatelessWidget {
  const SearchListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Search"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.search,
        color: Color.fromARGB(255, 142, 141, 146),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class WallpaperListTile extends StatelessWidget {
  const WallpaperListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Wallpaper"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: Icons.wallpaper,
        color: Color.fromARGB(255, 50, 170, 254),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}
