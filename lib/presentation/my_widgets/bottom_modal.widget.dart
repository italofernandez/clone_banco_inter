import 'package:banco_inter/presentation/layout.dart';
import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  final Function onFingerPrintRead;

  const BottomModal({Key key, @required this.onFingerPrintRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Autenticação',
              style: TextStyle(
                  color: Layout.darkBlueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: onFingerPrintRead,
                    child: Icon(
                      Icons.fingerprint,
                      color: Layout.lightOrange,
                      size: 64,
                    ),
                  ),
                  Text('Toque no sensor de impressão digital')
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'CANCELAR',
                style: TextStyle(color: Layout.lightOrange, fontSize: 15),
              ),
            ),
          ],
        ));
  }
}
