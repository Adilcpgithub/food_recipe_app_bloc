import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app_bloc/Blocs/bloc/MyRecipeBloc/bloc/my_recipe_bloc.dart';
import 'package:food_recipe_app_bloc/Cards/custome_recipe_card.dart';
import 'package:food_recipe_app_bloc/Models/custome_recipe_model.dart';
import 'package:food_recipe_app_bloc/Pages/add_recipe_page.dart';

// class RecipeListScreen extends StatefulWidget {
//   @override
//   State<RecipeListScreen> createState() => _RecipeListScreenState();
// }

// class _RecipeListScreenState extends State<RecipeListScreen> {
//   List<CustomeRecipeModel> customRecipes = [];
//   @override
//   void initState() {
//     fff();
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text('My Recipes'))),
//       body: RefreshIndicator(
//         onRefresh: () {
//           return fff();
//         },
//         child: ListView.builder(
//           itemCount: customRecipes.length,
//           itemBuilder: (context, index) {
//             final data = customRecipes[index];
//             return GestureDetector(
//               onTap: () {
//                 deletData(data.id);
//               },
//               child: RecipeCardCustom(
//                 title: data.title,
//                 cookingTime: data.cookingTime,
//                 ingredients: data.ingredients,
//                 instructions: data.instructions,
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           fff();
//           setState(() {});
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   fff() async {
//     customRecipes = await getCustomData();
//     setState(() {});
//   }
// }

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(232, 255, 163, 5),
          title: Center(
              child: Text(
            'My Recipes',
            style: TextStyle(
                fontSize: 22,
                fontFamily: AutofillHints.creditCardExpirationDay,
                fontWeight: FontWeight.w500),
          ))),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MyRecipeBloc>().add(MyRecipeEvent.fetEntries);
        },
        child: BlocBuilder<MyRecipeBloc, MyRecipeState>(
            builder: ((context, state) {
          if (state is MyRecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MyRecipeLoaded) {
            return ListView.builder(
              itemCount: state.customRecipes.length,
              itemBuilder: (context, index) {
                final data = state.customRecipes[index];
                return GestureDetector(
                  onTap: () {
                    // Handle tap event
                  },
                  child: RecipeCardCustom(
                    title: data.title,
                    cookingTime: data.cookingTime,
                    ingredients: data.ingredients,
                    instructions: data.instructions,
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load data'));
          }
        })),
      ),
    );
  }
}
