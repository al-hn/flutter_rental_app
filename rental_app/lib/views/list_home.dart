import 'package:flutter/material.dart';

import '../models/house.dart';

class ListHome extends StatefulWidget {
  final Function(House) onHouseAdded;

  const ListHome({super.key, required this.onHouseAdded});

  @override
  State<ListHome> createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final TextEditingController _residentialComplexNameController =TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _yearOfProductionController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _apartmentNumberController =TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void _listHouse() {
    if (_formKey.currentState!.validate()) {
      final newHouse = House(
        residentalComplexName: _residentialComplexNameController.text,
        city: _cityController.text,
        area: double.tryParse(_areaController.text) ?? 0.0,
        price: double.tryParse(_priceController.text) ?? 0.0,
        height: double.parse(_heightController.text),
        yearOfProduction: int.tryParse(_yearOfProductionController.text) ?? 0,
        floor: int.tryParse(_floorController.text),
        apartmentNumber: int.tryParse(_apartmentNumberController.text) ?? 0,
        imageUrl: _imageUrlController.text,
      );

      widget.onHouseAdded(newHouse);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("House Listed Successfully")),
      );

      _formKey.currentState!.reset();
      _residentialComplexNameController.clear();
      _cityController.clear();
      _areaController.clear();
      _priceController.clear();
      _heightController.clear();
      _yearOfProductionController.clear();
      _floorController.clear();
      _apartmentNumberController.clear();
      _imageUrlController.clear();
    }
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List a House'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _residentialComplexNameController,
                decoration: const InputDecoration(labelText: 'Residential Complex Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter a city' : null,
              ),
              TextFormField(
                controller: _areaController,
                decoration: const InputDecoration(labelText: 'Area (sq.m)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter the area' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price (KZT)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter the price' : null,
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height (m)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter the height' : null,
              ),
              TextFormField(
                controller: _yearOfProductionController,
                decoration: const InputDecoration(labelText: 'Year of Production'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the year of production'
                    : null,
              ),
              TextFormField(
                controller: _floorController,
                decoration: const InputDecoration(labelText: 'Floor (Optional)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _apartmentNumberController,
                decoration: const InputDecoration(labelText: 'Apartment Number (Optional)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter an image URL'
                    : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _listHouse,
                child: const Text('List'),
              ),
            ],
          ),
        ),
      ),
    );
  }

    @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _residentialComplexNameController.dispose();
    _cityController.dispose();
    _areaController.dispose();
    _priceController.dispose();
    _heightController.dispose();
    _yearOfProductionController.dispose();
    _floorController.dispose();
    _apartmentNumberController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}