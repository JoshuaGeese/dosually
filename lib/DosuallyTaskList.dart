import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> entries = <String>['A','B','C'];
final List<int> colorCodes = <int>[600,500,100];

class DosuallyTaskList extends StatefulWidget {
  @override
  _DosuallyTaskListState createState() => _DosuallyTaskListState();
}

class _DosuallyTaskListState extends State<DosuallyTaskList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
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
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {} ,
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

