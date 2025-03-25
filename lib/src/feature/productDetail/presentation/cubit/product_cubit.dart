import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/feature/productDetail/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/feature/productDetail/domain/usecase/produc_detail_usecase.dart';

part 'product_state.dart';

/// Manages the state of a product's details using the BLoC pattern.
class ProductDetailCubit extends Cubit<ProductDetailState> {
  /// Initializes the cubit with the provided use case and an initial state.
  ProductDetailCubit({
    required ProducDetailUsecase usecase,
  })  : _usecase = usecase,
        super(const ProductDetailState());

  final ProducDetailUsecase _usecase;

  /// Retrieves product details asynchronously after a short delay.
  ///
  /// [productId] is the unique identifier of the product.
  /// Returns a [Future<ProductDetailEntity>] with the product data.
  Future<ProductDetailEntity> _getProductData({
    required String productId,
  }) async {
    await Future<void>.delayed(
      Duration(
        milliseconds: 300,
      ),
    );
    return await _usecase.getProductDetail(productId: productId);
  }

  /// Refreshes the product data by fetching the latest details.
  ///
  /// [productId] is the unique identifier of the product.
  /// Emits loading, success, or error states as appropriate.
  Future<void> refresh({required String productId}) async {
    try {
      _onLoading();
      final ProductDetailEntity response =
          await _getProductData(productId: productId);
      _onSuccess(response: response);
    } catch (e) {
      _onError(e);
    }
  }

  /// Fetches product data and adds it to the "last seen" list.
  ///
  /// [productId] is the unique identifier of the product.
  /// Emits loading, success, or error states, and adds to "last seen" if successful.
  Future<void> getProductData({required String productId}) async {
    try {
      _onLoading();
      final ProductDetailEntity response =
          await _getProductData(productId: productId);
      if (!isClosed) {
        _onSuccess(response: response);
        await _addToLastSeen(productId: response.productId);
      }
    } catch (e) {
      _onError(e);
    }
  }

  /// Adds the product to the "last seen" list.
  ///
  /// [productId] is the unique identifier of the product.
  /// Errors are silently ignored.
  Future<void> _addToLastSeen({required String productId}) async {
    try {
      await Future<void>.delayed(
        Duration(
          seconds: 3,
        ),
      );
      if (!isClosed) {
        await _usecase.addToLastSeen(productId: productId);
      }
    } catch (e) {
      null;
    }
  }

  /// Emits the loading state to indicate data is being fetched.
  void _onLoading() {
    emit(LoadingProduct());
  }

  /// Emits the success state with the fetched product data.
  ///
  /// [response] is the [ProductDetailEntity] containing the product details.
  void _onSuccess({required ProductDetailEntity response}) {
    emit(SuccessLoadingProduct(product: response));
  }

  /// Emits the error state with the provided error message.
  ///
  /// [error] is the error object encountered during the operation.
  void _onError(Object error) {
    emit(ErrorLoadingProduct(message: error.toString()));
  }
}
