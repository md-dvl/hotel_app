import 'package:hotel_clean/core/resources/data_state.dart';
import 'package:hotel_clean/features/rooms/domain/entities/room.dart';

abstract class RoomsRepository {
  Future<DataState<List<RoomEntity>>> getRooms();
}
