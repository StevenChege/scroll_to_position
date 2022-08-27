import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'color_card.dart';
import 'constants.dart';
import 'scroll_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollingController = ScrollController();
  bool isScrollingDown = true;

  void _scrollListener() {
    if (scrollingController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
      }
    }
    if (scrollingController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
      }
    }
  }

  scrollTo(BuildContext context, int i) => scrollingController.animateTo(
        i == 0
            ? 0.0
            : i == 1
                ? MediaQuery.of(context).size.height * .5
                : i == 2
                    ? MediaQuery.of(context).size.height * .96 // 1
                    : i == 3
                        ? MediaQuery.of(context).size.height * 1.4 // 1.5
                        : i == 4
                            ? MediaQuery.of(context).size.height * 1.9 // 2
                            : i == 5
                                ? MediaQuery.of(context).size.height *
                                    2.39 // 2.5
                                : i == 6
                                    ? MediaQuery.of(context).size.height *
                                        2.85 // 3
                                    : MediaQuery.of(context).size.height *
                                        3.3, // 3.5,
        duration: scrollAnimationDuration,
        curve: scrollAnimationCurve,
      );

  goToTop() {
    scrollingController.animateTo(
      0.0,
      duration: scrollAnimationDuration,
      curve: scrollAnimationCurve,
    );
  }

  goToBottom() {
    scrollingController.animateTo(
      scrollingController.position.maxScrollExtent,
      duration: scrollAnimationDuration,
      curve: scrollAnimationCurve,
    );
  }

  @override
  void initState() {
    scrollingController = ScrollController();
    scrollingController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollingController.dispose();
    scrollingController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ScrollButton(
                label: '1',
                press: () => goToTop(),
              ),
              ScrollButton(
                label: '2',
                press: () => scrollTo(context, 1),
              ),
              ScrollButton(
                label: '3',
                press: () => scrollTo(context, 2),
              ),
              ScrollButton(
                label: '4',
                press: () => scrollTo(context, 3),
              ),
              ScrollButton(
                label: '5',
                press: () => scrollTo(context, 4),
              ),
              ScrollButton(
                label: '6',
                press: () => scrollTo(context, 5),
              ),
              ScrollButton(
                label: '7',
                press: () => scrollTo(context, 6),
              ),
              ScrollButton(
                label: '8',
                press: () => scrollTo(context, 7),
              ),
              ScrollButton(
                label: '9',
                press: () => goToBottom(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: white,
      body: CustomScrollView(
        controller: scrollingController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (builder, index) => _sectionCards[index],
              childCount: _sectionCards.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 300)),
        ],
      ),
    );
  }

  static const List<Widget> _sectionCards = [
    ColorCard(
      label: '1',
      color: color1,
    ),
    ColorCard(
      label: '2',
      color: color2,
    ),
    ColorCard(
      label: '3',
      color: color3,
    ),
    ColorCard(
      label: '4',
      color: color4,
    ),
    ColorCard(
      label: '5',
      color: color5,
    ),
    ColorCard(
      label: '6',
      color: color6,
    ),
    ColorCard(
      label: '7',
      color: color7,
    ),
    ColorCard(
      label: '8',
      color: color8,
    ),
    ColorCard(
      label: '9',
      color: color9,
    ),
  ];
}
