import 'package:banco_inter/presentation/layout.dart';
import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {

  final String buttonText;
  final Function() onClick;
  final bool isLoading;

  const OrangeButton({Key key, @required this.buttonText, this.onClick, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Layout.darkOrange,
          onTap: onClick,
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight,
                    colors: [Layout.darkOrange, Colors.orangeAccent[400]]),
                borderRadius: BorderRadius.circular(5)),
            child: Container(
              height: 48,
              width: 236,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                  child: (isLoading) ? 
                    Container(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Layout.darkOrange),
                        backgroundColor: Colors.white, 
                        strokeWidth: 2,
                      )) : 
                    Text(
                      buttonText.toUpperCase(),
                      style: TextStyle(fontSize: 18, color: Colors.white)
                  )),
            ),
          ),
        ),
      ),
    );
  }
}