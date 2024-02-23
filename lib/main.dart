import 'package:flutter/material.dart';
import 'package:flutter_drag_drop/providers/phone_provider.dart';
import 'package:flutter_drag_drop/providers/ui_provider.dart';
import 'package:flutter_drag_drop/ui/pages/principal_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)=>UIProvider()),ChangeNotifierProvider(create: (_)=>PhoneProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Onest"),
      initialRoute: "/",
      routes: {"/": (_) => const PrincipalPage()},
    ),
  ));
}
