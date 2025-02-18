import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/widgets/mytextfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final repwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text('Welcome to our community.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
              )),
          Text(
              '\nTo get started, please provide your info and create an account.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              )),
          SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: nameController,
              labelText: "Name",
              hintText: 'Enter your name',
              obscureText: false),
          SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: emailController,
              labelText: "Email",
              hintText: 'Enter your Email',
              obscureText: false),
          SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: pwdController,
              labelText: "Password",
              hintText: 'Enter your Password',
              obscureText: true),
          SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: repwdController,
              labelText: "Confirm Password",
              hintText: 'Enter your password again',
              obscureText: true),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
