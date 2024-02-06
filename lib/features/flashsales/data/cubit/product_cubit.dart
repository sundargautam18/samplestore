import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplestore/core/connection/network_info.dart';
import 'package:samplestore/core/injection/injection_container.dart';
import 'package:samplestore/core/logger/pretty_logger.dart';
import 'package:samplestore/features/flashsales/business/modal/product.dart';

import 'package:samplestore/features/flashsales/business/repository/product_repository.dart';
import 'package:samplestore/features/flashsales/data/repository/product_local_repo_impl.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;
  ProductCubit(this.productRepository) : super(ProductInitial());

  Future<void> deleteProduct() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(ProductDeleteSucess());
    } catch (e) {
      emit(ProductError("Unable to delte product"));
    }
  }

  Future<void> getProductList(String url) async {
    try {
      emit(ProductLoading());
      final NetworkInfo networkInfo = locator.get<NetworkInfo>();

      if (await networkInfo.isConnected) {
        final productListEither = await productRepository.getProductList(url);

        productListEither.fold(
          (failure) {
            PrettyLogger.logger.e(failure.errorMessage);
            emit(ProductError(failure.errorMessage));
          },
          (productList) async {
            await ProductLocalRepositoryImpl().storeProducts(productList);
            emit(ProductSucess(productList));
          },
        );
      } else {
        final productListLocal =
            await ProductLocalRepositoryImpl().getProductList();
        productListLocal.fold(
          (failure) => emit(ProductError(failure.errorMessage)),
          (productList) async {
            emit(ProductSucess(productList));
          },
        );
      }
    } catch (e) {
      emit(ProductError("Internal server error"));
    }
  }
}
