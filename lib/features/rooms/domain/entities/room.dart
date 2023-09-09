// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final int? id;
  final String? name;
  final int? price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  const RoomEntity({
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      price,
      pricePer,
      peculiarities,
      imageUrls,
    ];
  }
}
