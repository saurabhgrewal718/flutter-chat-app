import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePicker extends StatefulWidget {
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(radius:45,backgroundColor: Colors.grey,backgroundImage: _pickedImage != null ? FileImage(_pickedImage) : null,),
        FlatButton.icon(
          onPressed: _pickImage,
          textColor: Theme.of(context).primaryColor ,
          icon: Icon(Icons.image), 
          label: Text('Add a Profile')),                  
      ]
            
    );
  }
}