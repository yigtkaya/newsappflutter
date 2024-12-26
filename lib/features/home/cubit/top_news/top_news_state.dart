part of 'top_news_cubit.dart';

sealed class TopNewsState extends BaseState {
  const TopNewsState();

  @override
  List<Object?> get props => [];
}

final class TopNewsInitial extends TopNewsState {}

final class TopNewsLoading extends TopNewsState {}

final class TopNewsSuccess extends TopNewsState {
  const TopNewsSuccess({
    required this.news,
  });

  final NewsResponse news;

  @override
  List<Object?> get props => [news];
}

final class TopNewsFailure extends TopNewsState {
  const TopNewsFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
