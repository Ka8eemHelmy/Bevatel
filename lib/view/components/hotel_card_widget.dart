import 'package:bevatel/model/hotel_model.dart';
import 'package:bevatel/view/components/constant.dart';
import 'package:bevatel/view/screens/hotel_details_screen.dart';
import 'package:bevatel/view_model/navigation/navigation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HotelCardWidget extends StatelessWidget {
  HotelModel hotel;
  HotelCardWidget({required this.hotel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorTo(context, HotelDetailsScreen(hotelId: hotel.id!,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width / 2.3,
        height: 250,
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
                  Text(
                    // 'varius integer ac leo pellentesque',
                    hotel.title ?? '',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // 'Fx unsp tarsal bone(s) of l foot, subs for fx w delay heal',
                    hotel.description ?? '',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: primaryColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Sadia Arabia',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 35,
                            color: black,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          // '\$1,500',
                          '\$${hotel.price ?? '0'}',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 35,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        ' / Night',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35,
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
      ),
    );
  }
}
