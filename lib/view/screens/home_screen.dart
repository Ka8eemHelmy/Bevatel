import 'package:bevatel/model/hotel_model.dart';
import 'package:bevatel/view/components/card_carousel_widget.dart';
import 'package:bevatel/view/components/constant.dart';
import 'package:bevatel/view/components/hotel_card_widget.dart';
import 'package:bevatel/view/components/shimmer/shimmer.dart';
import 'package:bevatel/view_model/hotel_cubit/hotel_cubit.dart';
import 'package:bevatel/view_model/hotel_cubit/hotel_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // HotelCubit.get(context).getHotel();
        HotelCubit.get(context).fetch();
        if(!HotelCubit.get(context).hasMore){
          scrollController.dispose();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<HotelCubit, HotelStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var hotelCubit = HotelCubit.get(context);
                return hotelCubit.hotelsCarousel.length != 0
                    ? CarouselSlider.builder(
                        itemCount: hotelCubit.hotelsCarousel.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return CardCarouselWidget(
                            hotel: hotelCubit.hotelsCarousel[itemIndex],
                          );
                        },
                        options: CarouselOptions(
                          height: 240,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    : ShimmerCustom(
                        child: CarouselSlider.builder(
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return CardCarouselWidget(
                              hotel: HotelModel(
                                id: '0',
                                title: 'Hotel Name',
                                description: 'Hotel Description',
                                price: 1200,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 240,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Hot Deals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            BlocConsumer<HotelCubit, HotelStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var hotelCubit = HotelCubit.get(context);
                return Column(
                  children: [
                    Center(
                      child: Wrap(
                        children: List.generate(
                          hotelCubit.hotels.length,
                          (index) => HotelCardWidget(
                            hotel: hotelCubit.hotels[index],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    hotelCubit.isLoading
                        ? Center(
                            child:
                                CircularProgressIndicator(color: primaryColor),
                          )
                        : !hotelCubit.hasMore
                            ? Text('No More Data to Load')
                            : Container(),
                  ],
                );
              },
            ),
            SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
