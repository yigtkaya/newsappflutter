import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/repository/news_repository.dart';

final class GetTopNewsUsecase {
  GetTopNewsUsecase(this._newsRepository);

  final NewsRepository _newsRepository;

  Future<Either<Failure, NewsResponse>> call({
    String? country,
    String? category,
    List<String>? sources,
    String? q,
    int? pageSize,
    int? page,
    String? language,
  }) async {
    return _newsRepository.getTopHeadlines(
      country: country,
      category: category,
      sources: sources,
      q: q,
      pageSize: pageSize,
      page: page,
      language: language,
    );
  }
}
