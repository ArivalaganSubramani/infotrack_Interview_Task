import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login_Screen.dart';

class IntroScreen extends StatelessWidget {
  final List<PageViewModel> pages = <PageViewModel>[
    PageViewModel(
      title: "Welcome",
      body: "This is the first screen",
      image: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset("assets/intro1.jpg"),
      ),
    ),
    PageViewModel(
      title: "Get Started",
      body: "This is the second screen",
      image: Center(
        child: Image.asset("assets/intro2.jpg"),
      ),

      // decoration: const PageDecoration(pageColor: Colors.blue)
    ),
    PageViewModel(
      title: "Ready to Go",
      body: "This is the third screen",
      image: Container(
        height: 500,
        width: 500,
        child: Image.asset(
          "assets/intro3.jpg",
          fit: BoxFit.cover, // This ensures that the image covers the entire container
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      onDone: () {
        // Handle what to do when the user taps "Done"
        // For example, navigate to the main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      onSkip: () {
        // Handle what to do when the user taps "Skip"
        // For example, navigate to the main screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done"),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.blue,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

