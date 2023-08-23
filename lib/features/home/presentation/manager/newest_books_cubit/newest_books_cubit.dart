import 'package:bloc/bloc.dart';
import 'package:clean/features/home/data/Models/book_model/book_model.dart';
import 'package:clean/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(
        NewestBooksFailure(failure.message),
      ),
      (books) => emit(
        NewestBooksSuccess(books),
      ),
    );
  }
}
