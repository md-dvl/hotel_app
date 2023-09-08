import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/core/usecase/usecase.dart';
import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';
import 'package:hotel_clean/features/hotel/domain/repository/hotel_repositoy.dart';

class GetHotelUseCase implements UseCase<DataState<HotelEntity>, void> {
  final HotelRepository _hotelRepository;
  GetHotelUseCase(this._hotelRepository);
  @override
  Future<DataState<HotelEntity>> call({void params}) {
    return _hotelRepository.getHotelDetails();
  }
}
