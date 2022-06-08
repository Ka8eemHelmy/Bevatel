import 'package:bevatel/view/screens/calender_screen.dart';
import 'package:bevatel/view/screens/home_screen.dart';
import 'package:bevatel/view/screens/notification_screen.dart';
import 'package:bevatel/view/screens/profile_screen.dart';
import 'package:bevatel/view/screens/ticket_screen.dart';
import 'package:bevatel/view_model/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    CalenderScreen(),
    NotificationScreen(),
    HomeScreen(),
    TicketScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 2;

  void changeLanguage(bool langEN) {
    emit(ChangeLanguageState(langEN));
  }

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenState(index));
  }
}