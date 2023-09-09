import 'package:dio/dio.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/features/hotel/data/models/hotel.dart';
import 'package:retrofit/retrofit.dart';
part 'hotel_api.g.dart';

@RestApi(baseUrl: AppConstants.hotelBaseUrl)
abstract class HotelApiService {
  factory HotelApiService(Dio dio) = _HotelApiService;
  @GET('35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HttpResponse<HotelModel>> getHotel();
}
