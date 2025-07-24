 
import 'package:get/get.dart';
import 'package:user_list_rest_api/view/screens/details/details_screen.dart';
import 'package:user_list_rest_api/view/screens/home/home_screen.dart';

class AppRoutes {
  
 
  //============= Home ==============
  static const String homeScreen = "/HomeScreen";
  static const String detailsScreen = "/DetailsScreen";
 

  static List<GetPage> routes = [
    

    //============= Home ==============
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: detailsScreen, page: () => DetailsScreen()),
 

    
  ];
}
