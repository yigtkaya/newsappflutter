part of 'news_cubit.dart';

sealed class NewsState extends BaseState {
  const NewsState();

  @override
  List<Object?> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  const NewsSuccess({
    required this.news,
  });

  final NewsResponse news;

  @override
  List<Object?> get props => [news];
}

final class NewsFailure extends NewsState {
  const NewsFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
