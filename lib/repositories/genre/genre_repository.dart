import 'package:app_filmes/models/genre_model.dart';

abstract class GenreRepository {
  Future<List<GenreModel>> getGenres();
}
