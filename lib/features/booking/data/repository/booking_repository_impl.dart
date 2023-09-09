import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/booking/data/data_sources/remote/booking_api.dart';
import 'package:hotel_clean/features/booking/domain/entities/booking.dart';
import 'package:hotel_clean/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingApiService _bookingApiService;
  BookingRepositoryImpl(this._bookingApiService);
  @override
  Future<DataState<BookingEntity>> getBooking() async {
    try {
      final httpResponse = await _bookingApiService.getBooking();
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
