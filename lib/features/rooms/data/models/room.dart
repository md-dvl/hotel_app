// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hotel_clean/features/rooms/domain/entities/room.dart';

class RoomsModel {
  List<RoomModel> rooms;
  RoomsModel({
    required this.rooms,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) {
    return RoomsModel(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e))
          .toList(),
    );
  }

  List<RoomEntity> toEntityList() {
    return rooms.map((e) => e.toEntity()).toList();
  }
}

class RoomModel extends RoomEntity {
  const RoomModel(
      {int? id,
      String? name,
      int? price,
      String? pricePer,
      List<String>? peculiarities,
      List<String>? imageUrls})
      : super(
          id: id,
          name: name,
          price: price,
          pricePer: pricePer,
          peculiarities: peculiarities,
          imageUrls: imageUrls,
        );
  RoomEntity toEntity() {
    return RoomEntity(
      id: id,
      name: name,
      price: price,
      pricePer: pricePer,
      peculiarities: peculiarities,
      imageUrls: imageUrls,
    );
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      pricePer: json['price_per'] as String?,
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
