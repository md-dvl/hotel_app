import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/rooms/data/data_sources/remote/room_api.dart';
import 'package:hotel_clean/features/rooms/data/models/room.dart';
import 'package:hotel_clean/features/rooms/domain/repository/room_repository.dart';

class RoomsRepositoryImpl implements RoomsRepository {
  final RoomsApiService _roomApiService;
  RoomsRepositoryImpl(this._roomApiService);
  @override
  Future<DataState<List<RoomModel>>> getRooms() async {
    try {
      final httpResponse = await _roomApiService.getRooms();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.rooms);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
