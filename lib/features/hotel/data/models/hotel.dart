import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';

class HotelModel {
  const HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final AboutTheHotel aboutTheHotel;

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimalPrice: json['minimal_price'] as int,
      priceForIt: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      aboutTheHotel: AboutTheHotel.fromJson(json['about_the_hotel']),
    );
  }

  HotelEntity toEntity() {
    return HotelEntity(
      id: id,
      name: name,
      adress: adress,
      minimalPrice: minimalPrice,
      priceForIt: priceForIt,
      rating: rating,
      ratingName: ratingName,
      imageUrls: imageUrls,
      aboutTheHotel: aboutTheHotel,
    );
  }
}
