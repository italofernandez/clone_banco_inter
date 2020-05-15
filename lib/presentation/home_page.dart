import 'package:banco_inter/presentation/layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool expanded = false;

  void _toogleExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Layout.lightGrey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        // color: Colors.greenAccent,
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 184,
                width: screenWidth,
                decoration: BoxDecoration(gradient: Layout.orangeGradient),
              ),
            ),
            Positioned(
              top: 150,
              child: Column(
                children: <Widget>[
                  _cards(context),
                  
                  AnimatedContainer(
                    height: (!expanded) ? 492 : 0,
                    width: screenWidth,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _cards(context),
                        _cards(context),
                        _cards(context),
                        _cards(context),
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: _toogleExpanded,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 48,
                          color: Layout.mediumGrey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cards(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle labelStyle = Layout.circleButtonTextStyle;
    List<Widget> containers = List<Widget>();

    var labels = ['Transferências', 'Pagamentos', 'Investimentos'];

    labels.asMap().forEach((index, value) {
      var container = Container(
        margin: (index == 1)
            ? EdgeInsets.symmetric(horizontal: 8, vertical: 4)
            : null,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(8),
          child: Material(
            animationDuration: Duration(milliseconds: 300),
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: (screenWidth - 48) / 3,
                width: (screenWidth - 48) / 3,
                decoration: BoxDecoration(
// color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 64,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Layout.lightGrey, shape: BoxShape.circle),
                      ),
                      Text(value, style: labelStyle.copyWith(fontSize: 13)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      containers.add(container);
    });

    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: containers);
  }
}
