import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/image_service.dart';
import '../../services/upload_service.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final descriptionController = TextEditingController();

  final locationController = TextEditingController();

  String severity = "Medium";

  File? selectedImage;

  final ImageService imageService = ImageService();

  final UploadService uploadService = UploadService();

  bool isUploading = false;

  @override
  void dispose() {
    descriptionController.dispose();

    locationController.dispose();

    super.dispose();
  }

  Future<void> submitReport() async {
    if (selectedImage == null) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a flood image first")),
      );

      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      final imageName = await uploadService.uploadImage(
        selectedImage!,

        description: descriptionController.text,

        severity: severity,

        location: locationController.text,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report uploaded successfully: $imageName")),
      );

      descriptionController.clear();

      locationController.clear();

      setState(() {
        selectedImage = null;

        severity = "Medium";
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Upload failed: $e")));
    } finally {
      if (mounted) {
        setState(() {
          isUploading = false;
        });
      }
    }
  }

  Future<void> pickFloodImage() async {
    final image = await imageService.pickImage();

    if (image != null && mounted) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report Flood")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Report a Flood Incident",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: pickFloodImage,

              icon: const Icon(Icons.photo_camera),

              label: const Text("Upload Flood Image"),
            ),

            const SizedBox(height: 20),

            if (selectedImage != null)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),

                    child: Image.file(
                      selectedImage!,

                      height: 220,

                      width: double.infinity,

                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    right: 10,

                    top: 10,

                    child: CircleAvatar(
                      backgroundColor: Colors.white,

                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),

                        onPressed: () {
                          setState(() {
                            selectedImage = null;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            TextField(
              controller: descriptionController,

              maxLines: 4,

              decoration: const InputDecoration(
                labelText: "Describe the situation",

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: severity,

              decoration: const InputDecoration(
                labelText: "Severity",

                border: OutlineInputBorder(),
              ),

              items: const [
                DropdownMenuItem(value: "Low", child: Text("Low")),

                DropdownMenuItem(value: "Medium", child: Text("Medium")),

                DropdownMenuItem(value: "High", child: Text("High")),
              ],

              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    severity = value;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: locationController,

              decoration: const InputDecoration(
                labelText: "Location",

                prefixIcon: Icon(Icons.location_on),

                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: isUploading ? null : submitReport,

                child: isUploading
                    ? const SizedBox(
                        height: 20,

                        width: 20,

                        child: CircularProgressIndicator(
                          color: Colors.white,

                          strokeWidth: 2,
                        ),
                      )
                    : const Text("SUBMIT REPORT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
