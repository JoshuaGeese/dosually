import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:dosually/database_helpers.dart';


class ToDoList extends StatefulWidget {
  @override
  ToDoListState createState() => new ToDoListState();

}

class TodoItems{
  int id = 0;
  String text = '';

  TodoItems();
}

class ToDoListState extends State<ToDoList> {
  List<TodoItems> _todoItems = [];

  void initState() {
    _read();
    super.initState();
  }

  @override

  final myTextController = TextEditingController();
  final myDateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  _save(String description, int prio, String due) async {
    Task task = Task();
    task.title = description;
    task.priority = prio;
    task.dueDate = due;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(task);
  }

  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<Task> map = await helper.queryAllTasks();
    if(map.length != null){
      print(map);
      setState(() {
        map.forEach((element) {
          //Task buffer = element.values;
          TodoItems buffer = TodoItems();
          buffer.id = element.id.toInt();
          buffer.text = '${element.title} - Priority ${element.priority} - Due on: ${element.dueDate.substring(0,10)}';
          _todoItems.add(buffer);
        });
      });
    }

  }

  _delete (int index) async {
    DatabaseHelper helper = DatabaseHelper.instance;
      await helper.deleteTask(index);
      _todoItems.clear();
      _read();
  }

  void _addTodoItem(){
    String datum;
    int _value = 0;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: myTextController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Task'),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Wrap(
                          children: List<Widget>.generate(
                            3,
                                (int chipIndex) {
                              return ChoiceChip(
                                label: Text('Priority $chipIndex'),
                                selected: _value == chipIndex,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected ? chipIndex : null;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {
                            datum = date.toString();
                            print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $datum');
                          }, currentTime: DateTime.utc(2020, 07, 31, 12, 00, 00), locale: LocaleType.de);
                        },
                        child: Text(
                          'Set due date',
                          //style: TextStyle(color: Colors.blue),
                        )
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                         _save(myTextController.text, _value, datum );
                         print('___________________________');
                         print(myTextController.text);
                         print(_value);
                         print(datum);
                         print('___________________________');
                         _todoItems.clear();
                         _read();
                        },
                        child: Text(
                          "Save Task",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }



  Widget _buildTodoList() {
    
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        //if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index]);
        //}
      },
    );
  }



  Widget _buildTodoItem(TodoItems todoText) {
    return new ListTile(
      title: new Text(todoText.text),
      trailing: new SizedBox(
      height: 20.0,
      width: 20.0,
      child: new IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: Icon(Icons.check, size: 20.0),
        onPressed: () {
          _delete(todoText.id);
        },
      ),
    ),
    );
  }


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
                _buildTodoList(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _addTodoItem,
            tooltip: 'Add task',
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }

  }



