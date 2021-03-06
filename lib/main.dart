import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    //final provider = Provider.of<HomeViewModel>(context);
    //HomeViewModel provider = context.watch<HomeViewModel>();
    return Column(
      children: [
        Consumer<HomeViewModel>(
            builder: (context,provider,child){
              return Text("${provider.counter.counter}");
            },
        ),
        Text("${DateTime.now().millisecondsSinceEpoch}"),
        Consumer<HomeViewModel>(
          builder: (context,provider,child){
            return ElevatedButton(
                onPressed: (){
                  provider.onIncrement();
                },
                child: Text("Incease")
            );
          },
        )
      ],
    );
  }
}