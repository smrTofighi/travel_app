import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_app/constant.dart';
import 'package:travel_app/controllers/likeController.dart';
import 'package:travel_app/models/TravelModel.dart';
import 'package:expandable_text/expandable_text.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double imageSize = 55;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height / 1.8,
                child: Stack(
                  children: [
                    //? Cover ------------------
                    Container(
                      width: double.infinity,
                      height: size.height / 2.1,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60.0),
                          bottomRight: Radius.circular(60.0),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              travelList[_selectedIndex].image,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    //? AppBar -----------------
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kBackIconColor),
                              child: IconButton(
                                onPressed: () {
                                  //SystemNavigator.pop();
                                  exit(0);
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kBackIconColor),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    travelList[_selectedIndex].like =
                                        !travelList[_selectedIndex].like;
                                  });
                                },
                                icon: travelList[_selectedIndex].like
                                    ? const Icon(
                                        CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                      )
                                    : const Icon(CupertinoIcons.heart),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //? ImagesList -------------
                    Positioned(
                      right: 0,
                      top: 95,
                      child: SizedBox(
                        width: 90.0,
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return imageItem(index);
                          },
                          itemCount: travelList.length,
                        ),
                      ),
                    ),
                    //? Text & Locations -------
                    Positioned(
                      bottom: 80,
                      left: size.width / 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelList[_selectedIndex].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              Text(
                                travelList[_selectedIndex].location,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Distance',
                                ),
                                Text(
                                  travelList[_selectedIndex].distance + " KM",
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Temp'),
                                Text(
                                  travelList[_selectedIndex].temp + "° C",
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 85,
                            height: 85,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text('Rating'),
                                Text(
                                  travelList[_selectedIndex].rating,
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Discreption',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          ExpandableText(
                            travelList[_selectedIndex].discription,
                            expandText: "Read More",
                            collapseText: "Collapse",
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total Price",
                                  ),
                                  Text(
                                    travelList[_selectedIndex]
                                            .price
                                            .toString() +
                                        "\$",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                              Container(
                                width: 75,
                                height: 75,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black),
                                child: const Icon(CupertinoIcons.arrow_right,
                                    color: Colors.white, size: 35),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedIndex == index ? Colors.yellow : Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(
                      travelList[index].image,
                    ),
                    fit: BoxFit.fill),
              ),
              width: _selectedIndex == index ? imageSize + 15 : imageSize,
              height: _selectedIndex == index ? imageSize + 15 : imageSize,
              duration: const Duration(
                milliseconds: 500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
