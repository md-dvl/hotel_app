import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/di_container.dart';
import 'package:hotel_clean/features/hotel/data/models/list_tile_models.dart';
import 'package:hotel_clean/features/hotel/presentation/bloc/hotel/hotel_bloc.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_bottom_widget.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_chip.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_container.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_list_tile.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_scaffold.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/app_text_widdget.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/hotel_details_column.dart';
import 'package:hotel_clean/features/hotel/presentation/widgets/price_row.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  int photoIndex = 0;

  Color chooseDotColor(int index) {
    switch (index) {
      case 0:
        return Colors.black.withOpacity(0.35);
      case 1:
        return Colors.black.withOpacity(0.22);
      case 2:
        return Colors.black.withOpacity(0.17);
      case 3:
        return Colors.black.withOpacity(0.10);
      case 4:
        return Colors.black.withOpacity(0.05);
      default:
        return Colors.black.withOpacity(0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: AppColors.cF6F6F9,
      child: BlocProvider<HotelBloc>(
        create: (context) => sl()..add(const GetHotel()),
        child: BlocBuilder<HotelBloc, HotelState>(builder: (_, state) {
          if (state is HotelSucces) {
            final List<String> photos = state.hotel?.imageUrls ?? [];

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
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 257,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) => setState(() {
                                  photoIndex = index;
                                }),
                              ),
                              itemCount: photos.length,
                              itemBuilder: (context, index, realIndex) =>
                                  SizedBox(
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: photos[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              child: Container(
                                height: 17,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < photos.length; i++)
                                      Container(
                                        height: 7,
                                        width: 7,
                                        margin: i == (photos.length - 1)
                                            ? null
                                            : const EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: photoIndex == i
                                              ? Colors.black
                                              : chooseDotColor(i),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        HotelDetailsColumn(
                          rating: state.hotel?.rating,
                          ratingName: state.hotel?.ratingName,
                          name: state.hotel?.name,
                          adress: state.hotel?.adress,
                        ),
                        const SizedBox(height: 16),
                        PriceRow(
                          price: state.hotel?.minimalPrice,
                          description: state.hotel?.priceForIt,
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
                            AppChip(
                                state.hotel?.aboutTheHotel?.peculiarities?[0] ??
                                    thirdLine),
                            const SizedBox(width: 8),
                            AppChip(
                                state.hotel?.aboutTheHotel?.peculiarities?[1] ??
                                    wiFi),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            AppChip(
                                state.hotel?.aboutTheHotel?.peculiarities?[2] ??
                                    airportDistance),
                            const SizedBox(width: 8),
                            AppChip(
                                state.hotel?.aboutTheHotel?.peculiarities?[3] ??
                                    beachDistance),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          state.hotel?.aboutTheHotel?.description ??
                              hotelDescription,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  height: 1,
                                  indent: 41,
                                  color: AppColors.c828796.withOpacity(0.15),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const AppBottomWidget(
                    child: AppTextWidget('К выбору номера'),
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
                child: Text('There is an error : ${state.exception!.message}'));
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
