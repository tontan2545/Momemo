import 'package:budget_list/constant.dart';
import 'package:budget_list/providers/budget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './screens/main_screen.dart';
import './providers/budgets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: kLightBlue,
    systemNavigationBarColor: kBackgroundColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Budgets>(
          create: (_) => Budgets(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget List',
        theme: ThemeData(
            fontFamily: 'Poppins',
            textTheme: TextTheme(
                headline1: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 0.9,
                ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                headline2: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF525252),
                ),
                subtitle2: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF525252),
                ),
                bodyText1: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF525252),
                )),
            primaryColor: Color(0xFF93B6C9),
            accentColor: Color(0xFFEBE5E1),
            backgroundColor: Theme.of(context).accentColor),
        home: MainScreen(),
      ),
    );
  }
}
