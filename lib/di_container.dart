import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hotel_clean/features/hotel/data/data_sources/remote/hotel_api.dart';
import 'package:hotel_clean/features/hotel/data/repository/hotel_repository_impl.dart';
import 'package:hotel_clean/features/hotel/domain/repository/hotel_repositoy.dart';
import 'package:hotel_clean/features/hotel/domain/usecases/get_hotel.dart';
import 'package:hotel_clean/features/hotel/presentation/bloc/hotel/hotel_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<HotelApiService>(HotelApiService(sl()));
  sl.registerSingleton<HotelRepository>(HotelRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetHotelUseCase>(GetHotelUseCase(sl()));

//Blocs
  sl.registerFactory<HotelBloc>(() => HotelBloc(sl()));
}
