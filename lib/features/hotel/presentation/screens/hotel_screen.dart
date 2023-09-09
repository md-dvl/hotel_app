import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/core/widgets/app_bottom_widget.dart';
import 'package:hotel_clean/core/widgets/app_carousel.dart';
import 'package:hotel_clean/core/widgets/app_container.dart';
import 'package:hotel_clean/core/widgets/app_text_widget.dart';
import 'package:hotel_clean/core/widgets/hotel_details_column.dart';
import 'package:hotel_clean/core/widgets/price_row.dart';
import 'package:hotel_clean/di_container.dart';
import 'package:hotel_clean/features/hotel/data/models/list_tile_model.dart';
import 'package:hotel_clean/features/hotel/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:hotel_clean/core/widgets/app_chip.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_list_tile.dart';
import 'package:hotel_clean/features/rooms/presentation/screen/rooms_screen.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.cF6F6F9,
          child: BlocProvider<HotelBloc>(
            create: (context) => sl()..add(const GetHotel()),
            child: BlocBuilder<HotelBloc, HotelState>(builder: (_, state) {
              if (state is HotelSucces) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      AppContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 3,
                                bottom: 16,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Отель',
                                  style: AppTextStyles.sfPro18w500,
                                ),
                              ),
                            ),
                            Carousel(photos: state.hotel.imageUrls ?? []),
                            const SizedBox(height: 16),
                            HotelDetailsColumn(
                              rating: state.hotel.rating,
                              ratingName: state.hotel.ratingName,
                              name: state.hotel.name,
                              adress: state.hotel.adress,
                            ),
                            const SizedBox(height: 16),
                            PriceRow(
                              price: state.hotel.minimalPrice,
                              description: state.hotel.priceForIt,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppContainer(
                        isBoth: true,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Об отеле',
                                style: AppTextStyles.sfPro22w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                AppChip(state.hotel.aboutTheHotel
                                        ?.peculiarities?[0] ??
                                    AppConstants.thirdLine),
                                const SizedBox(width: 8),
                                AppChip(state.hotel.aboutTheHotel
                                        ?.peculiarities?[1] ??
                                    AppConstants.wiFi),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                AppChip(state.hotel.aboutTheHotel
                                        ?.peculiarities?[2] ??
                                    AppConstants.airportDistance),
                                const SizedBox(width: 8),
                                AppChip(state.hotel.aboutTheHotel
                                        ?.peculiarities?[3] ??
                                    AppConstants.beachDistance),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.hotel.aboutTheHotel?.description ??
                                  AppConstants.hotelDescription,
                              style: AppTextStyles.sfPro16w500.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.cFBFBFC,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return AppListTile(listTileModels[index]);
                                },
                                itemCount: listTileModels.length,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Divider(
                                      height: 1,
                                      indent: 41,
                                      color:
                                          AppColors.c828796.withOpacity(0.15),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppBottomWidget(
                        child: GestureDetector(
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RoomsScreen(),
                                  ),
                                ),
                            child: const AppTextWidget('К выбору номера')),
                      ),
                    ],
                  ),
                );
              }
              if (state is HotelLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HotelException) {
                return Center(
                    child: Text(
                        'There is an error : ${state.exception.toString()}'));
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
