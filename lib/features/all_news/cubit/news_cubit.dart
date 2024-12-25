import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/di/deoendecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/all_news/data/models/response/meta_model.dart';
import 'package:newsappflutter/features/all_news/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/all_news/domain/entities/news_entity.dart';
import 'package:newsappflutter/features/all_news/domain/usecases/get_all_news_usecase.dart';

part 'news_state.dart';

final class NewsCubit extends BaseCubit<NewsState> {
  NewsCubit(
    this._getAllNewsUsecase,
  ) : super(NewsInitial()) {
    loadCachedNews();
  }

  final GetAllNewsUsecase _getAllNewsUsecase;

  Future<void> getAllNews({
    String? locale,
    int? limit,
    String? categories,
    String? search,
    int? page,
  }) async {
    emit(NewsLoading());
    final result = await _getAllNewsUsecase.call(
      locale: locale,
      limit: limit,
      categories: categories,
      search: search,
      page: page,
    );

    result.fold(
      (failure) => emit(NewsFailure(failure: failure)),
      (news) {
        cacheNews(NewsEntity(articles: news.data));
        emit(NewsSuccess(news: news));
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
      'news_cache_key',
    );
    if (cachedNews != null) {
      emit(
        NewsSuccess(
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
    }
  }
}
