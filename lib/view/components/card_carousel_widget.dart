import 'package:bevatel/model/hotel_model.dart';
import 'package:bevatel/view/components/constant.dart';
import 'package:bevatel/view/components/rating_bar/rating_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardCarouselWidget extends StatelessWidget {
  HotelModel hotel;
  CardCarouselWidget({required this.hotel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              // 'https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              hotel.image ?? 'https://cdn.dribbble.com/users/1285194/screenshots/3805076/media/4db9ed184c9dbd845433e727e66f37db.png?compress=1&resize=400x300',
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 5.5,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.9,
                          child: Text(
                            // 'varius integer ac leo pellentesque',
                            hotel.title ?? '',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    RatingBarCustom(itemCount: 5, averageRating: hotel.rating ?? 0,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Saint Martin Island',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          color: black,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        // '\$2,600',
                        '\$${hotel.price ?? 0000}',
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      ' / Night',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 25,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
