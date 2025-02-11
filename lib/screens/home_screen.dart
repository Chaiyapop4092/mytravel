//import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/icon_tab.dart';
import 'package:mytravel/widgets/profile.dart';
import 'package:mytravel/widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //row 1 - profile image and name
              const ProfileWidget(),

              //row 2
              const SizedBox(height: 15,),
              Text('Point of Interest',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: primaryColors, fontWeight: FontWeight.bold,
              ),),

              //row 3 = textfromfield
              const SizedBox(height: 15,),
              const SearchingBar(),

              //row 4 
              const SizedBox(height: 20,),

              const IconTab(),

              
              //row5 top destinations
              const SizedBox(height: 20,),
              const Row(
                children: [
                  Text("Top Destinations",style: TextStyle(fontSize: 25, color: primaryColors,fontWeight: FontWeight.w600),),
                  Spacer(),
                  Icon(Icons.tune,size: 25,color: primaryColors,),
                ],
              ),
        
              const SizedBox(height: 20,),
              
              
            
            //row6 display images
            GridView.count(crossAxisCount: 2,scrollDirection: Axis.vertical,shrinkWrap:true,childAspectRatio: 0.75, crossAxisSpacing:24,mainAxisSpacing: 24,children: List.generate(destinations.length, (index) {
              var e = destinations[index];
        
              return AnimationConfiguration.staggeredGrid(position: index, columnCount: 2, child: SlideAnimation(
                child: FadeInAnimation(
                  child: DestinationWidget(
                    name: e.name,image: e.image,rate: e.rate,location: e.location,)),));
            })),
          
          
            ],
          ),
        ),
      ),
    );
  }
}



