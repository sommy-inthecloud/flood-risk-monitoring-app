import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker picker = ImagePicker();

  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) {
      return null;
    }

    return File(image.path);
  }
}
