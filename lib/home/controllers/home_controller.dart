import 'package:e_commerce_app/home/models/home_response.dart';
import 'package:e_commerce_app/home/service/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Product>> {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  void getHomeData() async {
    change([], status: RxStatus.loading());
    try {
      List<Product> products = await HomeService.getHomeData();
      productList.value = products;
      change(products, status: RxStatus.success());
      Get.snackbar(
        "Success",
        "Products loaded successfully!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      change(null, status: RxStatus.error('Failed to load products.'));
    }
  }
}
