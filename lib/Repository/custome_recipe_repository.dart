import 'dart:convert';
import 'package:food_recipe_app_bloc/Models/custome_recipe_model.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipe_app_bloc/Models/recipe_model_online.dart';

class CustomRecipeRepository {
  Future<List<CustomeRecipeModel>> getCustomData() async {
    print('calling just ');
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    // final uri = Uri.parse(url);
    final response =
        await http.get(Uri.parse(url), headers: {"accept": "application/json"});
    final data = await jsonDecode(response.body) as Map<String, dynamic>;

    List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(data['items']);
    List<CustomeRecipeModel> customRecipes = [];

    for (var datas in items) {
      String typesOfData = datas['title'] ?? '';

      String ingredients = datas['description'] ?? '';
      List<String> splitedData = typesOfData.split(',');

      if (splitedData.length == 3) {
        customRecipes.add(CustomeRecipeModel(
            id: datas['_id'],
            title: splitedData[0],
            cookingTime: splitedData[1],
            ingredients: ingredients,
            instructions: splitedData[2]));
      }
    }
    print(']]]]]]]]]]]]]]]${customRecipes.length}');
    if (customRecipes.length <= 0) {
      print('you data not failed');
    } else {
      print('you have data');
    }
    return customRecipes;
  }

  Future<void> PostCustomData(
      {required String title,
      required String cookingTime,
      required String instruction,
      required String ingredients}) async {
    List<String> items = [title, cookingTime, instruction];
    String result = items.join(',');
    final data = {
      'title': result,
      "description": ingredients,
      "is_completed": false
    };
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(data), headers: {
      "accept": "application/json",
      "Content-Type": "application/json"
    });
    print(response.statusCode);
    print(response.body);
  }

  Future<bool> deletData(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final response = await http
        .delete(Uri.parse(url), headers: {"accept": "application/json"});
    if (response.statusCode == 200) {
      print(true);
      return true;
    }
    print(false);
    return false;
  }
}
