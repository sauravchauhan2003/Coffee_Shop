import 'package:coffeeshop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Center(
                  child: Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: ListView.builder(
                itemCount: value.usercart.length,
                itemBuilder: (context, index) {
                  Coffee coffee = value.usercart[index];
                  return ListTile(
                      title: Text(coffee.name),
                      subtitle: Text(coffee.price),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removefromcart(coffee)));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  removefromcart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeitemfromcart(coffee);
  }
}
