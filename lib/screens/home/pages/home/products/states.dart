import 'model.dart';

class ProductStates{}

class GetProductsLoadingState extends ProductStates{}
class GetProductsFailedState extends ProductStates{
  final String msg;
  GetProductsFailedState({required this.msg});
}
class GetProductsSuccessState extends ProductStates{
  final List<ProductModel> list;
  GetProductsSuccessState({required this.list});
}