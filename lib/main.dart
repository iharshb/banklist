import 'package:banklist/ui/banklist_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // When we navigate to the "/" route, build the BankList Screen Widget
          '/': (context) => BankListPage(),
        });
  }
}
