import 'package:flutter/material.dart';
import 'package:sample_list/models/restaurant.dart';

///Show restarunt information such as closing and opening time,
///phone number , email and location.
class InfoTile extends StatelessWidget {
  InfoTile({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: Colors.black,
      child: ListTile(
        title: Text(
          'Opening Hours',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        subtitle: Text('${restaurant.openingTime} - ${restaurant.closingTime}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone),
            SizedBox(width: 3.0),
            Icon(Icons.mail),
            SizedBox(width: 3.0),
            Icon(Icons.location_on)
          ],
        ),
      ),
    );
  }
}
