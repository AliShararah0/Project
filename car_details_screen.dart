import 'package:flutter/material.dart';
import 'main.dart'; 
import 'purchase_success_screen.dart'; 

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  CarDetailsScreen({required this.car});

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  bool includeAdditionalCost = false;

  @override
  Widget build(BuildContext context) {
    double totalPrice = includeAdditionalCost ? widget.car.price + 2000 : widget.car.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.car.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: includeAdditionalCost,
                  onChanged: (value) {
                    setState(() {
                      includeAdditionalCost = value ?? false;
                    });
                  },
                ),
                Text('To Get 1 year insurance please press the checkbox. Its costs \$2000'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToPurchaseSuccessScreen(context);
              },
              child: Text('Buy'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPurchaseSuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchaseSuccessScreen(),
      ),
    );
  }
}