import 'package:flutter/material.dart';
import 'package:krysha_kz/views/buy_page.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- HOUSE. ATTRIBUTES --
              // -- HOUSE PHOTO --
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2)
                    ),
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    house.imageUrl,
                    fit: BoxFit.cover
                  ),
                ),
              ),
              
              // -- HOUSE INFO --
              SizedBox(height: 26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Complex: ", style: TextStyle(fontSize: 16),),
                  Text(house.residentalComplexName, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("City:", style: TextStyle(fontSize: 16)),
                  Text(house.city, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Area:", style: TextStyle(fontSize: 16)),
                  Text(house.area.toString(), style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price:", style: TextStyle(fontSize: 16)),
                  Text("${house.price}KZT", style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Height:", style: TextStyle(fontSize: 16),),
                  Text("${house.height}M", style: const TextStyle(fontSize: 16),),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Floor:", style: TextStyle(fontSize: 16)),
                  Text("${house.floor}", style: const TextStyle(fontSize: 16),)
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Apartment:", style: TextStyle(fontSize: 16),),
                  Text("${house.apartmentNumber}", style: const TextStyle(fontSize: 16),),
                ],
              ),

              // -- BUY BUTTON --
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage(house: house,)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16.0)
                  ),
                  child: const Text("Buy", style: TextStyle(fontSize: 18, color: Colors.white,),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}