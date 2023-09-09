import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/core/usecase/usecase.dart';
import 'package:hotel_clean/features/booking/domain/entities/booking.dart';
import 'package:hotel_clean/features/booking/domain/repository/booking_repository.dart';

class GetBookingUseCase implements UseCase<DataState<BookingEntity>, void> {
  final BookingRepository _bookingRepository;
  GetBookingUseCase(this._bookingRepository);
  @override
  Future<DataState<BookingEntity>> call({void params}) {
    return _bookingRepository.getBooking();
  }
}
