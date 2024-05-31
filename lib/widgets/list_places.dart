import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/models/favorite_place.dart';
import 'package:flutter_and_dart_course/widgets/new_favorite_place.dart';

class ListPlaces extends StatefulWidget {
  const ListPlaces({super.key});

  @override
  State<ListPlaces> createState() => _ListPlacesState();
}

class _ListPlacesState extends State<ListPlaces> {
  final List<FavoritePlace> _favoritePlaces = [];

  void _addNewItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<FavoritePlace>(
        MaterialPageRoute(builder: (ctx) => const NewFavoritePlace()));

    if (newItem!.id.isNotEmpty) {
      setState(() {
        _favoritePlaces.add(newItem);
      });
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
              onPressed: () {
                _addNewItem(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: _favoritePlaces.length,
        itemBuilder: (ctx, index) =>
            ListTile(title: Text(_favoritePlaces[index].title)),
      ),
    );
  }
}
