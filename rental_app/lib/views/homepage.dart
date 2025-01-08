import 'dart:math';

import 'package:flutter/material.dart';
import 'package:krysha_kz/models/house.dart';
import 'package:krysha_kz/views/details_page.dart';
import 'package:krysha_kz/views/sign_up_page.dart';
import 'list_home.dart';

class HomePage extends StatefulWidget {
  final List<House> initialHouses;

  const HomePage({super.key, required this.initialHouses});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random _random = Random();

  int _getRandomRating() {
    return _random.nextInt(5) + 1;
  }

  late List<House> houses;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    houses = widget.initialHouses;
  }

  void _addHouse(House newHouse) {
    setState(() {
      houses.add(newHouse);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
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
          tooltip: "Menu",
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
          int rating = _getRandomRating();

          return Tooltip(
            message: "Details",
            child: Card(
              clipBehavior: Clip.antiAlias,
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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      house.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 16,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text("${house.residentalComplexName}, ${house.city}, ${house.price}KZT", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, height: 1.0), textAlign: TextAlign.left,),
                            
                            // -- STAR RATINGS --
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < rating ? Icons.star : Icons.star_border,
                                  color: Colors.yellow,
                                  size: 20
                                );
                              })
                            ),
                          ],
                      ),
                    )
                )],
                ),
              ),
            ),
          );
        },
      ),

      // -- ACTION BUTTON --
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListHome(onHouseAdded: _addHouse,)));
        },
        tooltip: 'Add Item',
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
