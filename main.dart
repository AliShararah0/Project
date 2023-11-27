import 'package:flutter/material.dart';
import 'car_details_screen.dart'; 

void main() {
  runApp( CarCatalogApp());
}

class CarCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Catalog',
      home: CarCatalogScreen(),
    );
  }
}

class Car {
  final String name;
  final String image;
  final double price;
  final String description;

  Car({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

class CarCatalogScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
      name: 'BMW e90',
      image: 'assets/bmw.jpeg',
      price: 7000,
      description: '4-door sedan/saloon (E90) 5-door wagon/estate (E91) 2-door coupé (E92) 2-door convertible (E93)',
    ),
    Car(
      name: 'Mercedes G CLASS',
      image: 'assets/gclass.png',
      price: 40000,
      description: 'The Mercedes-Benz G-Class, sometimes colloquiallyا called the G-Wagen (as an abbreviation of Geländewagen) is a four-wheel drive automobile manufactured by Magna Steyr (formerly Steyr-Daimler-Puch) in Austria and sold by Mercedes-Benz.',
    ),
    Car(
      name: 'Toyota',
      image: 'assets/toyota.jpg',
      price: 14000,
      description: 'Structurally, the FJ Cruiser incorporates a body on frame truck style design similar, but not identical to that of the two-door Prado platform. The FJ Cruiser uses a high-mounted, double wishbone front suspension and stabilizer bar, and a 4-link rear suspension with lateral rod with coil springs and stabilizer bar.',
    ),
    Car(
      name: 'Hyundai',
      image: 'assets/hyundai.jpg',
      price: 5500,
      description: 'The Hyundai i10 has 2 Petrol Engine and 1 LPG Engine on offer. The Petrol engine is 1086 cc and 1197 cc while the LPG engine is 1086 cc . It is available with Manual & Automatic transmission. Depending upon the variant and fuel type the i10 has a mileage of 16.95 to 20.36 kmpl & Ground clearance of i10 is 165mm.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Catalog'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cars[index].name),
            subtitle: Text('\$${cars[index].price.toStringAsFixed(2)}'),
            leading: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                cars[index].image,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailsScreen(car: cars[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}