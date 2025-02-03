import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';

class SnapScrollDemo extends StatefulWidget {
  const SnapScrollDemo({super.key});

  @override
  State<SnapScrollDemo> createState() => _SnapScrollDemoState();
}

class _SnapScrollDemoState extends State<SnapScrollDemo> {
  late final ScrollController _scrollController;
  late final ValueNotifier _scrollListener = ValueNotifier<double>(0.0);

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

  List<Snap> getSnaps() {
    return [Snap.avoidZone(0.0, 52.0), Snap.avoidZone(52.0, 104.0)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: _scrollController,
        physics: SnapScrollPhysics.builder(
          getSnaps,
          parent: const BouncingScrollPhysics(),
        ),
        slivers: [
          MyAppBar(scrollListener: _scrollListener),
          const SearchHeader(),
          const _MySlivers(),
          // header of the home page -->
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required ValueNotifier scrollListener,
  }) : _scrollListener = scrollListener;

  final ValueNotifier _scrollListener;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: const Text('Sittengs'),
      stretch: true,
      trailing: ValueListenableBuilder(
        valueListenable: _scrollListener,
        builder: (_, value, child) {
          final double percent = value / 104;
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: percent >= 1.0 ? 1.0 : 0.0,
            child: child,
          );
        },
        child: const Icon(
          CupertinoIcons.search,
          size: 24.0,
        ),
      ),
    );
  }
}

class _MySlivers extends StatelessWidget {
  const _MySlivers();

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(slivers: [
      HorizontalArray(),
      GridHomePage(),
      HorizontalPageView(),
    ]);
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 52.0,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, right: 10.0, left: 10.0),
          child: CupertinoSearchTextField(
            prefixIcon: FittedBox(child: Icon(CupertinoIcons.search)),
          ),
        ),
      ),
    );
  }
}

class HorizontalArray extends StatelessWidget {
  const HorizontalArray({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemExtent: 150,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: const SizedBox.square(
              child: ColoredBox(color: Colors.lightGreenAccent),
            ),
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}

class GridHomePage extends StatelessWidget {
  const GridHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(12.0),
      sliver: SliverAnimatedGrid(
        initialItemCount: 52,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index, animtion) => SizedBox.square(
          dimension: 50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: ColoredBox(
              color: Colors.black.withBlue(index % 254),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalPageView extends StatelessWidget {
  const HorizontalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: const SizedBox.square(
                child: ColoredBox(color: Colors.lightGreenAccent),
              ),
            ),
          ),
          itemCount: 8,
        ),
      ),
    );
  }
}
