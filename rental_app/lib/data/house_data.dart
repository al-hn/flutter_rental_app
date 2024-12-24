import '../models/house.dart';

/*
  The house model should have next attributes(attributes are like.. columns in sql).
  '?' is not necesary.
  area in square meters
  price in KZT
  height in meters

  String  residentalComplexName
  String  city
  double  area
  double  price
  double  height
  int     yearOfProduction
  int?    floor
  int?    apartmentNumber
*/

List<House> houses = [
  House(
    residentalComplexName: "Super Towers",
    city: "Astana",
    area: 25.0,
    price: 166.6,
    height: 3.5,
    yearOfProduction: 2020,
    floor: 6,
    apartmentNumber: 60,
  ),

  House(
    residentalComplexName: "Best Complex",
    city: "Almaty",
    area: 36.0,
    price: 110.0,
    height: 2.9,
    yearOfProduction: 2018,
    floor: 14,
    apartmentNumber: 156,
  ),

  House(
    residentalComplexName: "Grand Resident",
    city: "Astana",
    area: 40.0,
    price: 500,
    height: 2.9,
    yearOfProduction: 2024,
    floor: 7,
    apartmentNumber: 90,
  ),
];