import '../expense_repository.dart';

abstract class ExpenseRepo {
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategory();
}
