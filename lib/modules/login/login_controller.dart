import 'package:get/get.dart';

import 'package:app_filmes/services/login/login_service.dart';
import 'package:app_filmes/ui/loader/loader_mixin.dart';
import 'package:app_filmes/ui/messages/messages_mixin.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  final loading = false.obs;
  final message = Rxn<MessageModel>();
  @override
  void onInit() {
    super.onInit();
    loadListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);

      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
            title: 'Sucesso', message: 'Login realizado com sucesso!!'),
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
        MessageModel.error(
            title: 'Login Error', message: 'Erro ao realizar Login!!'),
      );
    }
  }
}
