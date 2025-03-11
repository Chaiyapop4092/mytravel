import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/constants/colors.dart';  // Ensure you have the correct color constants imported
import 'package:mytravel/screens/sign_in_screen.dart';
import 'package:mytravel/widgets/mybutton.dart';
import 'package:mytravel/widgets/mytextfield.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final repwdController = TextEditingController();

  signUpWithEmailAndPassword() async {
    if (pwdController.text != repwdController.text) {
      // Show error if passwords don't match
      print('Passwords do not match');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: pwdController.text,
      );

      // After successful sign up, navigate to SignInPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignInPage()),
      );
      
    } on FirebaseAuthException catch (e) {
      print(e.message);  // Optionally show the error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //backgroundColor: primaryColors, // Background color from constants
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Form(
          child: Column(
            children: [
              //1
              Text(
                'Welcome to our community.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  color: primaryColors,  // Text color from constants
                ),
              ),
              //2
              const SizedBox(
                height: 20,
              ),
              Text(
                '\nTo get started, please provide your information and create an account.\n',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: primaryColors,  // Text color from constants
                ),
              ),
              //3
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter your name.',
                obscureText: false,
              ),
              //4
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email.',
                obscureText: false,
              ),
              //5
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: pwdController,
                labelText: 'Password',
                hintText: 'Enter your password.',
                obscureText: true,
              ),
              //6
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: repwdController,
                labelText: 'Re-password',
                hintText: 'Enter your password again.',
                obscureText: true,
              ),
              //7
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  signUpWithEmailAndPassword();
                },
                labelText: 'Sign up',
              ),
              //8
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have a member?',
                    style: GoogleFonts.poppins(color: primaryColors), // Primary color for text
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign In.',
                      style: GoogleFonts.poppins(
                        color: primaryColors,  // Using primary color for button text
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
