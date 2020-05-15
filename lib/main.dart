import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
final List<String> entries = <String>['A','B','C'];
final List<int> colorCodes = <int>[600,500,100];
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
        child: Card(
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Task',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: 50,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(
                              child: Text(
                                      'Entry ${entries[index]}',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                      ),
                              ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int idex) => const Divider(),
                  itemCount: entries.length,
              ),
            ],
          ),
        ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      );

  }
}




