import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class TextArea extends StatefulWidget {
  const TextArea({
    TextEditingController? controller,
    String? Function(String? value)? validator,
    Function(String value)? onChange,
    String? label,
    super.key,
  })  : _controller = controller,
        _validatror = validator,
        _label = label,
        _onChange = onChange;

  final TextEditingController? _controller;
  final String? _label;
  final String? Function(String? value)? _validatror;
  final Function(String value)? _onChange;
  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: TextFormField(
        scrollController: _scrollController,
        controller: widget._controller,
        expands: true,
        maxLines: null,
        minLines: null,
        validator: widget._validatror,
        onChanged: widget._onChange,
        cursorOpacityAnimates: true,
        cursorRadius: Radius.circular(Constants.borderValue),
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          labelText: widget._label?.capitalize(),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Questrial',
          ),
          alignLabelWithHint: true,
        ),
        inputFormatters: <TextInputFormatter>[
          CapitalizeAfterDotFormatter(),
        ],
        style: TextStyle(
          fontFamily: 'Questrial',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CapitalizeAfterDotFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Caso cuando el texto contiene un punto y queremos agregar un espacio si falta
    if (newText.isNotEmpty && newText.endsWith('.')) {
      // Si el texto termina en un punto y no hay espacio, agregamos el espacio
      if (newText.length == 1 || newText[newText.length - 2] != ' ') {
        newText = '$newText ';
      }
    }

    // Capitalizamos las letras después de un punto seguido de un espacio
    for (int i = 1; i < newText.length; i++) {
      if (newText[i - 1] == '.' && newText[i] == ' ') {
        // Capitalizamos la letra siguiente después del punto
        if (i + 1 < newText.length && newText[i + 1] != ' ') {
          newText = newText.substring(0, i + 1) +
              newText[i + 1].toUpperCase() +
              newText.substring(i + 2);
        }
      }
    }

    // Preservar la posición del cursor y solo cambiar el texto si es necesario
    int selectionIndex = newValue.selection.baseOffset;

    // Si el primer carácter del texto no es un espacio y no tiene punto previo, capitalizamos la primera letra
    if (newText.isNotEmpty && newText[0] != ' ') {
      newText = newText[0].toUpperCase() + newText.substring(1);
    }

    // Devuelve el nuevo valor con la posición del cursor correcta
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
