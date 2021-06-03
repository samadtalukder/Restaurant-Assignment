import 'package:get/state_manager.dart';
import 'package:restarurent_assignment/model/ResponseMenuItem.dart';
import 'package:restarurent_assignment/services/api_service.dart';

class MenuController extends GetxController {
  var isLoading = false.obs;
  var menuItemList = List<ResponseMenuItem>().obs;

  @override
  void onInit() {
    fetchMenuListItem();
    super.onInit();
  }

  Future<void> fetchMenuListItem() async {
    try {
      isLoading(true);

      var menu = await APIService.fetchMenuItems();
      if (menu != null) {
        isLoading(false);
        menuItemList.value = menu;
      }
    } catch (ex) {
      isLoading(false);
      ex.toString();
    }
  }
}
