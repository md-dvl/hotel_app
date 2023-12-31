import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/hotel/data/data_sources/remote/hotel_api.dart';
import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';
import 'package:hotel_clean/features/hotel/domain/repository/hotel_repositoy.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelApiService _hotelApiService;
  HotelRepositoryImpl(this._hotelApiService);
  @override
  Future<DataState<HotelEntity>> getHotelDetails() async {
    try {
      final httpResponse = await _hotelApiService.getHotel();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.toEntity());
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
