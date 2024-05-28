import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/models/grocery_item.dart';
import 'package:flutter_and_dart_course/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    // If there no item from the newItem screen, just return
    if (newItem == null) return;
    // If there's an item then add it to the groceryItems array
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: _groceryItems.length == 0
          ? Center(
              child: Text('There\'s no items'),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) => ListTile(
                    title: Text(_groceryItems[index].name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: _groceryItems[index].category.color,
                    ),
                    trailing: Text(_groceryItems[index].quantity.toString()),
                  )),
    );
  }
}
