import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_recipe_app_bloc/Models/custome_recipe_model.dart';
import 'package:food_recipe_app_bloc/widget/stylishTextField.dart';
import 'package:http/http.dart' as http;

class AddRecipes extends StatefulWidget {
  const AddRecipes({super.key});

  @override
  State<AddRecipes> createState() => _AddRecipesState();
}

class _AddRecipesState extends State<AddRecipes> {
  final _titleController = TextEditingController();
  final _servingsController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  void _submitData() async {
    List<String> items = [
      _titleController.text,
      _servingsController.text,
      _instructionsController.text
    ];
    String result = items.join(',');

    final data = {
      'title': result,
      "description": _ingredientsController.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(232, 255, 216, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(232, 255, 163, 5),
        title: Center(
            child: const Text(
          'Submit Recipe',
          style: TextStyle(
              fontSize: 22,
              fontFamily: AutofillHints.creditCardExpirationDay,
              fontWeight: FontWeight.w500),
        )),
      ),
      body: Container(
        color: Color.fromARGB(232, 255, 216, 149),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  StylishTextField(
                    controller: _titleController,
                    hintText: 'Title',
                    icon: Icons.title,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _servingsController,
                    hintText: 'Cooking Time',
                    icon: Icons.restaurant,
                    keyboardType: TextInputType.number,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cooking Time cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _ingredientsController,
                    hintText: 'Ingredients ',
                    icon: Icons.list,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingredients cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  StylishTextField(
                    controller: _instructionsController,
                    hintText: 'Instructions',
                    icon: Icons.description,
                    customvalidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Instructions cant be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print('sqqssssssssssssssss');
                        _submitData();
                        print('------------------222-------------');
                      }
                      _titleController.text = '';
                      _servingsController.text = '';
                      _ingredientsController.text = '';
                      _instructionsController.text = '';
                      setState(() {
                        _autoValidate = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<CustomeRecipeModel>> getCustomData() async {
  print('calling just ');
  final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
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
