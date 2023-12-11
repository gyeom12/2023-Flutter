import 'package:ch11/ToDO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final _items = <ToDo>[];
  var _toDoController = TextEditingController();

  void dispose(){
    _toDoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할일'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: TextField(
                  controller: _toDoController,
                ),
            ),
            ElevatedButton(
                onPressed: () => _addToDo(ToDo(_toDoController.text)),
                child: Text('추가'),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo2').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                final documents = snapshot.data!.docs;
                return Expanded(
                  child:ListView(
                    children: documents.map((doc) => _buildiTemWidget(doc)).toList(),
                  ),
                );
                  }
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildiTemWidget(DocumentSnapshot doc){
    final todo = ToDo(doc['title'], isDone: doc['isDone']);

    return ListTile(
      onTap: () => _toggleToDo(todo),
      title: Text(
        todo.title,
        style: todo.isDone? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        )
        :null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
          onPressed: () => _deleteToDo(todo),
      ),
    );
  }

  void _addToDo(ToDo todo){
    FirebaseFirestore.instance.collection('todo2').add({'title' :todo.title, 'isDone' : todo.isDone });
    _toDoController.text= '';
  }

  void _deleteToDo(ToDo todo){
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleToDo(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}
