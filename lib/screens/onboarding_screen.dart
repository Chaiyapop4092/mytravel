import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "เวลคัม",
              body: "สำรวจแอปสุดอเมซิ่ง.",
              image: buildImage('assets/images/onboarding1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "เนวิเกชั่นแบบง่ายๆ",
              body: "เนวิเกตแบบง่ายๆและมีประสิทธิภาพ.",
              image: buildImage('assets/images/onboarding2.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "เริ่มต้วน",
              body: "สมัครเลย แล้วใช้แอปซะ",
              image: buildImage('assets/images/onboarding3.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () => goToHome(context),
                child: Text("เริ่มเลอ"),
              ),
            ),
          ],
          done: Text("ยังไม่เสร็จ", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text("อย่ากดข้ามนะ"),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  void goToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('ON BOARDING', false);

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
