import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/data/dummy_items.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your groceries')),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
            height: 24,
            width: 24,
            child: Container(
              decoration:
                  BoxDecoration(color: groceryItems[index].category.color),
            ),
          ),
          title: Text(
            groceryItems[index].name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        itemCount: groceryItems.length,
      ),
    );
  }
}
