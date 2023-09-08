import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';

abstract class HotelRepository {
  Future<DataState<HotelEntity>> getHotelDetails();
}
