import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/apps_section.dart';
import 'widget/general_section.dart';
import 'widget/notifications_section.dart';
import 'widget/privicy_section.dart';
import 'widget/profile_section.dart';
import 'widget/telecommunications_section.dart';

class SnapScrollDemo extends StatefulWidget {
  const SnapScrollDemo({super.key});

  @override
  State<SnapScrollDemo> createState() => _SnapScrollDemoState();
}

class _SnapScrollDemoState extends State<SnapScrollDemo> {
  late final ScrollController _scrollController;
  late final ValueNotifier _scrollListener = ValueNotifier<double>(0.0);
  late final ValueNotifier<bool> _switchListener = ValueNotifier(false);

  void _listenToScroll() => _scrollListener.value = _scrollController.offset;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_listenToScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_listenToScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: CupertinoScrollbar(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ios header
            const _IosHeader(),
            // contenet list
            _ListOfSections(switchListener: _switchListener),
          ],
        ),
      ),
    );
  }
}

class _IosHeader extends StatelessWidget {
  const _IosHeader();

  @override
  Widget build(BuildContext context) {
    return const CupertinoSliverNavigationBar(
      largeTitle: Text('Settings'),
      stretch: true,
      enableBackgroundFilterBlur: true,
      transitionBetweenRoutes: true,
      bottom: PreferredSize(
        preferredSize: Size(0.0, kToolbarHeight / 1.35),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: CupertinoSearchTextField(
            suffixMode: OverlayVisibilityMode.always,
            suffixIcon: Icon(
              CupertinoIcons.mic_fill,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      ),
    );
  }
}

class _ListOfSections extends StatelessWidget {
  const _ListOfSections({
    required ValueNotifier<bool> switchListener,
  }) : _switchListener = switchListener;

  final ValueNotifier<bool> _switchListener;

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        //
        const _ProfileSection(),
        // first section, it is all aboute telecommunications...
        _TelecommunicationsSection(switchListener: _switchListener),
        // second section, it is all aboute general settings...
        const _GeneralSection(),
        // third section, it is all aboute general notifications...
        const _NotificationSection(),
        // forth section, it is all aboute general privicy...
        const _PrivicySection(),
        // fifth section, it is all aboute apps settings...
        const _AppsSection(),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        ProfileListTile(),
      ],
    );
  }
}

class _TelecommunicationsSection extends StatelessWidget {
  const _TelecommunicationsSection({
    required ValueNotifier<bool> switchListener,
  }) : _switchListener = switchListener;

  final ValueNotifier<bool> _switchListener;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: [
        AirPlaneListTile(switchListener: _switchListener),
        const WifiListTile(),
        const BluetoothListTile(),
        const CellularListTile(),
        const HotspotListTile(),
        const BatteryListTile(),
        const VpnListTile(),
      ],
    );
  }
}

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        GeneralListTile(),
        AccessibilityListTile(),
        CameraListTile(),
        ControlCenterListTile(),
        BrightnessListTile(),
        HomeScreenListTile(),
        SearchListTile(),
        WallpaperListTile(),
      ],
    );
  }
}

class _NotificationSection extends StatelessWidget {
  const _NotificationSection();

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        NotificationsListTile(),
        SoundsListTile(),
        FocusListTile(),
        ScreenTimeListTile(),
      ],
    );
  }
}

class _PrivicySection extends StatelessWidget {
  const _PrivicySection();

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        FaceIDListTile(),
        EmergencyListTile(),
        PrivacyListTile(),
      ],
    );
  }
}

class _AppsSection extends StatelessWidget {
  const _AppsSection();

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: const [
        AppsListTile(),
      ],
    );
  }
}
