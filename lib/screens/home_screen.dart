//import 'dart:ffi';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/constants/colors.dart';
//import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/destination.dart';
import 'package:mytravel/widgets/icon_tab.dart';
import 'package:mytravel/widgets/profile.dart';
import 'package:mytravel/widgets/searchbar.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinationAPI = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      setState(() {
        destinationAPI = json.decode(response.body);
        isLoading = false;
        // print(destinationAPI);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

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
              const SizedBox(
                height: 15,
              ),
              Text(
                'Point of Interest',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: primaryColors,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              //row 3 = textfromfield
              const SizedBox(
                height: 15,
              ),
              const SearchingBar(),

              //row 4
              const SizedBox(
                height: 20,
              ),

              const IconTab(),

              //row5 top destinations
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Top Destinations",
                    style: TextStyle(
                        fontSize: 25,
                        color: primaryColors,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.tune,
                    size: 25,
                    color: primaryColors,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //row6 display images
              GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  children: List.generate(destinationAPI.length, (index) {
                    //var e = destinations[index];

                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        child: SlideAnimation(
                          child: FadeInAnimation(
                              child: DestinationWidget(
                            name: destinationAPI[index]['name'],
                            image: destinationAPI[index]['image'],
                            rate: destinationAPI[index]['rate'],
                            location: destinationAPI[index]['location'],
                          )),
                        ));
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
