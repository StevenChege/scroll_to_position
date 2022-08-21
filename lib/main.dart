import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll to position',
      home: Home(),
    );
  }
}



//? add our ScrollController
//? add a boolean variable
//? add listener to scrollcontroller, if user is scrolling up, we'll set our isScrollingDown variable to true
//? if user is scrolling down, we'll set our isScrollingDown variable to false
//? function to determine the offset/pfosition to scroll to. call the
//? ScrollController's animateTo property which takes the context and the
//? scroll offset. we'll use if statements to etermine where to scroll depending
//? on the provided offset. if offset = 0, scrollposition will remain 0, if 1;
//? scroll to .5 of the screenheight, if 4; scroll to a position 2 times the
//? screenheight, ...
//? function to go to the botton of the screen/maxScrollExtent
//? use a CustomScrollView to enable our custom scrolling when coupled with
//? slivers. We'll pass to it our ScrollController
//? add row of buttons to our sliverappbar's flexibleSpacebar
//? button1 scrolls to top/offset0, button2 scrolls to offset
//? .5 of screen height, button4 scrolls to offset 1.5 of screen
//? height last button scrolls to bottom of screen
//? use a sliverlist to display our colorcards
//? list of color cards to populate screen and indicate scroll offsets

// https://github.com/StevenChege/scroll_to_position