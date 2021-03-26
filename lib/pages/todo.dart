import 'package:flutter/material.dart';
import 'package:todo/dbsqlite.dart';
import 'package:todo/modeltodo.dart';

class ToDo extends StatefulWidget {
  ToDo({Key key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  
  String name;
  Dbsqlite db;
  @override
  void initState() { 
    super.initState();
    db=Dbsqlite();
  }
  @override
  Widget build(BuildContext context) {
 
  return
Scaffold(
        appBar: AppBar(title: 
      Text("My To Do Lite"), 
      centerTitle: false,
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
        Navigator.pushNamed(context, 'back');
      }),
      ),
      body:
      //read data
       FutureBuilder(
        future: db.allTodo(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i){
                ModelTodo todo = ModelTodo.fromMap(snapshot.data[i]);
                return ListTile(title: Text('${todo.id} ${todo.name}' 
                ),
                 trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed:(){
                   setState(() {
                     db.delete(todo.id);
                   });
                 } ),);
              }
              );
          }
        },
      ),
  floatingActionButton: FloatingActionButton(onPressed: (){
    return showDialog(context: context, builder: (context){
return AlertDialog(content: Form(child: 
Column(
  children: [
    TextFormField(
      decoration: InputDecoration(
        hintText:"Enter..."
      ),
      onChanged: (value){
        setState(() {
          name =value;
        });
      },
    ),
    //insertion
    RaisedButton(
      child: Text("Save"),
      onPressed:()async{
        ModelTodo todo= ModelTodo({'name':name});
        int id = await db.createTodo(todo);
        Navigator.of(context).pop();
      },
    ),
    RaisedButton(
      child: Text("Annuler"),
      onPressed:(){},
    ),
  ],
),
),
);
    });
  },child: Icon(Icons.add),),
);
}
}// TODO Implement this library.