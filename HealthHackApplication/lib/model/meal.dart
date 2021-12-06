class Meal {
  final String mealTime, name, imagePath, kiloCaloriesBurnt, timeTaken;
  final String preparation;
  final List ingredients;

  Meal({
    required this.mealTime,
    required this.name,
    required this.imagePath,
    required this.kiloCaloriesBurnt,
    required this.timeTaken,
    required this.preparation,
    required this.ingredients
  });
}

final meals = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Oat-Granola bars",
      kiloCaloriesBurnt: "260",
      timeTaken: "20 - 30",
      imagePath: 'assets/fruit_granola.jpg',
      ingredients: [
        "• 1 ¾ cups old-fashioned oats or quick-cooking oats ",
        "• 1 teaspoon ground cinnamon ",
        "• ½ teaspoon fine sea salt (if using regular table salt, scale back a bit) ",
        "• 2 cups mix-ins* (nuts, seeds, chocolate, shredded coconut or dried fruit)  ",
        "• 1 cup creamy peanut butter or almond butter ",
        "• ½ cup honey or maple syrup ",
        "• 1 teaspoon vanilla extract ",
      ],
      preparation:
      '''1. Line a 9-inch square baker with two strips of criss-crossed parchment paper, cut to fit neatly against the base and up the sides. The parchment paper will make it easy for you to slice the bars later. 

2. Place the oats in a large mixing bowl**. Add the cinnamon and salt, and stir to combine. Set aside. 

3. Now we’ll blitz the mix-ins briefly in the food processor or blender (or, you can chop them by hand). Add any large nuts (like almonds or pecans) first and blitz for a few seconds. Then add the rest and run the machine for a few more seconds, until the ingredients are all broken up into pieces smaller than your pinky nail. Pour the mix-ins into thebowl of oats. 

4. In a 2-cup liquid measuring cup, measure out the nut butter. Top with ½ cup honey and the vanilla extract. Stir until well blended. If you must, you can gently warm the liquid mixture on the stovetop or in the microwave, but make sure it’s close to room temperature before you pour it into the dry mixture (this is especially important if using chocolate, since it will melt). 

5. Pour the liquid ingredients into the dry ingredients. Use a big spoon to mix them together until the two are evenlycombined and no dry oats remain. This takes some arm muscles, but you can do it! If the mixture was easy to mix together, that’s a sign that you need to add some more oats—sprinkle in more oats until you can’t incorporate any more. 

6. Transfer the mixture to the prepared square baker. Use your spoon to arrange the mixture fairly evenly in the baker, then use the bottom of a flat, round surface (like a short, sturdy drinking glass) to pack the mixture down as firmly and evenly as possible. 

7. Cover the baker and refrigerate for at least one hour, or preferably overnight. (The oats need time to soak up some of the moisture so they aren’t sticky.) When you’re ready to slice, lift the bars out of the baker by grabbing both pieces of parchment paper on opposite corners. Use a sharp knife to slice the bars into 4 even columns and 4 even rows. 

8. Wrap individual bars in plastic wrap or parchment paper (if you store them all together, they will stick to one another). Bars keep well for several days at room temperature, a couple of weeks in the fridge, or several months in a freezer-safe bag in the freezer for best flavor.'''),
  Meal(
      mealTime: "DINNER",
      name: "Pesto Pasta",
      kiloCaloriesBurnt: "587",
      timeTaken: "30 - 40",
      imagePath: 'assets/pesto_pasta.jpg',
      ingredients: [
        "• 1 pound whole grain pasta (fusilli, rotini, penne or farfalle) ",
        "• 1 pint cherry tomatoes, halved or quartered ",
        "• 3 handfuls baby arugula or spinach",
        "• Optional cheese: Crumbled feta cheese, little mozzarella balls or diced mozzarella or grated Parmesan",
        "• Optional additions: 1/2 cup thinly sliced Kalamata olives and/or 1 can (15 ounces) chickpeas, rinsed and drained (or 1 1/2 cups cooked chickpeas)",
        "• Freshly ground black pepper",
        " ",
        "Pesto ingredients:",
        "• 1/2 cup pepitas (hulled pumpkin seeds)*",
        "• 1/2 cup packed fresh basil leaves ",
        "• 1/2 cup packed fresh flat-leaf parsley leaves",
        "• 1/4 cup lemon juice (about 2 lemons) ",
        "• 1 clove garlic, roughly chopped ",
        "• 1/2 teaspoon salt",
        "• 1/3 cup extra-virgin olive oil",
      ],
      preparation:
      '''1. Bring a large pot of salted water to boil for the pasta. Cook the pasta until al dente according to package directions. Before draining, reserve about 1/2 cup pasta cooking water, then drain and immediately rinse the pasta under cool water to prevent the noodles from sticking to one another. Transfer the pasta to a large serving bowl. 

2. Meanwhile, to prepare the pesto: In a small skillet, toast the pepitas over medium heat, stirring often, until they are fragrant and making little popping noises, about 5 minutes. Pour half of the pepitas into a bowl for later (we will use them as garnish). 

3. Pour the remaining pepitas into a food processor. Add the basil, parsley, lemon juice, garlic and salt. Process while slowly drizzling in the olive oil, stopping to scrape down the sides as necessary, until the pepitas have broken down to create a pretty smooth sauce. 

4. To assemble the pasta salad, pour all of the pesto over the pasta and toss until the pasta is lightly and evenly coated, adding a tiny splash of reserved pasta cooking water if necessary to thin it out. Then add the cherry tomatoes, arugula, remaining toasted pepitas, and any optional add-ins (olives, chickpeas and/or cheese). 

5. Toss again to combine, then season to taste with pepper. If the pasta needs more flavor, add salt, to taste, or a splash of lemon juice. If the flavors are too bold, let it rest for a few minutes, and add a little splash of olive oil if necessary to tone down the rest.'''),
  Meal(
      mealTime: "SNACK",
      name: "Keto Snack",
      kiloCaloriesBurnt: "63",
      timeTaken: "25 - 30",
      imagePath: 'assets/keto_snack.jpg',
      ingredients: [
        "1 cup of granola",
        "1 banana",
        "1/2 cup of raisins",
        "1 tbsp of honey",
      ],
      preparation:
      '''1. Preheat oven to 350°. Line two large baking sheets with parchment paper. 

2. In a microwave safe bowl, melt mozzarella, about 1 minute 30 seconds. Add almond flour, salt, garlic powder, chili powder, and a few cracks black pepper. Using your hands, knead dough a few times until a smooth ball forms. 

3. Place dough between two sheets of parchment paper and roll out into a rectangle ⅛” thick. Using a knife or pizza cutter, cut dough into triangles. 

4. Spread chips out on prepared baking sheets and bake until edges are golden and starting to crisp, 12 to 14 minutes. Guacamole Preparation: 

5. In a large bowl, combine avocados, lime juice, cilantro, onion, jalapeño and salt. 

6. Stir, then slowly turn the bowl as you run a fork through the avocados (this will ensure the mixture stays chunky). Once it's reached your desired consistency, season with more salt if needed. Garnish with more cilantro before serving. '''),
];
