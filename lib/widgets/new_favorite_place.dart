import 'package:flutter/material.dart';
import 'package:flutter_and_dart_course/models/favorite_place.dart';

class NewFavoritePlace extends StatefulWidget {
  const NewFavoritePlace({super.key});

  @override
  State<NewFavoritePlace> createState() => _NewFavoritePlaceState();
}

class _NewFavoritePlaceState extends State<NewFavoritePlace> {
  final _formKey = const ObjectKey(FormState);
  final _fieldTitleController = TextEditingController(); // Create a controller

  void _savePlace() {
    final title = _fieldTitleController.text;
    final newPlace = FavoritePlace(id: DateTime.now().toString(), title: title);
    Navigator.of(context).pop(newPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fieldTitleController, // Assign the controller
                decoration: const InputDecoration(label: Text('title')),
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                label: const Text('Add place'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
