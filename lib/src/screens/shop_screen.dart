import 'package:flutter/material.dart';

class Consumable {
  final String image; // Path to the image asset
  final String name;
  final String description;
  final int price;
  bool sold;

  Consumable(this.image, this.name, this.description, this.price, this.sold);
}

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int numberOfCoins = 5; // Initial number of coins

  final List<Consumable> items = [
    Consumable('assets/images/cat.jpg', 'Catoo', 'Fluffy, playful, adorable', 3, false),
    Consumable('assets/images/dog.jpg', 'Cooper',
        'Loyal, friendly, affectionate', 5, false),
    Consumable(
        'assets/images/tortoise.jpg', 'Cookie', 'Slow, resilient, wise', 2, false),
  ];

  void buyItem(int index) {
    if (!items[index].sold && numberOfCoins >= items[index].price) {
      setState(() {
        items[index].sold = true;
        numberOfCoins -= items[index].price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.monetization_on, size: 24.0),
                  SizedBox(width: 8.0),
                  Text(
                    '$numberOfCoins', // Dynamic number of coins
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => buyItem(index),
                      child: ConsumableItem(item: items[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsumableItem extends StatelessWidget {
  final Consumable item;

  const ConsumableItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            item.image,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  item.description,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          if (item.sold)
            Text(
              'Sold',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
              ),
            )
          else
            Text(
              '\$${item.price.toString()}',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
