import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          //row5 top destinations
          Row(
            children: [
              Text("Top Destinations",style: TextStyle(fontSize: 25, color: primaryColors,fontWeight: FontWeight.w600),),
              Spacer(),
              Icon(Icons.tune,size: 25,color: primaryColors,),
            ],
          ),
          



        ],
      ),
    );
  }
}