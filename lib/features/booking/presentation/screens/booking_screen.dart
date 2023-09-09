import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_clean/core/constants/constants.dart';
import 'package:hotel_clean/core/widgets/app_app_bar.dart';
import 'package:hotel_clean/core/widgets/app_bottom_widget.dart';
import 'package:hotel_clean/core/widgets/app_container.dart';
import 'package:hotel_clean/core/widgets/app_text_widget.dart';
import 'package:hotel_clean/core/widgets/hotel_details_column.dart';
import 'package:hotel_clean/di_container.dart';
import 'package:hotel_clean/features/booking/data/models/booking.dart';
import 'package:hotel_clean/features/booking/presentation/bloc/booking/booking_bloc.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/booking_price_row.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/booking_row.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/email_text_from_field.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/expandable_column.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/phone_text_form_field.dart';
import 'package:hotel_clean/features/booking/presentation/widgets/small_button_container.dart';
import 'package:hotel_clean/features/congrats/presentation/screen/congrats_screen.dart';
import 'package:hotel_clean/theme/colors.dart';
import 'package:hotel_clean/theme/text_styles.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<String> tourists = ['Первый турист'];
  int touristCount = 0;
  final formKey = GlobalKey<FormState>();

  void addTourist() {
    setState(() {
      touristCount++;
      tourists.add(getTouristText());
    });
  }

  String getTouristText() {
    if (touristCount == 1) {
      return "Второй турист";
    } else if (touristCount == 2) {
      return "Третий турист";
    } else {
      return "${touristCount + 1}-й турист";
    }
  }

  String calculateSum(int tour, int fuelCharge, int serviceCharge) {
    return '${tour + fuelCharge + serviceCharge} ₽';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: AppColors.cF6F6F9,
          child: BlocProvider<BookingBloc>(
            create: (context) => sl()..add(const GetBooking()),
            child: BlocBuilder<BookingBloc, BookingState>(builder: (_, state) {
              if (state is BookingSucces) {
                return SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const ColoredBox(
                          color: Colors.white,
                          child: AppAppBar('Бронирование'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: AppContainer(
                            isBoth: true,
                            child: HotelDetailsColumn(
                              rating: state.booking.horating,
                              ratingName: state.booking.ratingName,
                              name: state.booking.hotelName,
                              adress: state.booking.hotelAdress,
                            ),
                          ),
                        ),
                        AppContainer(
                          isBoth: true,
                          child: Column(
                            children: [
                              BookingRow(
                                text1: 'Вылет из',
                                text2: state.booking.departure ??
                                    AppConstants.departure,
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Страна, Город',
                                text2: state.booking.arrivalCountry ??
                                    AppConstants.arrival,
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Даты',
                                text2:
                                    '${state.booking.tourDateStart} - ${state.booking.tourDateStart}',
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Кол-во ночей',
                                text2:
                                    '${state.booking.numberOfNights.toString()} ночей',
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Отель',
                                text2: state.booking.hotelName ??
                                    AppConstants.hotelName,
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Номер',
                                text2: state.booking.room ?? AppConstants.room,
                              ),
                              const SizedBox(height: 16),
                              BookingRow(
                                text1: 'Питание',
                                text2: state.booking.nutrition ??
                                    AppConstants.nutrition,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Информация о покупателе',
                                style: AppTextStyles.sfPro22w500,
                              ),
                              const SizedBox(height: 20),
                              PhoneTextFormField(
                                label: 'Номер телефона',
                                hint: '+7 (951) 555-99-00',
                                formatter: MaskTextInputFormatter(
                                  mask: '+7 (###) ###-##-##',
                                  filter: {
                                    "#": RegExp(r'[0-9]'),
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              const EmailTextFormField(
                                label: 'Почта',
                                hint: 'examplemail.000@mail.ru',
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                                style: AppTextStyles.sfPro14w500.copyWith(
                                  color: AppColors.c828796,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) {
                            return AppContainer(
                              isBoth: true,
                              child: ExpandableColumn(tourists[index]),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          shrinkWrap: true,
                          itemCount: tourists.length,
                        ),
                        AppContainer(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Добавить туриста',
                                    style: AppTextStyles.sfPro22w500,
                                  ),
                                  GestureDetector(
                                    onTap: () => addTourist(),
                                    child: const SmallButtonContainer(
                                      icon: 'assets/svg/plus.svg',
                                      isArrow: false,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppContainer(
                          child: Column(
                            children: [
                              BookingPriceRow(
                                text1: 'Тур',
                                text2: '${state.booking.tourPrice} ₽',
                              ),
                              const SizedBox(height: 16),
                              BookingPriceRow(
                                text1: 'Топливный сбор',
                                text2: '${state.booking.fuelCharge} ₽',
                              ),
                              const SizedBox(height: 16),
                              BookingPriceRow(
                                text1: 'Сервисный сбор',
                                text2: '${state.booking.serviceCharge} ₽',
                              ),
                              const SizedBox(height: 16),
                              BookingPriceRow(
                                text1: 'К оплате',
                                text2: calculateSum(
                                  state.booking.tourPrice ?? AppConstants.tour,
                                  state.booking.fuelCharge ??
                                      AppConstants.fuelCharge,
                                  state.booking.serviceCharge ??
                                      AppConstants.serviceCharge,
                                ),
                                isLast: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppBottomWidget(
                          child: GestureDetector(
                            onTap: () {
                              bool isValid = formKey.currentState!.validate();
                              if (isValid) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CongratsScreen(),
                                  ),
                                );
                              }
                            },
                            child: const AppTextWidget('Оплатить'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is BookingModel) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BookingException) {
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
