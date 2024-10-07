import 'package:flutter/material.dart';

class VendorSheet extends StatefulWidget {
  const VendorSheet({super.key});

  @override
  State<VendorSheet> createState() => _VendorSheetState();
}

class _VendorSheetState extends State<VendorSheet> {
  late final DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _draggableScrollableController,
      snap: true,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) =>
          Container(),
    );
  }
}
