import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';
import 'color_cards.dart';
import 'scroll_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollingController = ScrollController();
  bool isScrollingDown = true;

  @override
  void initState() {
    scrollingController = ScrollController();
    scrollingController.addListener(() {
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
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollingController.dispose();
    super.dispose();
  }

  scrollTo(BuildContext context, int i) => scrollingController.animateTo(
        i == 0
            ? 0.0
            : i == 1
                ? MediaQuery.of(context).size.height * .5
                : i == 2
                    ? MediaQuery.of(context).size.height * 1
                    : i == 3
                        ? MediaQuery.of(context).size.height * 1.5
                        : i == 4
                            ? MediaQuery.of(context).size.height * 2
                            : i == 5
                                ? MediaQuery.of(context).size.height * 2.5
                                : i == 6
                                    ? MediaQuery.of(context).size.height * 3
                                    : MediaQuery.of(context).size.height * 3.5,
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CustomScrollView(
        controller: scrollingController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            elevation: 1,
            floating: true,
            backgroundColor: white,
            flexibleSpace: FlexibleSpaceBar(
              //  centerTitle: true,
              expandedTitleScale: 1,
              background: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (builder, x) => _sectionCards[x],
              childCount: _sectionCards.length,
            ),
          ),
        ],
      ),
    );
  }

  static const List<Widget> _sectionCards = [
    ColorCards(
      color: color1,
      label: '1',
    ),
    ColorCards(
      color: color2,
      label: '2',
    ),
    ColorCards(
      color: color3,
      label: '3',
    ),
    ColorCards(
      color: color4,
      label: '4',
    ),
    ColorCards(
      color: color5,
      label: '5',
    ),
    ColorCards(
      color: color6,
      label: '6',
    ),
    ColorCards(
      color: color7,
      label: '7',
    ),
    ColorCards(
      color: color8,
      label: '8',
    ),
    ColorCards(
      color: color9,
      label: '9',
    ),
  ];
}
