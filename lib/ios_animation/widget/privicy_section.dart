import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ios_box_icon.dart';

class FaceIDListTile extends StatelessWidget {
  const FaceIDListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Face ID & Passworde"),
      
      onTap: () {},
      leading: const IosBoxIcon(
        icon: Icons.center_focus_weak_rounded,
        color: Color.fromARGB(255, 73, 217, 105),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class EmergencyListTile extends StatelessWidget {
  const EmergencyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Emergency SOS"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: Icons.sos,
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

class PrivacyListTile extends StatelessWidget {
  const PrivacyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Privacy & Security"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: Icons.front_hand_sharp,
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
