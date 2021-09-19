import 'package:app_filmes/ui/loader/loader_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin {
  final loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadListener(loading);
  }

  Future<void> login() async {
    loading(true);
    await 2.seconds.delay();
    loading(false);
  }
}
