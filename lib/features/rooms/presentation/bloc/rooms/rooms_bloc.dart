import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/rooms/domain/entities/room.dart';
import 'package:hotel_clean/features/rooms/domain/usecases/get_rooms.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final GetRoomsUseCase _getRoomsUseCase;

  RoomsBloc(this._getRoomsUseCase) : super(const RoomsLoading()) {
    on<GetRooms>(onGetRooms);
  }

  void onGetRooms(GetRooms event, Emitter<RoomsState> emit) async {
    final dataState = await _getRoomsUseCase();
    if (dataState is DataSuccess) {
      emit(RoomsSucces(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RoomsException(dataState.exception!));
    }
  }
}

abstract class RoomsState extends Equatable {
  const RoomsState();
}

class RoomsLoading extends RoomsState {
  const RoomsLoading() : super();

  @override
  List<Object?> get props => [];
}

class RoomsSucces extends RoomsState {
  final List<RoomEntity> rooms;

  const RoomsSucces(this.rooms) : super();

  @override
  List<Object?> get props => [rooms];
}

class RoomsException extends RoomsState {
  const RoomsException(this.exception);
  final Object exception;

  @override
  List<Object?> get props => [exception];
}

abstract class RoomsEvent {
  const RoomsEvent();
}

class GetRooms extends RoomsEvent {
  const GetRooms();
}
