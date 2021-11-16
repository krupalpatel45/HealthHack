import 'package:flutter/material.dart';
import 'package:healthhack/model/meal.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 25,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(Icons.home),
              ),
              title: Text(
                "Home",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(

              icon: Padding( //potential BMI calculator in place.

                child: Icon(Icons.search),
                padding: const EdgeInsets.only(top: 4.0),
              ),


              title: Text(
                "BMI",
                style: const TextStyle(color: Colors.blueGrey),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                child: Icon(Icons.person),
                padding: const EdgeInsets.only(top: 4.0),
              ),
              title: Text(
                "Profile",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                //it will be constant which will not have memory allocation again
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            //center block
            top: height * 0.37,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6, //Not changed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4,
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
                  SizedBox(
                    height: 5.5,
                  ), //red container height
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 43, left: 32, right: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
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
                            padding: const EdgeInsets.only(top: 16.0, left: 20),
                            child: Text(
                              "YOUR NEXT WORKOUT",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 20),
                            child: Text(
                              "Upper Body",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: const Color(0xFF5B4D9D),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "chest.png",
                                    width: 35,
                                    height: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: const Color(0xFF5B4D9D),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "back.png",
                                    width: 35,
                                    height: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: const Color(0xFF5B4D9D),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "biceps.png",
                                    width: 35,
                                    height: 35,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  //A single meal card

  final Meal meal; //meal object in meal card

  const _MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Meal card scrolling because of container
      margin: const EdgeInsets.only(
        //gap between cards, space at bottom
        right: 30,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          //dividing the card into 2 sections
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  meal.imagePath,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        meal.mealTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.8,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${meal.kiloCaloriesBrunt} kcal",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 15,
                            color: Colors.black12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${meal.timeTaken} min",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
