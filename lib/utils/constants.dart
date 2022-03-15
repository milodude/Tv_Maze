///Class to be used  in order to have all strings in one place and re use them
class Constants{
  ///Gridview Key
  static const String gridViewCardKey = 'grid_view_card_Key';
  ///Gridview Key
  static const String gridViewExpandedKey = 'Expanded_show_grid_view_key';
  ///Gridview Key
  static const String gridViewTileKey = 'grid_view_tile_Key';
  ///Gridview Key
  static const String gridViewInkwellKey = 'grid_view_inkwell_Key'; 
  ///Floating action button Key
  static const String backFloatingActionButtonKey = 'back_action_button_key';
  
  //Bloc
  ///Bloc error message
  static const String blocErrorText = 'Something went wrong!'; 
  ///Bloc error while loading message
  static const String blocErrorWhileLoadingText = 'Error while loading '; 
  // you may add the bloc name at the end to be more specific

  //route names
  ///Route name for landing page
  static const String homePageRouteName = '/';
  ///Route name for search show page
  static const String searchShowPageRouteName = '/searchShowPage';
  ///Route name for show episodes page
  static const String showEpisodesPageRouteName = '/showEpisodes';
  ///Route name for show details page
  static const String showDetailsPageRouteName = '/showDetails';

  //images
  ///Image size medium
  static const String imageSizeMedium = 'medium';
  ///Image size Original
  static const String imageSizeOriginal = 'original';
  ///Path to unavailable picture in assets folder
  static const String imageUnavailablePath = 'assets/images/unavailable-image.jpg';

  //show
  ///Show status Ended
  static const String showStatusEnded = 'Ended';
   ///Show status To Be Determined
  static const String showStatusToBeDetermined = 'To Be Determined';
   ///Show schedule field days
  static const String showScheduleDays = 'days';
   ///Show schedule field time
  static const String showScheduleTime = 'time';

  //details
  ///No results Title
  // ignore: lines_longer_than_80_chars
  static const String showSearchNoReultsTitle = 'Aw! No shows found for the input.';
   ///No results SubTititle
   // ignore: lines_longer_than_80_chars
  static const String showSearchNoReultsSubtitle = 'Please try with another show';
}