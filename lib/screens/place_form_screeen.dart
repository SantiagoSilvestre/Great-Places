import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreeen extends StatefulWidget {
  const PlaceFormScreeen({super.key});

  @override
  State<PlaceFormScreeen> createState() => _PlaceFormScreeenState();
}

class _PlaceFormScreeenState extends State<PlaceFormScreeen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    final title = _titleController.text;
    if (title.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      title,
      const PlaceLocation(
        latitude: 0.0,
        longitude: 0.0,
      ),
      _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ImageInput(onSelectedImage: _selectImage),
                    const SizedBox(height: 10),
                    const LocationInput()
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitForm,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor:
                  Colors.amber, // Replace with your desired background color
            ),
          ),
        ],
      ),
    );
  }
}
