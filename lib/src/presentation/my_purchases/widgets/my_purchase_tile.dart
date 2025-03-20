import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/purchase_entity.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class MyPurchasetile extends StatefulWidget {
  const MyPurchasetile({
    required PurchaseEntity purchase,
    super.key,
  }) : _purchase = purchase;

  final PurchaseEntity _purchase;

  String get _purchaseStatus => _purchase.statusTimeline.last.status.name;

  @override
  State<MyPurchasetile> createState() => _MyPurchasetileState();
}

class _MyPurchasetileState extends State<MyPurchasetile> {
  // Obtener el texto del estado
  String purchaseStatus() {
    switch (widget._purchaseStatus) {
      case 'pending':
        return 'Pendiente';
      case 'completed':
        return 'Entregado';
      case 'onTheWay':
        return 'En camino';
      case 'canceled':
        return 'Cancelado';
      case 'accepted':
        return 'Aceptado';
      default:
        return 'Pendiente';
    }
  }

  // Obtener el color del estado
  Color purchaseStatusColor() {
    switch (widget._purchaseStatus) {
      case 'pending':
        return Colors
            .grey; // Gris: Representa algo que está inactivo o pendiente.
      case 'completed':
        return Colors.green; // Verde: Indica éxito o finalización.
      case 'onTheWay':
        return Colors
            .orange; // Naranja: Indica movimiento o progreso en camino.
      case 'canceled':
        return Colors.red; // Rojo: Representa cancelación o error.
      case 'accepted':
        return Colors.blue; // Azul: Indica aceptación o confirmación.
      default:
        return Colors.black; // Negro: Fallback para estados desconocidos.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(
          Uri(
            path: '/purchaseDetail/${widget._purchase.orderId}',
            queryParameters: <String, dynamic>{
              'sellerId': widget._purchase.sellerId,
            },
          ).toString(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Constants.mainPaddingValue / 2,
          children: <Widget>[
            Padding(
              padding: Constants.mainPadding / 2,
              child: SizedBox(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: Constants.mainBorderRadius / 6,
                  child: ImageLoader(
                    imageUrl: widget._purchase.imagePath,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget._purchase.productName.toTitleCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Estado: ',
                      children: <TextSpan>[
                        TextSpan(
                          text: purchaseStatus(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: purchaseStatusColor(),
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: ' ${DateFormat('hh:mm a', 'es_ES').format(
                                widget._purchase.statusTimeline.last.timestamp
                                    .toDate(),
                              )}',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Cantidad: ${widget._purchase.quantity}',
                  ),
                  Text(
                    'Dirección: ${widget._purchase.address.locationDescription}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
