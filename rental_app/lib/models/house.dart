class House {
  final String residentalComplexName;
  final String city;
  final double area;
  final double price;
  final double height;
  final int yearOfProduction;
  final int? floor;
  final int? apartmentNumber;

  House({
    required this.area,
    required this.city,
    required this.height,
    required this.yearOfProduction,
    required this.residentalComplexName,
    required this.floor,
    required this.apartmentNumber,
    required this.price,
  });
}