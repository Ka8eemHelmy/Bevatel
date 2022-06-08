import 'package:bevatel/model/hotel_model.dart';
import 'package:bevatel/view_model/hotel_cubit/hotel_states.dart';
import 'package:bevatel/view_model/network/network/dio-helper.dart';
import 'package:bevatel/view_model/network/network/dio_exceptions.dart';
import 'package:bevatel/view_model/network/network/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCubit extends Cubit<HotelStates> {
  HotelCubit() : super(InitHotelState());

  static HotelCubit get(context) => BlocProvider.of(context);

  List<HotelModel> hotels = [];
  List<HotelModel> fetchHotels = [];

  Future<dynamic> getHotels({
    required int page,
    required int limit,
  }) async {
    emit(GetHotelStateLoading());
    print(page);
    try {
      final response = await DioHelper.getData(
        url: offers,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );
      // print(response.data);
      fetchHotels = response.data
          .map<HotelModel>((item) => HotelModel.fromJson(item))
          .toList();
      emit(GetHotelStateSuccess(hotels));
      return hotels;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(GetHotelStateError(errorMessage));
      throw errorMessage;
    }
  }

  List<HotelModel> hotelsCarousel = [];

  Future<dynamic> getHotelsCarousel({
    required int page,
    required int limit,
  }) async {
    emit(GetHotelCarouselStateLoading());
    try {
      final response = await DioHelper.getData(
        url: offers,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );
      // print(response.data);
      hotelsCarousel =
          response.data.map<HotelModel>((e) => HotelModel.fromJson(e)).toList();
      emit(GetHotelCarouselStateSuccess(hotelsCarousel));
      return hotelsCarousel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(GetHotelCarouselStateError(errorMessage));
      throw errorMessage;
    }
  }

  HotelModel? currentHotel;

  Future<dynamic> getHotelDetails({
    required String hotelId,
  }) async {
    emit(GetHotelDetailsStateLoading());
    currentHotel = null;
    try {
      final response = await DioHelper.getData(
        url: '$offers/$hotelId',
      );
      print(response.data);
      currentHotel = HotelModel.fromJson(response.data);
      emit(GetHotelDetailsStateSuccess(currentHotel!));
      return currentHotel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      emit(GetHotelDetailsStateError(errorMessage));
      throw errorMessage;
    }
  }

  int page = 1;
  int limit = 20;
  bool hasMore = true;
  bool isLoading = false;

  Future fetch() async {
    if (hasMore && !isLoading) {
      emit(FetchNewDataStateLoading());
      isLoading = true;
      await getHotels(page: page, limit: limit);
      page++;
      isLoading = false;
      if (fetchHotels.length < limit) {
        hasMore = false;
      } else {
        hotels.addAll(fetchHotels);
        fetchHotels.clear();
      }
      emit(FetchNewDataStateSuccess());
    }
  }
}
