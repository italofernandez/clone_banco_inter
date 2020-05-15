import 'package:banco_inter/presentation/home_page.dart';
import 'package:banco_inter/presentation/layout.dart';
import 'package:banco_inter/presentation/my_widgets/bottom_modal.widget.dart';
import 'package:banco_inter/presentation/my_widgets/orange_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  Future<void> _showBottomModalSheet(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });

      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => BottomModal(
            onFingerPrintRead: () => _navigateToHomePage(context),
          ));
    });
  }

  void _navigateToHomePage(BuildContext context) {
    print('Home Page');

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomePage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: getOrangeContainer(context),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.43 - 20,
              child: getCards(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget getOrangeContainer(BuildContext ctx) {
    var containerHeight = MediaQuery.of(ctx).size.height * 0.43;
    var containerWidth = MediaQuery.of(ctx).size.width;
    return Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange[900], Layout.lightOrange])),
        child: Center(
          child: SvgPicture.asset(
            "assets/images/logo_banco_inter.svg",
            height: 42,
            color: Colors.white,
          ),
        ));
  }

  Widget getCards(BuildContext context) {
    var rootContainerWidth = MediaQuery.of(context).size.width - 32;
    return Container(
      width: rootContainerWidth,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 170,
            decoration: BoxDecoration(
                color: Layout.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(
                          'IF',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 148,
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          // borderRadius: BorderRadius.circular(100)
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ITALO FERNANDES RIBEIRO',
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                          ),
                          Text(
                            '3475268-9',
                            style: TextStyle(
                                height: 1.3, fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    OutlineButton(
                      clipBehavior: Clip.hardEdge,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                          child: Text(
                        'ALTERAR',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Layout.darkBlueGrey),
                      )),
                      onPressed: () {
                        print('Alterar');
                      },
                      highlightedBorderColor: Layout.mediumGrey,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OrangeButton(
                          isLoading: isLoading,
                          buttonText: "Entrar",
                          onClick: () async => _showBottomModalSheet(context))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(16),
            height: 120,
            decoration: BoxDecoration(
                color: Layout.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset(
                    "assets/icons/lock_shield.svg",
                    height: 42,
                    color: Colors.grey[600],
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 30, color: Colors.blueGrey[600]),
                        children: [
                          TextSpan(text: 'i-'),
                          TextSpan(
                              text: 'safe',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ]),
                  ),
                ),
                getCircleButtonLabel(
                    SvgPicture.asset(
                      "assets/icons/more_icon.svg",
                      height: 30,
                      color: Layout.lightOrange,
                    ),
                    'Gerar'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: 120,
            decoration: BoxDecoration(
                color: Layout.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      style:
                          TextStyle(fontSize: 42, color: Colors.blueGrey[800]),
                      children: [
                        TextSpan(
                            text: 'inter',
                            style: TextStyle(fontWeight: FontWeight.w800)),
                        TextSpan(
                            text: 'pag',
                            style: TextStyle(fontWeight: FontWeight.w200)),
                      ]),
                ),
                getCircleButtonLabel(
                    SvgPicture.asset(
                      "assets/icons/qrcode_money.svg",
                      height: 24,
                      color: Layout.lightOrange,
                    ),
                    'Pagar'),
                getCircleButtonLabel(
                    SvgPicture.asset(
                      "assets/icons/qr_code.svg",
                      height: 24,
                      color: Layout.lightOrange,
                    ),
                    'Receber'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getOrangeButton(BuildContext context, String buttonText) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Layout.darkOrange,
          onTap: () {
            // print('Entrando..');
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => BottomModal());
          },
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
                  child: Text(buttonText.toUpperCase(),
                      style: TextStyle(fontSize: 18, color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCircleButtonLabel(Widget icon, String labelText) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 48,
            child: FlatButton(
              padding: EdgeInsets.all(10),
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: CircleBorder(),
              color: Colors.white,
              splashColor: Colors.grey[200],
              onPressed: () {
                print(labelText);
              },
              child: icon,
            ),
          ),
          Text(labelText, style: Layout.circleButtonTextStyle)
        ]);
  }

  Widget testButton(BuildContext context) {
    double borderRadius = 6;
    Color backgroundColor = Colors.purpleAccent;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: backgroundColor ?? Theme.of(context).accentColor,
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  colors: [Colors.orange[900], Colors.orangeAccent[400]]),
            ),
            child: Container(
                height: 48,
                width: 240,
                alignment: Alignment.center,
                child: Text('Test Button')),
          ),
        ),
      ),
    );
  }
}
