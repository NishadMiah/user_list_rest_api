import '../../service/api_url.dart';
import '../../utils/app_const/app_const.dart';

class ImageHandler {
  static String imagesHandle(String? url) {
    if (url == null || url.isEmpty) {
      return AppConstants.profileImage;
    }

    if (url.startsWith('http')) {
      return url; // If the URL starts with 'http', return as is
    } else {
      return ApiUrl.imageUrl + url;
    }
  }
}
