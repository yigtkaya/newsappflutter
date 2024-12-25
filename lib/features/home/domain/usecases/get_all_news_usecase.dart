import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/repository/news_repository.dart';

final class GetAllNewsUsecase {
  GetAllNewsUsecase(this._newsRepository);

  final NewsRepository _newsRepository;

  Future<Either<Failure, NewsResponse>> call({
    String? locale,
    int? limit,
    String? categories,
    String? search,
    int? page,
  }) async {
    return _newsRepository.getAllNews(
      locale: locale,
      limit: limit,
      categories: categories,
      search: search,
      page: page,
    );
  }
}
