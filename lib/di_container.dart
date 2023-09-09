import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hotel_clean/features/booking/data/data_sources/remote/booking_api.dart';
import 'package:hotel_clean/features/booking/data/repository/booking_repository_impl.dart';
import 'package:hotel_clean/features/booking/domain/repository/booking_repository.dart';
import 'package:hotel_clean/features/booking/domain/usecases/get_booking.dart';
import 'package:hotel_clean/features/booking/presentation/bloc/booking/booking_bloc.dart';
import 'package:hotel_clean/features/hotel/data/data_sources/remote/hotel_api.dart';
import 'package:hotel_clean/features/hotel/data/repository/hotel_repository_impl.dart';
import 'package:hotel_clean/features/hotel/domain/repository/hotel_repositoy.dart';
import 'package:hotel_clean/features/hotel/domain/usecases/get_hotel.dart';
import 'package:hotel_clean/features/hotel/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:hotel_clean/features/rooms/data/data_sources/remote/room_api.dart';
import 'package:hotel_clean/features/rooms/data/repository/room_repository_impl.dart';
import 'package:hotel_clean/features/rooms/domain/repository/room_repository.dart';
import 'package:hotel_clean/features/rooms/domain/usecases/get_rooms.dart';
import 'package:hotel_clean/features/rooms/presentation/bloc/rooms/rooms_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<HotelApiService>(HotelApiService(sl()));
  sl.registerSingleton<RoomsApiService>(RoomsApiService(sl()));
  sl.registerSingleton<BookingApiService>(BookingApiService(sl()));

  sl.registerSingleton<HotelRepository>(HotelRepositoryImpl(sl()));
  sl.registerSingleton<RoomsRepository>(RoomsRepositoryImpl(sl()));
  sl.registerSingleton<BookingRepository>(BookingRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetHotelUseCase>(GetHotelUseCase(sl()));
  sl.registerSingleton<GetRoomsUseCase>(GetRoomsUseCase(sl()));
  sl.registerSingleton<GetBookingUseCase>(GetBookingUseCase(sl()));

//Blocs
  sl.registerFactory<HotelBloc>(() => HotelBloc(sl()));
  sl.registerFactory<RoomsBloc>(() => RoomsBloc(sl()));
  sl.registerFactory<BookingBloc>(() => BookingBloc(sl()));
}
