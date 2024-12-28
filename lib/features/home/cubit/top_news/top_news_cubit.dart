import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/di/dependecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/entities/news_entity.dart';
import 'package:newsappflutter/features/home/domain/usecases/get_top_news_usecase.dart';

part 'top_news_state.dart';

final class TopNewsCubit extends BaseCubit<TopNewsState> {
  TopNewsCubit(
    this._getTopNewsUsecase,
  ) : super(TopNewsInitial()) {
    loadCachedNews();
  }

  final GetTopNewsUsecase _getTopNewsUsecase;

  Future<void> getTopNews({
    String? country, // 2-letter ISO 3166-1 code
    String? category, // Can be: business,entertainment,general,health,science,
    List<String>? sources,
    String? q,
    int? pageSize = 20, // Default 100, maximum 100
    int? page = 1,
    String? language, // 2-letter ISO-639-1 code
  }) async {
    // Cannot mix sources parameter with country or category parameters
    if (sources != null && (country != null || category != null)) {
      safeEmit(
        TopNewsFailure(
          failure: Failure(
            message: 'Cannot mix sources parameter with country or category parameters',
            code: 'INVALID_PARAMS',
          ),
        ),
      );
      return;
    }

    safeEmit(TopNewsLoading());
    final result = await _getTopNewsUsecase.call(
      country: country,
      category: category,
      sources: sources,
      q: q,
      pageSize: pageSize?.clamp(1, 100),
      page: page,
      language: language,
    );

    result.fold(
      (failure) => safeEmit(TopNewsFailure(failure: failure)),
      (news) {
        cacheNews(
          NewsEntity(
            articles: news.articles ?? [],
            id: 'top_news_cache_key',
          ),
        );
        safeEmit(TopNewsSuccess(news: news));
      },
    );
  }

  Future<void> cacheNews(NewsEntity news) async {
    DepInItems.productCache.topNewsCacheOperation.add(news);
  }

  Future<void> loadCachedNews() async {
    final cachedNews = DepInItems.productCache.topNewsCacheOperation.get(
      'top_news_cache_key',
    );
    if (cachedNews != null) {
      safeEmit(
        TopNewsSuccess(
          news: NewsResponse(
            articles: cachedNews.articles,
          ),
        ),
      );
      return;
    }

    // call getTopNews if no cached news with default parameters
    await getTopNews(
      country: 'us',
      category: 'general',
      pageSize: 20,
      page: 1,
    );
  }
}
