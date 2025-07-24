import 'dart:convert';

import 'package:get/get.dart';
import 'package:user_list_rest_api/service/api_client.dart';
import 'package:user_list_rest_api/service/api_url.dart';
import 'package:user_list_rest_api/utils/ToastMsg/toast_message.dart';
import 'package:user_list_rest_api/view/screens/home/model/all_actor_list_model.dart';

class HomeController extends GetxController {
  Rx<RxStatus> allActorListStatus = Rx<RxStatus>(RxStatus.loading());
  RxList<ActorListModel> actorList = <ActorListModel>[].obs;

  @override
  void onInit() {
    getAllActorList();
    super.onInit();
  }

  Future<void> getAllActorList() async {
    allActorListStatus.value = RxStatus.loading();
    try {
      final response = await ApiClient.getData(ApiUrl.characters);

      if (response.statusCode == 200 || response.statusCode == 201) {
        actorList.value = actorListModelFromJson(jsonEncode(response.body));
        allActorListStatus.value = RxStatus.success();
      } else {
        allActorListStatus.value = RxStatus.error();
        showCustomSnackBar(
          response.body['message'] ?? 'Something went wrong',
          isError: true,
        );
      }
    } catch (e) {
      allActorListStatus.value = RxStatus.error();
      showCustomSnackBar('Error: $e', isError: true);
    }
  }
}
