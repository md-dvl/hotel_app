import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final int? id;
  final String? hotelName;
  final String? hotelAdress;
  final int? horating;
  final String? ratingName;
  final String? departure;
  final String? arrivalCountry;
  final String? tourDateStart;
  final String? tourDateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? tourPrice;
  final int? fuelCharge;
  final int? serviceCharge;

  const BookingEntity(
      {this.id,
      this.hotelName,
      this.hotelAdress,
      this.horating,
      this.ratingName,
      this.departure,
      this.arrivalCountry,
      this.tourDateStart,
      this.tourDateStop,
      this.numberOfNights,
      this.room,
      this.nutrition,
      this.tourPrice,
      this.fuelCharge,
      this.serviceCharge});

  @override
  List<Object?> get props {
    return [
      id,
      hotelName,
      hotelAdress,
      horating,
      ratingName,
      departure,
      arrivalCountry,
      tourDateStart,
      tourDateStop,
      numberOfNights,
      room,
      nutrition,
      tourPrice,
      fuelCharge,
      serviceCharge,
    ];
  }
}
