import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/home_screen.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome",
              body: "Explore the amazing features of our app.",
              image: buildImage('assets/images/onboarding1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Easy Navigation",
              body: "Navigate easily and efficiently.",
              image: buildImage('assets/images/onboarding2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Get Started",
              body: "Sign up and start using the app now.",
              image: buildImage('assets/images/onboarding3.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () => goToHome(context),
                child: Text("Start Now"),
              ),
            ),
          ],
          done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text("Skip"),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}
