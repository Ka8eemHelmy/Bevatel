import 'package:bevatel/view_model/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF12b6fb);
Color white = Colors.white;
Color black = Colors.black;
Color grey = Color(0xFFf6f9fe);

Color greyText = Color(0xFF979797);

bool langEN = CacheHelper.get(key: 'langEN') ?? true;