import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Data/Cubit/bloc_observer.dart';
import 'package:myapp/Data/Cubit/theme_cubit.dart';
import 'package:myapp/Data/sevices/api_services.dart';
import 'package:myapp/ui/Screens/HomeLayout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeState,
          home: const Homelayout(),
        );
      },
    ),
    );
  }
}
