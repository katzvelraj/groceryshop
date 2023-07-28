import 'package:flutter/material.dart';

class GroceryItems extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

   GroceryItems({super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color[100],
            //color: Color(0xa3b4ade1),
          borderRadius: BorderRadius.circular(10.0)

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // imagepath
            Image.asset(imagePath,height: 80,),
            // item name
            Text(itemName),

            //Button
            MaterialButton(onPressed: onPressed,
            color: color[800],
              child: Text("\$ $itemPrice",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
