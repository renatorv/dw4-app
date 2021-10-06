import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/services/genres/genre_service.dart';
import 'package:app_filmes/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final _message = Rxn<MessageModel>();
  final GenreService _genreService;
  final genres = <GenreModel>[].obs;

  MoviesController({required GenreService genreService})
      : _genreService = genreService;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final genres = await _genreService.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(
        MessageModel.error(title: 'Erro', message: 'Erro ao buscar Categorias'),
      );
    }
  }
}
