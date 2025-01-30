import 'package:attendance_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
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
        primaryColor: Colors.blue,
        // Change the default primary color here
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.teal),
        // Button color based on the primary
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          ),
          labelStyle: TextStyle(
            color: Colors.blue.withValues()
          )
        ),
        // Accent color for widgets like FloatingActionButton, etc.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Customize text color
          bodyMedium: TextStyle(color: Colors.grey),
          bodySmall: TextStyle(color: Colors.white), // Title text in AppBar
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.greenAccent,
        // Different color for Dark Mode
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.green),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Colors.green,
        ),
        // Accent color for dark mode
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.grey),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme (default)
    );
  }
}
