///Food item details.

class FoodItem {
  final String title;
  final String description;
  final int price;
  final String image;
  final bool bestSeller;
  final int? discount;

  FoodItem(
      {required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.bestSeller,
      required this.image});
}
