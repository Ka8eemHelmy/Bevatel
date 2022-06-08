import 'package:bevatel/model/hotel_model.dart';

abstract class HotelStates {}

class InitHotelState extends HotelStates {}

class GetHotelStateLoading extends HotelStates {}

class GetHotelStateSuccess extends HotelStates {
  final List<HotelModel> hotels;

  GetHotelStateSuccess(this.hotels);
}

class GetHotelStateError extends HotelStates {
  final String error;

  GetHotelStateError(this.error);
}

class GetHotelCarouselStateLoading extends HotelStates {}

class GetHotelCarouselStateSuccess extends HotelStates {
  final List<HotelModel> hotels;

  GetHotelCarouselStateSuccess(this.hotels);
}

class GetHotelCarouselStateError extends HotelStates {
  final String error;

  GetHotelCarouselStateError(this.error);
}

class GetHotelDetailsStateLoading extends HotelStates {}

class GetHotelDetailsStateSuccess extends HotelStates {
  final HotelModel hotel;

  GetHotelDetailsStateSuccess(this.hotel);
}

class GetHotelDetailsStateError extends HotelStates {
  final String error;

  GetHotelDetailsStateError(this.error);
}

class FetchNewDataStateLoading extends HotelStates {}
class FetchNewDataStateSuccess extends HotelStates {}
