import 'package:sample_list/models/food_item.dart';

///Containt the detail about the restaurant. phone number
///can be added later.
class Restaurant {
  final String title;
  final String location;
  final String type;
  final String image;
  final String openingTime;
  final String closingTime;

  List<FoodItem> foodItems;
  Restaurant(
      {required this.title,
      required this.location,
      required this.type,
      required this.foodItems,
      required this.image,
      required this.closingTime,
      required this.openingTime});
}
