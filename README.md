# hotel_app

Hotel App using Flutter, simple API calls, BLoC, Clean Architecture and Retrofit.

## Getting Started

This is the test Hotel App project. App Designed fot both Android and iOS.
The app consists of 4 screens, which are divided for 4 features. Each API call can be changed in ..data/data_sources/remote/api_name.dart
1) Hotel
   
   ![photo_5467556650312389415_w](https://github.com/md-dvl/hotel_app/assets/116338701/29ba4bdd-7bc5-4627-aee7-cc3f96199187)

    Getting data about the certain hotel from API. Button 'К выбору номера' is the only active button and it redirect to Rooms screen.
2) Rooms
   
   ![photo_5467556650312389526_w](https://github.com/md-dvl/hotel_app/assets/116338701/d4ab26ca-f6d2-4ed9-a47b-352604ff8292)

   Gettig data about rooms from API. Regardless of the number of rooms, any of the 'Выбать номер' buttons redirects to same Booking screen.
3) Booking
4) 
   ![photo_5467556650312389530_w](https://github.com/md-dvl/hotel_app/assets/116338701/1af0493f-ff1b-40ca-a778-3ff3cae813e4)

   Gettind data about booking details from API. 'Tourist' blocks are expandable. Button 'Добавить туриста' adds new 'Tourist' block. Every TextField has a validation for empty value. Phone TextField has a mask, which allows enter only digits. Email TextField validates according to a standard template. Field  'К оплате'  summarizes values from 3 fields above. Button 'Оплатить' navigates to Congrats screen.
4) Congrats
5) 
   ![photo_5467556650312389532_w](https://github.com/md-dvl/hotel_app/assets/116338701/c3f50ea8-3aa4-4d76-a6ca-34e1d53191d0)

   Does not interact with api. Every time generates random order number. Button 'Cупер!' redirects to first Hotel screen.
   
   
