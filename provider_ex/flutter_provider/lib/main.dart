import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/feature/login/view/login_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider(create: ((context) => UserContext('A')),)
      ],
      child: MaterialApp(
        title: 'Material App',
        home: const LoginView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.redAccent)),
      ),
    );
  }
}
