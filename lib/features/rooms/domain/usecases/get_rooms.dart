import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/core/usecase/usecase.dart';
import 'package:hotel_clean/features/rooms/domain/entities/room.dart';
import 'package:hotel_clean/features/rooms/domain/repository/room_repository.dart';

class GetRoomsUseCase implements UseCase<DataState<List<RoomEntity>>, void> {
  final RoomsRepository _roomRepository;
  GetRoomsUseCase(this._roomRepository);
  @override
  Future<DataState<List<RoomEntity>>> call({void params}) {
    return _roomRepository.getRooms();
  }
}
