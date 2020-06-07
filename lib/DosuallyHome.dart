import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dosually/DosuallyTaskList.dart';
import 'package:dosually/DosuallyRoutineList.dart';
import 'package:dosually/DosuallyStatistics.dart';
import 'package:dosually/DosuallyGoals.dart';

class DosuallyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DosuallyHomeState();
  }
}

class DosuallyHomeState extends State<DosuallyHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ToDoList(),
    DosuallyRoutineList(),
    DosuallyStatistics(),
    DosuallyGoals(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xFFFBE9E7), // its now invisible :)
        ),

        title: Text(
          'Dosually',
          style: TextStyle(
            color: Color(0xFF484848),
            fontWeight: FontWeight.bold,

          ),
        ),
        actions: <Widget> [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],

      ),


      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false ,

        onTap: onTabTapped,
        currentIndex: _currentIndex,

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.assignment),
            title: new Text('Tasks'),
            // backgroundColor: Color(0xFF000000),
          ),

          BottomNavigationBarItem(
              icon: new Icon(Icons.autorenew),
              title: new Text('Routines')
          ),

          BottomNavigationBarItem(
              icon: new Icon(Icons.show_chart),
              title: new Text('Statistics')
          ),

          BottomNavigationBarItem(
              icon: new Icon(Icons.lightbulb_outline),
              title: new Text('Goals')
          ),
        ],
      ),
    );
  }
  void onTabTapped(int index){
    setState((){_currentIndex = index;}  );
  }
}



