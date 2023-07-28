import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_items.dart';
import '../view_models/cart_model.dart';
import 'cart_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffb4ade1),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // greeting text
              Row(
                children: [
                  const Icon(
                    Icons.sunny,
                    color: Color(0xffffaa4a),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text("Good Morning !",
                      style: GoogleFonts.getFont("Lato", fontSize: 20)),
                ],
              ),
              //lets order fresh item
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text("Let's order fresh items for you. !",
                    style: GoogleFonts.getFont(
                      "Lato",
                      fontSize: 30,
                    )),
              ),
              //divider
              const Divider(
                thickness: 2,
                color: Color(0xffb4ade1),
              ),
              //fresh item + grid
              Text("Fresh Items",
                  style: GoogleFonts.getFont("Lato", fontSize: 20)),

              Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        itemCount: value.shopItem.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                        itemBuilder: (context, index) {
                          return GroceryItems(
                            itemName: value.shopItem[index][0],
                            itemPrice: value.shopItem[index][1],
                            imagePath: value.shopItem[index][2],
                            color: value.shopItem[index][3],
                            onPressed: (){
                              Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                            },
                          );
                        }),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
