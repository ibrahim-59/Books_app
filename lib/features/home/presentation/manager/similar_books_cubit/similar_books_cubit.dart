import 'package:bloc/bloc.dart';
import 'package:clean/features/home/data/Models/book_model/book_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(
        SimilarBooksFailure(failure.message),
      ),
      (books) => emit(
        SimilarBooksSuccess(books),
      ),
    );
  }
}
