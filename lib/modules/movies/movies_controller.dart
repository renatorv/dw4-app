import 'package:app_filmes/services/genres/genre_service.dart';
import 'package:app_filmes/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final message = Rxn<MessageModel>();
  final GenreService _genreService;

  MoviesController({required GenreService genreService})
      : _genreService = genreService;

  @override
  void onInit() {
    super.onInit();
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final genres = await _genreService.getGenres();
    } catch (e) {}
  }
}
