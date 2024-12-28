import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/di/dependecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/entities/news_entity.dart';
import 'package:newsappflutter/features/home/domain/usecases/get_all_news_usecase.dart';

part 'news_state.dart';

final class NewsCubit extends BaseCubit<NewsState> {
  NewsCubit(
    this._getAllNewsUsecase,
  ) : super(NewsInitial()) {
    loadCachedNews();
  }

  final GetAllNewsUsecase _getAllNewsUsecase;

  Future<void> getAllNews({
    required String q,
    List<String>? searchIn,
    List<String>? sources,
    List<String>? domains,
    List<String>? excludeDomains,
    DateTime? from,
    DateTime? to,
    String? language,
    String? sortBy,
    int? pageSize = 20,
    int? page = 1,
  }) async {
    safeEmit(NewsLoading());
    final result = await _getAllNewsUsecase.call(
      q: q,
      searchIn: searchIn,
      sources: sources,
      domains: domains,
      excludeDomains: excludeDomains,
      from: from,
      to: to,
      language: language,
      sortBy: sortBy ?? 'publishedAt',
      pageSize: pageSize?.clamp(1, 100),
      page: page,
    );

    result.fold(
      (failure) => safeEmit(NewsFailure(failure: failure)),
      (news) {
        cacheNews(
          NewsEntity(
            articles: news.articles ?? [],
            id: 'news_cache_key',
          ),
        );
        safeEmit(NewsSuccess(news: news));
      },
    );
  }

  Future<void> cacheNews(NewsEntity news) async {
    DepInItems.productCache.newsCacheOperation.add(news);
  }

  Future<void> loadCachedNews() async {
    final cachedNews = DepInItems.productCache.newsCacheOperation.get(
      'news_cache_key',
    );
    if (cachedNews != null) {
      safeEmit(
        NewsSuccess(
          news: NewsResponse(
            articles: cachedNews.articles,
          ),
        ),
      );
      return;
    }

    // call getAllNews if no cached news with default parameters
    await getAllNews(
      q: 'news',
      language: 'en',
      sortBy: 'publishedAt',
    );
  }
}
