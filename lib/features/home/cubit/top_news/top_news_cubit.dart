import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/di/deoendecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/meta_model.dart';
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
    String? locale,
    int? limit,
    String? categories,
  }) async {
    safeEmit(TopNewsLoading());
    final result = await _getTopNewsUsecase.call(
      locale: locale,
      limit: limit,
      categories: categories,
    );

    result.fold(
      (failure) => safeEmit(TopNewsFailure(failure: failure)),
      (news) {
        cacheNews(NewsEntity(articles: news.data));
        safeEmit(TopNewsSuccess(news: news));
      },
    );
  }

  // Future<void> getSimilarNews({
  //   required String uuid,
  //   int? limit,
  // }) async {
  //   emit(NewsLoading());
  //   final result = await _getSimilarNewsUsecase.call(
  //     uuid: uuid,
  //     limit: limit,
  //   );

  //   result.fold(
  //     (failure) => emit(NewsFailure(failure: failure)),
  //     (news) => emit(NewsSuccess(news: news)),
  //   );
  // }

  Future<void> cacheNews(NewsEntity news) async {
    DepInItems.productCache.newsCacheOperation.add(news);
  }

  Future<void> loadCachedNews() async {
    final cachedNews = DepInItems.productCache.newsCacheOperation.get(
      'top_news_cache_key',
    );
    if (cachedNews != null) {
      safeEmit(
        TopNewsSuccess(
          news: NewsResponse(
            meta: Meta(
              page: 1,
              found: cachedNews.articles.length,
              returned: cachedNews.articles.length,
              limit: cachedNews.articles.length,
            ),
            data: cachedNews.articles,
          ),
        ),
      );
      return;
    }

    // call getAllNews if no cached news
    await getTopNews(
      locale: 'tr',
      limit: 3,
    );
  }
}
