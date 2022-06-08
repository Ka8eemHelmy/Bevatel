import 'package:bevatel/view/components/constant.dart';
import 'package:bevatel/view_model/layout_cubit/layout_cubit.dart';
import 'package:bevatel/view_model/layout_cubit/layout_states.dart';
import 'package:bevatel/view_model/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LayoutScreen extends StatelessWidget {
  Widget widget;
  LayoutScreen({required this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var layoutCubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: grey,
          appBar: AppBar(
            backgroundColor: grey,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: black,
                size: 35,
              ),
              onPressed: () {},
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(10),
                width: 80,
                child: TextButton(
                  onPressed: () {
                    CacheHelper.put(key: 'langEN', value: !langEN);
                    langEN = CacheHelper.get(key: 'langEN');
                    layoutCubit.changeLanguage(langEN);
                  },
                  child: Text('${langEN ? 'EN' : 'AR'}'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.all(10),
                    backgroundColor: black,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              layoutCubit.screens[layoutCubit.currentIndex],
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: white,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: BottomNavigationBar(
                    selectedFontSize: 0,
                    backgroundColor: white,
                    currentIndex: layoutCubit.currentIndex,
                    elevation: 0,
                    onTap: (index) {
                      layoutCubit.changeScreen(index);
                    },
                    selectedItemColor: primaryColor,
                    selectedIconTheme: IconThemeData(
                      color: primaryColor,
                    ),
                    unselectedItemColor: black,
                    showSelectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                        backgroundColor: white,
                        icon: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        label: '',
                        activeIcon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: primaryColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.calendar_today_rounded,
                                size: 25,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: white,
                        icon: Icon(
                          Icons.notifications_none_rounded,
                        ),
                        label: '',
                        activeIcon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: primaryColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.notifications_none_rounded,
                                size: 25,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: white,
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                        label: '',
                        activeIcon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: primaryColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.home_outlined,
                                size: 25,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: white,
                        icon: Icon(
                          Icons.account_balance_wallet_rounded,
                        ),
                        label: '',
                        activeIcon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: primaryColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.account_balance_wallet_rounded,
                                size: 25,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: white,
                        icon: Icon(
                          Icons.person_outline_rounded,
                        ),
                        label: '',
                        activeIcon: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: primaryColor,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.person_outline_rounded,
                                size: 25,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
