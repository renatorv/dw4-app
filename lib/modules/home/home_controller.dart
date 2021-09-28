import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_INDEX = 2;
  final LoginService _loginService;

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  final _pages = ['/movies', '/favorites'];

  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int pagina) {
    _pageIndex(pagina);

    if (pagina == INDEX_PAGE_INDEX) {
      _loginService.logout();
    } else {
      Get.offNamed(_pages[pagina], id: NAVIGATOR_KEY);
    }
  }
}
