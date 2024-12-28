import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/repository/news_repository.dart';

final class GetAllNewsUsecase {
  GetAllNewsUsecase(this._newsRepository);

  final NewsRepository _newsRepository;

  Future<Either<Failure, NewsResponse>> call({
    String? q,
    List<String>? searchIn,
    List<String>? sources,
    List<String>? domains,
    List<String>? excludeDomains,
    DateTime? from,
    DateTime? to,
    String? language,
    String? sortBy,
    int? pageSize,
    int? page,
  }) async {
    return _newsRepository.getEverything(
      q: q,
      searchIn: searchIn,
      sources: sources,
      domains: domains,
      excludeDomains: excludeDomains,
      from: from,
      to: to,
      language: language,
      sortBy: sortBy,
      pageSize: pageSize,
      page: page,
    );
  }
}
