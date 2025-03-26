import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/domain/entity/status_timeline_entity.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/widgets/purchase_detail_tail.dart';
import 'package:quickdrop/src/features/purchase_detail/presentation/widgets/timeline_painter.dart';

class PurchaseTimeline extends StatefulWidget {
  const PurchaseTimeline({
    required List<StatusTimelineEntity> statusTimeline,
    super.key,
  }) : _statusTimeline = statusTimeline;

  final List<StatusTimelineEntity> _statusTimeline;

  @override
  State<PurchaseTimeline> createState() => _PurchaseTimelineState();
}

class _PurchaseTimelineState extends State<PurchaseTimeline> {
  late List<double>
      tileHeights; // Lista para almacenar las alturas de los tiles
  late List<GlobalKey> tileKeys; // Lista de claves para cada tile

  @override
  void initState() {
    super.initState();
    _initializeLists();
    // Agregar callback post-frame para medir alturas iniciales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTileHeights();
    });
  }

  void _initializeLists() {
    // Inicializar las listas con el tamaño actual de _statusTimeline
    tileHeights = List<double>.filled(widget._statusTimeline.length, 0.0);
    tileKeys = List<GlobalKey<State<StatefulWidget>>>.generate(
        widget._statusTimeline.length, (_) => GlobalKey());
  }

  @override
  void didUpdateWidget(covariant PurchaseTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._statusTimeline.length != oldWidget._statusTimeline.length) {
      // Si el número de estados cambió, reinicializar las listas
      _initializeLists();
      // Forzar una medición de alturas después del cambio
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateTileHeights();
      });
    }
  }

  void _updateTileHeights() {
    // Medir la altura de cada tile usando su GlobalKey
    for (int i = 0; i < tileKeys.length; i++) {
      final GlobalKey<State<StatefulWidget>> key = tileKeys[i];
      final BuildContext? context = key.currentContext;
      if (context != null) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        // Asegurarnos de medir la altura total, incluyendo cualquier padding o spacing
        tileHeights[i] = renderBox.size.height;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = 0.0;
    List<double> dotYPositions = <double>[];
    double cumulativeHeight = 0.0;

    // Calcular las posiciones y de los puntos centrados en los tiles, considerando el spacing
    for (int i = 0; i < tileHeights.length; i++) {
      double height = tileHeights[i];
      // Ajustar la altura acumulada incluyendo el spacing entre tiles (si aplica)
      if (i > 0) {
        cumulativeHeight +=
            Constants.mainPaddingValue; // Añadir el spacing entre tiles
      }
      double centerY = cumulativeHeight + (height / 2);
      dotYPositions.add(centerY);
      cumulativeHeight += height;
    }
    totalHeight = cumulativeHeight;

    return SliverToBoxAdapter(
      child: Material(
        elevation: 2,
        shadowColor: Colors.transparent,
        borderRadius: Constants.mainBorderRadius,
        surfaceTintColor: Constants.primaryColor,
        child: Padding(
          padding: Constants.mainPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Constants.mainPaddingValue,
            children: <Widget>[
              // Vertical Timeline
              CustomPaint(
                size: Size(
                  Constants.mainPaddingValue,
                  totalHeight,
                ),
                painter: TimelinePainter(
                  dotYPositions: dotYPositions,
                ),
              ),
              // List of States
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: Constants.mainPaddingValue,
                  children: List<Widget>.generate(
                    widget._statusTimeline.length,
                    (int index) {
                      final StatusTimelineEntity state =
                          widget._statusTimeline[index];
                      return PurchaseStatusTile(
                        state: state,
                        key: tileKeys[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
