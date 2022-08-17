abstract class StateNews {}

class NewsInitialState extends StateNews {}

class ChangeNewsNavBarState extends StateNews {}

class NewsGetBusinessLoadingState extends StateNews {}

class NewsGetBusinessSuccessStates extends StateNews {}

class NewsGetBusinessErrorStates extends StateNews {
  late final error;
  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingState extends StateNews {}

class NewsGetSportsSuccessStates extends StateNews {}

class NewsGetSportsErrorStates extends StateNews {
  late final error;
  NewsGetSportsErrorStates(this.error);
}



class NewsGetScienceLoadingState extends StateNews {}

class NewsGetScienceSuccessStates extends StateNews {}

class NewsGetScienceErrorStates extends StateNews {
  late final error;
  NewsGetScienceErrorStates(this.error);
}

class NewsGetSearchLoadingState extends StateNews {}

class NewsGetSearchSuccessStates extends StateNews {}

class NewsGetSearchErrorStates extends StateNews {
  late final error;
  NewsGetSearchErrorStates(this.error);
}

