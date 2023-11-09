import 'model.dart';

class CategoriesStates{}



class GetCategoriesLoadingState extends CategoriesStates{}
class GetCategoriesFailedState extends CategoriesStates{
  final String msg;
  GetCategoriesFailedState({required this.msg});
}
class GetCategoriesSuccessState extends CategoriesStates{
  final List<CategoryModel> list;
  GetCategoriesSuccessState({required this.list});
}


