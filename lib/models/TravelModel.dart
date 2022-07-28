import 'package:travel_app/constant.dart';

class TravelModel {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String discription;
  int price;
  bool like;

  TravelModel({
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.discription,
    required this.price,
    required this.like,
  });
}

List<TravelModel> travelList = [
  TravelModel(
    name: 'Qom',
    location: 'Qom - Iran',
    image: aQom,
    distance: '820',
    temp: '22',
    rating: '10',
    discription: dQom,
    price: 30,
    like: false
  ),
    TravelModel(
    name: 'Yasuj',
    location: 'Yasuj - Iran',
    image: aYasuj,
    distance: '150',
    temp: '20',
    rating: '8.5',
    discription: dYasuj,
    price: 35,
    like: false
  ),
    TravelModel(
    name: 'Gilan',
    location: 'Gilan - Iran',
    image: aGilan,
    distance: '1127',
    temp: '14',
    rating: '8',
    discription: dGilan,
    price: 45,
    like: false
  ),
    TravelModel(
    name: 'Bandar Abbas',
    location: 'Bandar Abbas - Iran',
    image: aBandar,
    distance: '600',
    temp: '35',
    rating: '4.5',
    discription: dBandar,
    price: 66,
    like: false
  ),
  
];
