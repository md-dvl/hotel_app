import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/booking/domain/entities/booking.dart';
import 'package:hotel_clean/features/booking/domain/usecases/get_booking.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetBookingUseCase _getBookingUseCase;

  BookingBloc(this._getBookingUseCase) : super(const BookingLoading()) {
    on<GetBooking>(onGetBooking);
  }

  void onGetBooking(GetBooking event, Emitter<BookingState> emit) async {
    final dataState = await _getBookingUseCase();
    if (dataState is DataSuccess) {
      emit(BookingSucces(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(BookingException(dataState.exception!));
    }
  }
}

abstract class BookingState extends Equatable {
  const BookingState();
}

class BookingLoading extends BookingState {
  const BookingLoading() : super();

  @override
  List<Object?> get props => [];
}

class BookingSucces extends BookingState {
  final BookingEntity booking;

  const BookingSucces(this.booking) : super();

  @override
  List<Object?> get props => [booking];
}

class BookingException extends BookingState {
  const BookingException(this.exception);
  final Object exception;

  @override
  List<Object?> get props => [exception];
}

abstract class BookingEvent {
  const BookingEvent();
}

class GetBooking extends BookingEvent {
  const GetBooking();
}
