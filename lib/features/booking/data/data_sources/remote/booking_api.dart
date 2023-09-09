import 'package:dio/dio.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/features/booking/data/models/booking.dart';
import 'package:retrofit/retrofit.dart';
part 'booking_api.g.dart';

@RestApi(baseUrl: AppConstants.hotelBaseUrl)
abstract class BookingApiService {
  factory BookingApiService(Dio dio) = _BookingApiService;
  @GET('e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<HttpResponse<BookingModel>> getBooking();
}
