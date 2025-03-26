import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/ios_animation/widget/ios_box_icon.dart';

class AirPlaneListTile extends StatelessWidget {
  const AirPlaneListTile({
    super.key,
    required ValueNotifier<bool> switchListener,
  }) : _switchListener = switchListener;

  final ValueNotifier<bool> _switchListener;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Airplane Mode"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.airplane,
        color: Color.fromARGB(255, 254, 148, 2),
      ),
      trailing: ValueListenableBuilder(
        valueListenable: _switchListener,
        builder: (_, value, __) => CupertinoSwitch(
          value: value,
          onChanged: (value) => _switchListener.value = value,
        ),
      ),
    );
  }
}

class WifiListTile extends StatelessWidget {
  const WifiListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Wi-Fi"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.wifi,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      additionalInfo: Text(
        "stc_wifi_2024_5G",
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class BluetoothListTile extends StatelessWidget {
  const BluetoothListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Bluetooth"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.bluetooth,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      additionalInfo: Text(
        "On",
        style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class CellularListTile extends StatelessWidget {
  const CellularListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Cellular"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.antenna_radiowaves_left_right,
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

class HotspotListTile extends StatelessWidget {
  const HotspotListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Personal Hotspot"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.personalhotspot,
        color: Color.fromARGB(255, 73, 217, 101),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class BatteryListTile extends StatelessWidget {
  const BatteryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("Battery"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.battery_full,
        color: Color.fromARGB(255, 73, 217, 101),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}

class VpnListTile extends StatelessWidget {
  const VpnListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: 33.0,
      title: const Text("VPN"),
      onTap: () {},
      leading: const IosBoxIcon(
        icon: CupertinoIcons.waveform_circle_fill,
        color: Color.fromARGB(255, 1, 122, 254),
      ),
      additionalInfo: Text(
        "Not Connected",
        style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.white.withValues(alpha: 0.75),
        size: 18.0,
      ),
    );
  }
}
