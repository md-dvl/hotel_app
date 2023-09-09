import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  final int? id;
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String>? imageUrls;
  final AboutTheHotel? aboutTheHotel;

  const HotelEntity({
    this.id,
    this.name,
    this.adress,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotel,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      adress,
      minimalPrice,
      priceForIt,
      rating,
      ratingName,
      imageUrls,
      aboutTheHotel,
    ];
  }
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({this.description, this.peculiarities});

  AboutTheHotel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    peculiarities = json['peculiarities'].cast<String>();
  }
}
