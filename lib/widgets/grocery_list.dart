import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/data/categories.dart';
import 'package:flutter_and_dart_course/models/grocery_item.dart';
import 'package:flutter_and_dart_course/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  // bool _isLoading = true;
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
      'flutter-prep-f3b36-default-rtdb.europe-west1.firebasedatabase.app',
      '/shopping-list.json',
    );

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      // setState(() {
      //   _error = 'Failed to fetch data. Please try again later.';
      // });
      throw Exception('Failed to fecth groceries item. Please try again.');
    }

    // print(response.body);
    // Implementation of error handling is dependant to the backend you're using. This example is with Firebase
    if (response.body == 'null') {
      // setState(() {
      //   _isLoading = false;
      // });
      return [];
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (element) => element.value.label == item.value['category'])
          .value;
      loadedItems.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }
    return loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
      'flutter-prep-f3b36-default-rtdb.europe-west1.firebasedatabase.app',
      '/shopping-list/${item.id}.json',
    );
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: FutureBuilder(
          future: _loadedItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.data!.isEmpty) {
              const Center(
                child: Text('No items added yet'),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) => Dismissible(
                      key: ValueKey(snapshot.data![index].id),
                      onDismissed: (direction) {
                        _removeItem(snapshot.data![index]);
                      },
                      background: Container(
                        color: Colors.red,
                      ),
                      child: ListTile(
                        title: Text(snapshot.data![index].name),
                        leading: Container(
                          width: 24,
                          height: 24,
                          color: snapshot.data![index].category.color,
                        ),
                        trailing:
                            Text(snapshot.data![index].quantity.toString()),
                      ),
                    ));
          }),
    );
  }
}
