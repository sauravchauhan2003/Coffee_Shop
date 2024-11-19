import 'package:coffeeshop/models/coffee.dart';
import 'package:coffeeshop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addtocart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).additemtocart(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added to cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachcoffee = value.coffeeShop[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.only(bottom: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      child: ListTile(
                        title: Text(eachcoffee.name),
                        subtitle: Text(eachcoffee.price),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => addtocart(eachcoffee),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
