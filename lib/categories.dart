import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/data/dummy_data.dart';
import 'package:flutter_and_dart_course/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) => CategoryGridItem(
            category: availableCategories[index],
            key: ValueKey(availableCategories[index].id),
          ),
          itemCount: availableCategories.length,
        ),
      ),
    );
  }
}
