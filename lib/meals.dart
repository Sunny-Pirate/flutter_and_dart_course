import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh... Nothing here!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 16),
            Text('Try selecting a different categroy!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
          ],
        ),
      ),
    );

    if (meals.isNotEmpty) {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => Text(meals[index].title),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
