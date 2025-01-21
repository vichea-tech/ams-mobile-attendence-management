import 'package:attendance_app/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance App',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.teal,
        // Change the default primary color here
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
        // Button color based on the primary
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          ),
          labelStyle: TextStyle(
            color: Colors.blue.withOpacity(0.5)
          )
        ),
        // Accent color for widgets like FloatingActionButton, etc.
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.teal, // Set AppBar to the same color as primaryColor
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Customize text color
          bodyMedium: TextStyle(color: Colors.grey),
          bodySmall: TextStyle(color: Colors.white), // Title text in AppBar
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.greenAccent,
        // Different color for Dark Mode
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: ButtonThemeData(buttonColor: Colors.green),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.green,
        ),
        // Accent color for dark mode
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreenAccent,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.grey),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme (default)
    );
  }
}
