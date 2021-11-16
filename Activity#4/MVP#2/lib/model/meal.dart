class Meal {
  final String mealTime, name, imagePath, kiloCaloriesBrunt, timeTaken;

  Meal({
    this.mealTime,
    this.name,
    this.imagePath,
    this.kiloCaloriesBrunt,
    this.timeTaken,
  });
}

final meals = [ //array of 3 meals
  Meal(
    mealTime: "BREAKFAST",
    name: "Fruit Granola",
    kiloCaloriesBrunt: "271",
    timeTaken: "10",
    imagePath: "fruit_granola.jpg",
  ),
  Meal(
    mealTime: "DINNER",
    name: "Pesto Pasta",
    kiloCaloriesBrunt: "612",
    timeTaken: "15",
    imagePath: "pesto_pasta.jpg",
  ),
  Meal(
    mealTime: "SNACK",
    name: "Keto Snack",
    kiloCaloriesBrunt: "414",
    timeTaken: "16",
    imagePath: "keto_snack.jpg",
  ),
];
