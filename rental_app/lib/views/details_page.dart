import 'package:flutter/material.dart';
import '../models/house.dart';

class DetailsPage extends StatelessWidget {
  final House house;

  const DetailsPage({super.key, required this.house});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // -- HEADER OF THE DETAILS PAGE --
      appBar: AppBar(
        title: Text(house.residentalComplexName, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.orangeAccent,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      // -- BODY --
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Complex: ${house.residentalComplexName}", style: const TextStyle(fontSize: 18)),
            Text("City: ${house.city}"),
            Text("Area: ${house.area} "),
            Text("Price: ${house.price}KZT"),
          ],
        ),
      ),
    );
  }
}