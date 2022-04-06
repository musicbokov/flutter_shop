import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      this.name,
      this.estimate,
      this.image,
      this.price,
      {Key? key}) : super(key: key);

  final String name;
  final String estimate;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(name),
          Icon(Icons.star, color: Colors.amber,),
          Text(estimate)
        ],
      ),
      leading: Image(
        image: AssetImage(image),
      ),
      trailing: Icon(Icons.shopping_cart_outlined),
      subtitle: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
