import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_clean/core/widgets/app_app_bar.dart';
import 'package:hotel_clean/core/widgets/app_carousel.dart';
import 'package:hotel_clean/core/widgets/app_chip.dart';
import 'package:hotel_clean/core/widgets/app_container.dart';
import 'package:hotel_clean/core/widgets/app_text_widget.dart';
import 'package:hotel_clean/core/widgets/price_row.dart';
import 'package:hotel_clean/di_container.dart';
import 'package:hotel_clean/features/booking/presentation/screens/booking_screen.dart';
import 'package:hotel_clean/features/rooms/domain/entities/room.dart';
import 'package:hotel_clean/features/rooms/presentation/bloc/rooms/rooms_bloc.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.cF6F6F9,
          child: BlocProvider<RoomsBloc>(
            create: (context) => sl()..add(const GetRooms()),
            child: BlocBuilder<RoomsBloc, RoomsState>(builder: (_, state) {
              if (state is RoomsSucces) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const ColoredBox(
                        color: Colors.white,
                        child: AppAppBar('Steigenberger Makadi'),
                      ),
                      const SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final RoomEntity room = state.rooms[index];
                          return AppContainer(
                            isBoth: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Carousel(photos: room.imageUrls ?? ['']),
                                const SizedBox(height: 8),
                                Text(
                                  room.name ?? '',
                                  style: AppTextStyles.sfPro22w500,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    AppChip(room.peculiarities?[0] ?? ''),
                                    const SizedBox(width: 8),
                                    AppChip(room.peculiarities?[1] ?? ''),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.c0D72FF.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Подробнее о номере',
                                        style: AppTextStyles.sfPro16w500
                                            .copyWith(color: AppColors.c0D72FF),
                                      ),
                                      const SizedBox(width: 2),
                                      SvgPicture.asset(
                                        'assets/svg/arrow_right.svg',
                                        // color: AppColors.c0D72FF,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.c0D72FF,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: PriceRow(
                                    price: room.price,
                                    description: room.pricePer,
                                    isRoom: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BookingScreen(),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    height: 48,
                                    child: AppTextWidget("Выбрать номер"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: state.rooms.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ],
                  ),
                );
              }
              if (state is RoomsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is RoomsException) {
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
