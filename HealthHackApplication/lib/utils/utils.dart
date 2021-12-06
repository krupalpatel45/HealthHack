import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static late SharedPreferences preferences;

  // GET USER DEFAULT VARS
  static String get getName {
    return preferences.getString("Name") ?? "";
  }

  static String get getEmail {
    return preferences.getString("Email") ?? "";
  }

  static int get getCurrentWeight {
    return preferences.getInt('Current_Weight') ?? 0;
  }

  static int get getGoalWeight {
    return preferences.getInt('Goal_Weight') ?? 0;
  }

  static double get getBMI {
    return preferences.getDouble('BMI') ?? 0.0;
  }

  static int get getHeightFeet {
    return preferences.getInt('Height_Feet') ?? 0;
  }

  static int get getHeightInches {
    return preferences.getInt('Height_Inches') ?? 0;
  }

  static int get getCalorie {
    return preferences.getInt('ConsumeCal') ?? 0;
  }

  // SET USER DEFAULT VARS

  static void setName(String name) {
    preferences.setString('Name', name);
  }

  static void setEmail(String email) {
    preferences.setString('Email',email);
  }

  static void  setCurrentWeight(int weight) {
    preferences.setInt('Current_Weight',weight);
  }

  static void setGoalWeight(int weight) {
    preferences.setInt('Goal_Weight',weight);
  }

  static  void setBMI(double bmi) {
    preferences.setDouble('BMI',bmi);
  }

  static  void setHeightFeet(int feet) {
    preferences.setInt('Height_Feet',feet);
  }

  static  void setHeightInches(int inch) {
    preferences.setInt('Height_Inches',inch);
  }

  static void setCalorie(int calorie) {
    final cal = preferences.getInt('ConsumeCal') ?? 0;
    preferences.setInt('ConsumeCal', cal + calorie);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
