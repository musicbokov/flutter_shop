import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      this.name,
      this.rate,
      this.image,
      this.cost,
      {Key? key}) : super(key: key);

  final String name;
  final String rate;
  final String image;
  final double cost;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(name),
          Icon(Icons.star, color: Colors.amber,),
          Text(rate)
        ],
      ),
      leading: Image(
        image: AssetImage(image),
      ),
      trailing: Icon(Icons.shopping_cart_outlined),
      subtitle: Text('$cost P', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
