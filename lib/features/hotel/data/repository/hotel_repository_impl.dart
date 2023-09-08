// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/hotel/data/data_sources/remote/hotel_api.dart';
import 'package:hotel_clean/features/hotel/data/models/hotel.dart';
import 'package:hotel_clean/features/hotel/domain/repository/hotel_repositoy.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelApiService _hotelApiService;
  HotelRepositoryImpl(this._hotelApiService);
  @override
  Future<DataState<HotelModel>> getHotelDetails() async {
    try {
      final httpResponse = await _hotelApiService.getHotel();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
