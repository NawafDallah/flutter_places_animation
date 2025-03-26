import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 60.0,
      padding: const EdgeInsets.all(12.0),
      title: const Text(
        "Nawaf Dallah",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      onTap: () {},
      subtitle: const Text("Apple Account, iCloud, and more"),
      leading: Container(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.05, 1.0],
            colors: [
              Colors.grey.shade600,
              Colors.grey.shade900,
            ],
          ),
        ),
        child: const Text(
          "ND",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 26.0,
          ),
        ),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}
