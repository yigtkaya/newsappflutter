import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/repository/news_repository.dart';

final class GetTopNewsUsecase {
  GetTopNewsUsecase(this._newsRepository);

  final NewsRepository _newsRepository;

  Future<Either<Failure, NewsResponse>> call({
    String? locale,
    int? limit,
    String? categories,
  }) async {
    return _newsRepository.getTopStories(
      locale: locale,
      limit: limit,
      categories: categories,
    );
  }
}
