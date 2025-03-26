import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ios_box_icon.dart';

class NotificationsListTile extends StatelessWidget {
  const NotificationsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Notifications"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.bell_solid,
        color: Color.fromARGB(255, 255, 59, 45),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class SoundsListTile extends StatelessWidget {
  const SoundsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Sounds & Haptics"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.headphones,
        color: Color.fromARGB(255, 249, 50, 86),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class FocusListTile extends StatelessWidget {
  const FocusListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Focus"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.moon_fill,
        color: Color.fromARGB(255, 88, 85, 180),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class ScreenTimeListTile extends StatelessWidget {
  const ScreenTimeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Screen Time"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.timer_fill,
        color: Color.fromARGB(255, 88, 85, 180),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}
