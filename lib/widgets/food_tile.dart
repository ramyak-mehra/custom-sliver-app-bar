import 'package:flutter/material.dart';
import 'package:sample_list/models/food_item.dart';

class FoodItemTile extends StatelessWidget {
  final FoodItem foodItem;
  const FoodItemTile({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: foodItem.bestSeller
            ? Banner(
                color: Colors.green,
                message: 'BEST SELLER',
                textStyle: TextStyle(color: Colors.white, fontSize: 8),
                location: BannerLocation.topStart,
                child: Image.network(foodItem.image))
            : Image.network(foodItem.image),
      ),
      title: Text(
        foodItem.title,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
      ),
      isThreeLine: true,
      subtitle: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            foodItem.description,
            style: TextStyle(
                fontWeight: FontWeight.w300, color: Colors.black, fontSize: 12),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                '₹${foodItem.price - (foodItem.discount ?? 0)}',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '₹${foodItem.price}',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, fontSize: 12),
              ),
              SizedBox(width: 3),
              foodItem.discount != null
                  ? Text(
                      '${foodItem.discount}₹ off',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
      trailing: TextButton.icon(
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Theme.of(context).primaryColor)),
          ),
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Add')),
    );
  }
}
