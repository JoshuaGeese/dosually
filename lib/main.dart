import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Dosoally(),
  theme: ThemeData(
    fontFamily: 'RobotoSlab',
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Color(0xFFFBE9E7),
    accentColor: Color(0xFF3FAAB8),
    cardTheme: CardTheme(
        color: Color(0xFFF6F6F6),
    ),
    toggleableActiveColor: Color(0xffD20000),
    appBarTheme: AppBarTheme(
        color: Color(0xFFFBE9E7)),
    dividerColor: Colors.grey[400],
    // iOS transition for Android to get sliding animation instead of fading upwards animation
    pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
  ),

));

class Dosoally extends StatefulWidget {
  @override
  _DosoallyState createState() => _DosoallyState();
}

class _DosoallyState extends State<Dosoally> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xFFFBE9E7), // its now invisible :)
        ),

        title: Text(
          'Dosoally',
          style: TextStyle(
            color: Color(0xFF484848),
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.check),
          ),
        ],

        ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                //color: Colors.black,
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: DefaultTabController(
                  length: 2,
                  child:TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.assignment)),
                      Tab(icon: Icon(Icons.autorenew)),
                    ],
                  ),
                ),
              ),
            ),

            Divider(
              height: 10.0,
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Tasks'),

                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Routinen')
                        ,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Tasks'),

                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Routinen')
                        ,
                      ),
                    ],
                  ),
                ],
              ),

              ),
              // Hier möglicherweise GridView verwenden?
          ],
        ),
        ),
      );

  }
}




