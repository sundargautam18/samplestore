import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:samplestore/core/constants/data/products.dart';
import 'package:samplestore/features/flashsales/business/repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());
  Future<void> getProductList(String url) async {
    try {
      emit(ProductLoading());
      final productListEither = await productRepository.getProductList(url);

      productListEither.fold(
        (failure) => emit(ProductError(failure.errorMessage)),
        (productList) => emit(ProductSucess(productList)),
      );
    } catch (e) {
      emit(ProductError("Internal server error"));
    }
  }
}
