import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_form_screeen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white),
            backgroundColor: Colors.indigo,
            actionsIconTheme: IconThemeData(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreeen(),
        },
      ),
    );
  }
}
