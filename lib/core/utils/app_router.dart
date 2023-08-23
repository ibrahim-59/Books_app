import 'package:clean/core/utils/functions/setup_service_locator.dart';
import 'package:clean/features/home/data/Models/book_model/book_model.dart';
import 'package:clean/features/home/data/repo/home_repo_impl.dart';
import 'package:clean/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean/features/home/presentation/views/book_details_view.dart';
import 'package:clean/features/home/presentation/views/home_view.dart';
import 'package:clean/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
