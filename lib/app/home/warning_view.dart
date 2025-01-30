import 'package:attendance_app/app/home/warning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarningView extends StatelessWidget {
  WarningView({super.key});

  final RxString selectedType = "class".obs; // Default selection
  final WarningController controller = Get.find(); // Find the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warning"),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Fix overflow issue
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Add some space from the top

              // Warning Icon and Message
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                "This room is not your class",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Dropdown for class type selection
              Obx(() => DropdownButtonFormField<String>(
                value: ["makeup", "other"].contains(selectedType.value)
                    ? selectedType.value
                    : null, // Ensures valid value
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Select Class Type",
                ),
                items: ["makeup", "other"]
                    .map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedType.value = value;
                  }
                },
              )),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  controller.submit(selectedType.value); // Pass selected type to submit()
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
