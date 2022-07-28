import 'package:flutter/material.dart';
import 'package:travel_app/screens/homeScreen.dart';


void main(){
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    );
  }
}