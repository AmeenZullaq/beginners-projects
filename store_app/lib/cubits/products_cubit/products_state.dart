part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccess extends ProductsState {}

class ProductsFailer extends ProductsState {}

class ProductsLoading extends ProductsState {}
