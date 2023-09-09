import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/booking/domain/entities/booking.dart';

abstract class BookingRepository {
  Future<DataState<BookingEntity>> getBooking();
}
