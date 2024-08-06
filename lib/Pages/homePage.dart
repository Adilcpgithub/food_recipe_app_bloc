import 'package:flutter/material.dart';
import 'package:food_recipe_app_bloc/Cards/custome_recipe_card.dart';
import 'package:food_recipe_app_bloc/Models/custome_recipe_model.dart';
import 'package:food_recipe_app_bloc/Pages/add_recipe_page.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<CustomeRecipeModel> customRecipes = [];
  @override
  void initState() {
    fff();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Recipes'))),
      body: RefreshIndicator(
        onRefresh: () {
          return fff();
        },
        child: ListView.builder(
          itemCount: customRecipes.length,
          itemBuilder: (context, index) {
            final data = customRecipes[index];
            return GestureDetector(
              onTap: () {
                deletData(data.id);
              },
              child: RecipeCardCustom(
                title: data.title,
                cookingTime: data.cookingTime,
                ingredients: data.ingredients,
                instructions: data.instructions,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fff();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  fff() async {
    customRecipes = await getCustomData();
    setState(() {});
  }
}
