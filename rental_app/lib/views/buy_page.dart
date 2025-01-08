import 'package:flutter/material.dart';
import '../models/house.dart'; // Adjust the path to where the House model is defined.

class BuyPage extends StatelessWidget {
  final House house;

  const BuyPage({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buy/Rent Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- House Details --
            Text(
              house.residentalComplexName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "City: ${house.city}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Area: ${house.area} sqm",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Height: ${house.height} m",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Year of Production: ${house.yearOfProduction}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Price: ${house.price.toStringAsFixed(2)} KZT",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // -- Buttons --
            ElevatedButton.icon(
              onPressed: () {
                // Add logic for contacting the owner
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Contact Owner"),
                    content: const Text("Owner's contact details are unavailable."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.phone),
              label: const Text("Contact Owner"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // Add logic for payment
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Payment"),
                    content: const Text("Payment functionality is not available yet."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.payment),
              label: const Text("Pay"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
