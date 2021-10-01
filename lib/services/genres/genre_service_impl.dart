import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genre/genre_repository.dart';

import './genre_service.dart';

class GenreServiceImpl implements GenreService {
  final GenreRepository _genreRepository;

  GenreServiceImpl({required GenreRepository genreRepository})
      : _genreRepository = genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
