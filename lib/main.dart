import 'package:bevatel/view/components/constant.dart';
import 'package:bevatel/view/screens/layout/layout_screen.dart';
import 'package:bevatel/view_model/hotel_cubit/hotel_cubit.dart';
import 'package:bevatel/view_model/layout_cubit/layout_cubit.dart';
import 'package:bevatel/view_model/layout_cubit/layout_states.dart';
import 'package:bevatel/view_model/network/local/cache_helper.dart';
import 'package:bevatel/view_model/network/network/dio-helper.dart';
import 'package:bevatel/view_model/observer/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);

  //Initialize DioHelper and CashHelper to Run.
  await DioHelper.init();
  await CacheHelper.init();

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) => HotelCubit()
            ..fetch()..getHotelsCarousel(page: 1, limit: 5),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Directionality(
              textDirection: langEN ? TextDirection.ltr : TextDirection.rtl,
              child: LayoutScreen(
                widget: Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}
