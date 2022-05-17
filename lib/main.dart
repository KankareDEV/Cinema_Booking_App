import 'package:cinema_app/pages/homepage.dart';
import 'package:cinema_app/pages/moviedetailspage.dart';
import 'package:cinema_app/pages/movielistpage.dart';
import 'package:cinema_app/pages/splashpage.dart';
import 'package:cinema_app/services/movieselection.service.dart';
import 'package:cinema_app/services/seatselection.service.dart';
import 'package:cinema_app/services/ticketordering.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => MovieSelectionService()
        ),
        ChangeNotifierProvider(
          create: (_) => TicketOrderingService()
        ),
        ChangeNotifierProvider(
          create: (_) => SeatSelectionService()
        )
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Product Sans Regular',
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == "/home")
          return PageRouteBuilder(
            settings: RouteSettings(name: '/home'),
            pageBuilder: (_, __, ___) => HomePage(),
          transitionDuration: Duration.zero  
        );

        return null;
        },
      routes: {
        '/': (context) => MovieListPage(),
        '/movielist': (context) => MovieDetailsPage(),
        '/moviedetails': (context) => MovieDetailsPage(),
      }
    );
  }
}

