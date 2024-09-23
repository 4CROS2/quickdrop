import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    bool autofocus = false,
    VoidCallback? onTap,
    FocusNode? focusNode,
    bool disabled = false,
    super.key,
  })  : _onTap = onTap,
        _autoFocus = autofocus,
        _focusNode = focusNode,
        _disabled = disabled;

  final VoidCallback? _onTap;
  final bool _autoFocus;
  final bool _disabled;
  final FocusNode? _focusNode;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = widget._focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      borderRadius: Constants.mainBorderRadius,
      child: GestureDetector(
        onTap: widget._onTap,
        child: IgnorePointer(
          ignoring: widget._disabled,
          child: TextFormField(
            autofocus: widget._autoFocus,
            controller: _controller,
            focusNode: widget._focusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: false,
              prefixIcon: const Icon(Icons.search),
              enabledBorder: Constants.authBorder,
              focusedBorder: Constants.authBorder,
              focusedErrorBorder: Constants.authBorder,
              hintText: 'Que deseas buscar?',
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ),
    );
  }
}
