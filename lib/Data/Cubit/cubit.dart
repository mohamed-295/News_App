import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Data/Cubit/states.dart';
import 'package:myapp/Data/sevices/api_services.dart';
import 'package:myapp/ui/Screens/Business_Screen.dart';
import 'package:myapp/ui/Screens/General_News.dart';
import 'package:myapp/ui/Screens/sports_screen.dart';
import 'package:myapp/utils/app_constants.dart';
import 'package:myapp/utils/color_manager.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    GeneralNews(),
    SportsScreen(),
  ];
  void ChangeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label: "Business",
        icon: Icon(Icons.business, color: ColorManager.bottomNavBarItemColor)),
    BottomNavigationBarItem(
        label: "General",
        icon: Icon(Icons.add_chart, color: ColorManager.bottomNavBarItemColor)),
    BottomNavigationBarItem(
        label: "Sports",
        icon: Icon(Icons.sports, color: ColorManager.bottomNavBarItemColor)),
  ];

  List<dynamic> business = [];
  List<dynamic> general = [];
  List<dynamic> sports = [];

  void getBusiness() {
    emit(GetBusinessDataLoadingState());
    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apikey,
      "country": "eg",
      "category": "business",

    }).then((value) {
      // print(value.data["articles"][1]["title"]);
      business = value.data["articles"];
      emit(GetBusinessDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetBusinessDataErrorState(error.toString()));
    });
  }

  void getGeneral() {
    emit(GetGeneralDataLoadingState());
    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apikey,
      "country": "eg",
      "category": "general",
    }).then((value) {
      // print(value.data["articles"][1]["title"]);
      general = value.data["articles"];
      emit(GetGeneralDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetGeneralDataErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(GetSportsDataLoadingState());
    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apikey,
      "country": "eg",
      "category": "sports",
    }).then((value) {
      // print(value.data["articles"][1]["title"]);
      sports = value.data["articles"];
      emit(GetSportsDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetSportsDataErrorState(error.toString()));
    });
  }

}
