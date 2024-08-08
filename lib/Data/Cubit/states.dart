abstract class NewsStates {}

class NewsInitialState extends NewsStates {}


class ChangeBottomNavBarState extends NewsStates {}



class GetBusinessDataLoadingState extends NewsStates {}

class GetBusinessDataSuccessState extends NewsStates {}

class GetBusinessDataErrorState extends NewsStates {
  final String error;

  GetBusinessDataErrorState(this.error);
}


class GetGeneralDataLoadingState extends NewsStates {}

class GetGeneralDataSuccessState extends NewsStates {}

class GetGeneralDataErrorState extends NewsStates {
  final String error;

  GetGeneralDataErrorState(this.error);
}

class GetSportsDataLoadingState extends NewsStates {}

class GetSportsDataSuccessState extends NewsStates {}

class GetSportsDataErrorState extends NewsStates {
  final String error;

  GetSportsDataErrorState(this.error);
}

