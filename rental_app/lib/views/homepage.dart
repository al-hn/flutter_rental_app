import 'package:flutter/material.dart';
import '../data/house_data.dart';
import '../models/house.dart';
import 'details_page.dart'; // Import the new page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // this is a code crutch. "Scaffold.of(context).openDrawer()" didn't work.
    // this shouldn't work like that but for now it can be ignored
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,

      // -- DRAWER MENU --
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Text("Menu", style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),

      // -- HEADER --
      appBar: AppBar(
        title: const Text("Renting", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),

      // -- BODY --
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0, childAspectRatio: 3 / 2),
        itemCount: houses.length,
        itemBuilder: (context, index) {
          House house = houses[index];

          return Card(
            child: InkWell(
              onTap: () {
                // Navigate to the detail page with the selected house
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(house: house),
                  ),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${house.residentalComplexName}, ${house.city}, ${house.price}KZT"),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // -- ACTION BUTTON --
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print("floating action button was pressed");
        },
        tooltip: 'Add Item',
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class DetaisPage {
}
