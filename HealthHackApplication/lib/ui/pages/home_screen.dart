import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:healthhack/model/bmi.dart';
import 'package:healthhack/model/meal.dart';
import 'package:healthhack/model/radial_progress.dart';
import 'package:healthhack/ui/pages/workout_screen.dart';
import 'package:healthhack/ui/pages/meal_detail_screen.dart';
import 'package:healthhack/utils/utils.dart';
import 'package:intl/intl.dart';

import 'meal_detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final oneHundredPercent = 5000;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Column(
        children: <Widget>[
          Container(
            height: Get.height * 0.33,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                //it will be constant which will not have memory allocation again
                bottom: const Radius.circular(40),
              ),
              child: Container(
                //upper profile box
                color: Colors.white,
                padding: const EdgeInsets.only(
                    //margins for box
                    top: 5.5,
                    left: 32,
                    right: 16,
                    bottom: 10),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.5,
                            )),
                        subtitle: Text(
                          "Hello, ${Utils.getName}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        trailing:
                            ClipOval(child: Image.asset('assets/user.jpg')),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RadialProgress(
                            goalCompleted: (Utils.getCalorie / oneHundredPercent),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _IngredientProgress(
                                ingredient: "Protein",
                                progress: 0.2,
                                progressColor: Colors.green,
                                leftAmount: 72,
                                width: Get.width * 0.28,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              _IngredientProgress(
                                ingredient: "Carbs",
                                progress: 0.2,
                                progressColor: Colors.red,
                                leftAmount: 252,
                                width: Get.width * 0.28,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              _IngredientProgress(
                                ingredient: "Fat",
                                progress: 0.1,
                                progressColor: Colors.yellow,
                                leftAmount: 61,
                                width: Get.width * 0.28,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height * 0.55, //Not changed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 8,
                    left: 32,
                    right: 16,
                  ),
                  child: Text(
                    "MEALS FOR TODAY",
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  //Multiple cards of meals
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 28),
                        for (int i = 0;
                            i < meals.length;
                            i++) //printing meal cards
                          _MealCard(
                            meal: meals[i],
                          ),
                      ],
                    ),
                  ),
                ),
        //red container height
                Expanded(
                  child: OpenContainer(
                    closedElevation: 0,
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 1000),
                    closedColor: const Color(0xFFE9E9E9),
                    openBuilder: (context, _) {
                      return WorkoutScreen();
                    },
                    closedBuilder: (context, VoidCallback openContainer) {
                      return GestureDetector(
                        onTap: openContainer,
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 5, left: 32, right: 32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF20008B),
                                const Color(0xFF200087),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 20),
                                child: Text(
                                  "YOUR NEXT WORKOUT",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4.0, left: 16),
                                child: Text(
                                  "Upper Body",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    // This next line does the trick.

                                    children: <Widget>[
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/chest.png",
                                          width: 45,
                                          height: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/back.png',
                                          width: 45,
                                          height: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/biceps.png',
                                          width: 45,
                                          height: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key? key,
      required this.ingredient,
      required this.leftAmount,
      required this.progress,
      required this.progressColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _MealCard extends StatefulWidget {
  final Meal meal;

  _MealCard({Key? key, required this.meal}) : super(key: key);

  @override
  __MealCardState createState() => __MealCardState(meal: this.meal);
}

class __MealCardState extends State<_MealCard> {
  final Meal meal;

  __MealCardState({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
        //bottom:2,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: OpenContainer(
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                transitionDuration: const Duration(milliseconds: 1000),
                openBuilder: (context, _) {
                  return MealDetailScreen(
                    meal: meal,
                  );
                },
                closedBuilder: (context, openContainer) {
                  return GestureDetector(
                    onTap: openContainer,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 3),
                    Text(
                      meal.mealTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 10,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${meal.timeTaken} min",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
