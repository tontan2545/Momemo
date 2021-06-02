import 'package:budget_list/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/upper_curve.dart';
import '../widgets/total_card.dart';
import '../widgets/budget_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + 3),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: MainScreenBody(),
      backgroundColor: kBackgroundColor,
    );
  }
}

class MainScreenBody extends StatefulWidget {
  @override
  _MainScreenBodyState createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
  final Radius borders = Radius.circular(350);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          UpperCurve(size, 0.3, 0.1, 55),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "hello",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "John Doe",
                      style: Theme.of(context).textTheme.headline1,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                TotalCard(),
                SizedBox(height: size.height * 0.025),
                BudgetList(),
                SizedBox(height: size.height * 0.025),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
