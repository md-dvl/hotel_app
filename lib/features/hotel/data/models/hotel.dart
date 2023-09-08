import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';

class HotelModel extends HotelEntity {
  const HotelModel({
    int? id,
    String? name,
    String? adress,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<String>? imageUrls,
    AboutTheHotel? aboutTheHotel,
  }) : super(
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

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      adress: json['adress'] as String?,
      minimalPrice: json['minimal_price'] as int?,
      priceForIt: json['price_for_it'] as String?,
      rating: json['rating'] as int?,
      ratingName: json['rating_name'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aboutTheHotel: AboutTheHotel.fromJson(json['about_the_hotel']),
    );
  }
}
