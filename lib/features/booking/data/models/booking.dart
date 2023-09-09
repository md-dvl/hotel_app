import 'package:hotel_clean/features/booking/domain/entities/booking.dart';

class BookingModel {
  const BookingModel(
      {required this.id,
      required this.hotelName,
      required this.hotelAdress,
      required this.horating,
      required this.ratingName,
      required this.departure,
      required this.arrivalCountry,
      required this.tourDateStart,
      required this.tourDateStop,
      required this.numberOfNights,
      required this.room,
      required this.nutrition,
      required this.tourPrice,
      required this.fuelCharge,
      required this.serviceCharge});

  final int id;
  final String hotelName;
  final String hotelAdress;
  final int horating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] as int,
      hotelName: json['hotel_name'] as String,
      hotelAdress: json['hotel_adress'] as String,
      horating: json['horating'] as int,
      ratingName: json['rating_name'] as String,
      departure: json['departure'] as String,
      arrivalCountry: json['arrival_country'] as String,
      tourDateStart: json['tour_date_start'] as String,
      tourDateStop: json['tour_date_stop'] as String,
      numberOfNights: json['number_of_nights'] as int,
      room: json['room'] as String,
      nutrition: json['nutrition'] as String,
      tourPrice: json['tour_price'] as int,
      fuelCharge: json['fuel_charge'] as int,
      serviceCharge: json['service_charge'] as int,
    );
  }

  BookingEntity toEntity() {
    return BookingEntity(
      id: id,
      hotelName: hotelName,
      hotelAdress: hotelAdress,
      horating: horating,
      ratingName: ratingName,
      departure: departure,
      arrivalCountry: arrivalCountry,
      tourDateStart: tourDateStart,
      tourDateStop: tourDateStop,
      numberOfNights: numberOfNights,
      room: room,
      nutrition: nutrition,
      tourPrice: tourPrice,
      fuelCharge: fuelCharge,
      serviceCharge: serviceCharge,
    );
  }
}
