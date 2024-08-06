import 'package:flutter/material.dart';

class RecipeCardCustom extends StatelessWidget {
  final String title;
  final String cookingTime;
  final String ingredients;
  final String instructions;

  RecipeCardCustom(
      {required this.title,
      required this.cookingTime,
      required this.ingredients,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 249, 236, 210),
      margin: EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Cooking Time: ${cookingTime}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredients:${ingredients}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Instructions:${instructions}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
