import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/domain/entity/product_detail_entity.dart';
import 'package:quickdrop/src/domain/usecase/produc_detail_usecase.dart';

part 'product_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required ProducDetailUsecase usecase,
  })  : _usecase = usecase,
        super(const ProductDetailState());
  final ProducDetailUsecase _usecase;

  void getProductData({required String productId}) {
    try {
      emit(LoadingProduct());
      Future<void>.delayed(
        Duration(milliseconds: 300),
        () async {
          final ProductDetailEntity response = await _usecase.getProductDetail(
            productId: productId,
          );
          if (!isClosed) {
            emit(
              SuccessLoadingProduct(
                product: response,
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(
        ErrorLoadingProduct(
          message: e.toString(),
        ),
      );
    }
  }
}
