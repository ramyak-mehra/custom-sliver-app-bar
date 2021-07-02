import 'package:flutter/material.dart';
import 'package:sample_list/widgets/custom_sliver_app_bar.dart';
import 'package:sample_list/widgets/food_tile.dart';
import 'package:sample_list/models/food_item.dart';
import 'package:sample_list/models/restaurant.dart';
import 'package:sample_list/widgets/info_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final Restaurant _restaurant = Restaurant(
      title: 'John Doe',
      type: 'Food',
      location: '2616 Carcinal Lane, Garfield Heights OH ,US',
      openingTime: '8:29 AM',
      closingTime: '8:29 AM',
      foodItems: [
        FoodItem(
            title: 'ProtienX',
            description: 'Demo Description about the product',
            price: 3000,
            discount: 1000,
            image:
                'https://static.toiimg.com/thumb/msid-66145888,imgsize-116131,width-400,resizemode-4/66145888.jpg',
            bestSeller: true)
      ],
      image:
          'https://media.istockphoto.com/photos/cozy-restaurant-for-gathering-with-friends-picture-id1159992039?k=6&m=1159992039&s=612x612&w=0&h=pDTW4WuDgsZL5wvMDmQF0STsON74d-ZhSR7EtMfksd8=');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: CustomSliverAppBar(
              restaurant: _restaurant,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            )),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return index == 0
                ? InfoTile(
                    restaurant: _restaurant,
                  )
                : FoodItemTile(
                    key: Key('$index foodItem'),
                    foodItem: _restaurant.foodItems.first,
                  );
          }, childCount: 20),
        )
      ],
    ));
  }
}
