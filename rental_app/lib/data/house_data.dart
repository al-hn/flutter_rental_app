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
    price: 166000.6,
    height: 3.5,
    yearOfProduction: 2020,
    floor: 6,
    apartmentNumber: 60,
    imageUrl: "lib/assets/images.jpg"
  ),
  House(
    residentalComplexName: "Best Complex",
    city: "Almaty",
    area: 36.0,
    price: 200000.0,
    height: 2.9,
    yearOfProduction: 2018,
    floor: 14,
    apartmentNumber: 156,
        imageUrl: "lib/assets/image2.jpg"
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
        imageUrl: "lib/assets/image3.jpeg"
  ),
  House(
    residentalComplexName: "Hyper Complex",
    city: "Karagandy",
    area: 20,
    price: 160000,
    height: 3.5,
    yearOfProduction: 2015,
    floor: 14,
    apartmentNumber: 164,
        imageUrl: "lib/assets/image4.jpg"
  ),
  House(
      area: 34,
      city: "Aktau",
      height: 3,
      yearOfProduction: 2017,
      residentalComplexName: "Aktau",
      floor: 1,
      apartmentNumber: 4,
      price: 350000,
          imageUrl: "lib/assets/image5.jpg"
      ),
      
  House(
      area: 50,
      city: "Semey",
      height: 4,
      yearOfProduction: 2024,
      residentalComplexName: "Cookie",
      floor: 6,
      apartmentNumber: 34,
      price: 244000,
          imageUrl: "lib/assets/image6.jfif"
          ),
  House(
      area: 60,
      city: "Almaty",
      height: 4,
      yearOfProduction: 2019,
      residentalComplexName: "Resident President",
      floor: 5,
      apartmentNumber: 10,
      price: 400000,
          imageUrl: "lib/assets/images.jpg")
];
