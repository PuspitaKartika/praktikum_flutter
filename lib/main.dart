import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_flutter/bloc/contact_cubit.dart';
import 'package:praktikum_flutter/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ContactCubit(),
      )
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));
  }
}

