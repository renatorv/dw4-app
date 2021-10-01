import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/repositories/genre/genre_repository_impl.dart';
import 'package:app_filmes/services/genres/genre_service.dart';
import 'package:app_filmes/services/genres/genre_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreRepositoryImpl>(
        () => GenreRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenreService>(() => GenreServiceImpl(genreRepository: Get.find()));

    Get.lazyPut(() => MoviesController(genreService: Get.find()));
  }
}
