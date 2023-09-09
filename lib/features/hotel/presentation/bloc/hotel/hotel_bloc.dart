import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/hotel/domain/entities/hotel.dart';
import 'package:hotel_clean/features/hotel/domain/usecases/get_hotel.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final GetHotelUseCase _getHotelUseCase;

  HotelBloc(this._getHotelUseCase) : super(const HotelLoading()) {
    on<GetHotel>(onGetHotel);
  }

  void onGetHotel(GetHotel event, Emitter<HotelState> emit) async {
    final dataState = await _getHotelUseCase();
    if (dataState is DataSuccess) {
      emit(HotelSucces(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(HotelException(dataState.exception!));
    }
  }
}

abstract class HotelState extends Equatable {
  const HotelState();
}

class HotelLoading extends HotelState {
  const HotelLoading() : super();

  @override
  List<Object?> get props => [];
}

class HotelSucces extends HotelState {
  final HotelEntity hotel;

  const HotelSucces(this.hotel) : super();

  @override
  List<Object?> get props => [hotel];
}

class HotelException extends HotelState {
  const HotelException(this.exception);
  final Object exception;

  @override
  List<Object?> get props => [exception];
}

abstract class HotelEvent {
  const HotelEvent();
}

class GetHotel extends HotelEvent {
  const GetHotel();
}
