import 'package:bevatel/view/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class RatingBarCustom extends StatelessWidget {
  int itemCount;
  bool enable;
  dynamic averageRating;
  bool showText;
  double itemSize;
  double minRate;
  Function(double rate)? currentRate;

  RatingBarCustom(
      {required this.itemCount,
      required this.averageRating,
      this.enable = false,
      this.showText = true,
      this.itemSize = 15,
      this.minRate = 0.5,
      this.currentRate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          minRating: minRate,
          ignoreGestures: !enable,
          itemSize: itemSize,
          initialRating: double.parse('$averageRating'),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: itemCount,
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          unratedColor: Color(0xffECEFF1),
          itemBuilder: (context, _) => Icon(
            Icons.star_rate_rounded,
            color: primaryColor,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
            currentRate == null ? null : currentRate!(rating);
          },
        ),
        if (showText)
          Text(
            averageRating is int ? '${averageRating}.0' : '${averageRating}',
            style: TextStyle(
              color: greyText,
              fontSize: 12,
              // fontWeight: FontWeight.w500,
            ),
          )
      ],
    );
  }
}
