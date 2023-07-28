import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryshop/view_models/cart_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('My Cart',
                    style: GoogleFonts.getFont(
                      "Lato",
                      fontSize: 25.0,
                    )),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItem.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItem[index][2],
                                height: 40,
                              ),
                              title: Text(value.cartItem[index][0]),
                              subtitle: Text('\$ ${value.cartItem[index][1]}'),
                              trailing: IconButton(
                                  onPressed: () {
                                    Provider.of<CartModel>(context,
                                            listen: false)
                                        .removeItemToCart(index);
                                  },
                                  icon: const Icon(Icons.cancel)),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffb4ade1),
                    borderRadius: BorderRadius.circular(10.0)
                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total Price: ",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                          ),),
                          const SizedBox(height: 10.0,),
                          Text("\$ ${value.calculatePrice()}",style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      //Pay now Button
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: const Row(
                          children: [
                            Text("Pay Now",style: TextStyle(fontSize: 18),),
                            SizedBox(width: 5,),
                            Icon(Icons.arrow_forward_ios,size: 15,)
                          ],
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
