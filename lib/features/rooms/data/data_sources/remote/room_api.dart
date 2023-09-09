import 'package:dio/dio.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/features/rooms/data/models/room.dart';
import 'package:retrofit/retrofit.dart';
part 'room_api.g.dart';

@RestApi(baseUrl: AppConstants.hotelBaseUrl)
abstract class RoomsApiService {
  factory RoomsApiService(Dio dio) = _RoomsApiService;
  @GET('f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<HttpResponse<RoomsModel>> getRooms();
}
