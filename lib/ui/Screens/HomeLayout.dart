import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Data/Cubit/cubit.dart';
import 'package:myapp/Data/Cubit/states.dart';
import 'package:myapp/Data/Cubit/theme_cubit.dart';

class Homelayout extends StatelessWidget {
  const Homelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getGeneral()
        ..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("News App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<ThemeCubit>().changeTheme();
                      },
                      icon: Theme(
                        data: ThemeData(
                          iconTheme: IconThemeData(
                            color: Colors.white,
                          ),
                        ),
                        child: Icon(Icons.brightness_2)))
                ],
              ),
              
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     ApiServices.getData(url: AppConstants.topHeadline, query: {
              //       "apiKey": AppConstants.apikey,
              //       "country": "eg",
              //       "category": "general",
              //     }).then((value) {
              //       print(value.data["articles"][1]["title"]);
              //     }).catchError((error) {
              //       debugPrint(error.toString());
              //     });
              //   },
              //   child: Icon(Icons.add),
              //   backgroundColor: ColorManager.bottomNavBarBackgroundColor,
              // ),
              bottomNavigationBar: BottomNavigationBar(
                // selectedItemColor: Colors.white,
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: ColorManager.bottomNavBarBackgroundColor,
                items: cubit.bottomItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.ChangeBottomNavBar(index);
                },
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          }),
    );
  }
}
