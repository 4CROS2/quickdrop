import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/injection/injection_container.dart';
import 'package:quickdrop/src/features/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/features/financial_information/presentation/cubit/financial_information_cubit.dart';
import 'package:quickdrop/src/features/pruchase/presentation/cubit/purchase_cubit.dart';
import 'package:quickdrop/src/presentation/widgets/app_toastification.dart';

class FinancialInformation extends StatefulWidget {
  const FinancialInformation({
    required String productId,
    super.key,
  }) : _productId = productId;

  final String _productId;

  @override
  State<FinancialInformation> createState() => _FinancialInformationState();
}

class _FinancialInformationState extends State<FinancialInformation> {
  late final AppState _appState;
  @override
  void initState() {
    super.initState();
    _appState = sl<AppCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider<PurchaseCubit>.value(
        value: sl<PurchaseCubit>(),
        child: Scaffold(
          backgroundColor: Constants.primaryColor,
          body: BlocProvider<FinancialInformationCubit>(
            create: (BuildContext context) => sl<FinancialInformationCubit>()
              ..getInformationalInformation(
                productId: widget._productId,
              ),
            child: BlocConsumer<FinancialInformationCubit,
                FinancialInformationState>(
              listener:
                  (BuildContext context, FinancialInformationState state) {
                if (state is Error) {
                  context.pop();
                  AppToastification.showError(
                    context: context,
                    message: state.message,
                  );
                }
                if (state is Success) {
                  context.read<PurchaseCubit>().setProductData(
                        productName: state.product.productName,
                        sellerId: state.product.sellerData.id,
                        productId: state.product.productId,
                        buyerId: _appState.user.id,
                        imagePath: state.product.baseImages.first,
                        currentPrice: state.product.basePrice,
                      );
                  context.pushReplacement(
                    '/product/${widget._productId}/purchase',
                  );
                }
              },
              builder: (BuildContext context, FinancialInformationState state) {
                return Center(
                  child: Column(
                    spacing: Constants.mainPaddingValue,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Obteniendo datos de compra',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
