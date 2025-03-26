import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ios_box_icon.dart';

class AppsListTile extends StatelessWidget {
  const AppsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Apps"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: Icons.apps,
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