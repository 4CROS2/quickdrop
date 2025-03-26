import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/widgets/image_loader.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    required String cardNumber,
    super.key,
  }) : _cardNumber = cardNumber;
  final String _cardNumber;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius / 2,
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              value: false,
              groupValue: true,
              onChanged: (bool? value) {},
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: ImageLoader(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/quickdrop-ebc08.appspot.com/o/app_files%2Fvisa.png?alt=media&token=900f76c3-1547-466d-b238-d1248574f799',
              ),
            ),
            Expanded(
              child: Padding(
                padding: Constants.mainPadding,
                child: Text(
                  _cardNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: Constants.mainPadding,
              child: Icon(
                Icons.credit_card,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
