import 'package:app_filmes/ui/loader/loader_mixin.dart';
import 'package:app_filmes/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  @override
  void onInit() {
    super.onInit();
    loadListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    loading(true);
    await 2.seconds.delay();
    loading(false);
    message(
      MessageModel.error(title: 'Titulo Erro', message: 'Message Erro'),
    );
  }
}
