import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/modeltodo.dart';
class Dbsqlite {
 static final Dbsqlite _instance =Dbsqlite.internal();
 factory Dbsqlite ()=> _instance;
 Dbsqlite.internal();
 static Database _db;
 Future<Database> createDatabase()async{
   if(_db!=null){
     return _db;
   }
   //difine path of database
   String path = join(await getDatabasesPath(), 'todo.db');
   _db =await openDatabase(path, version :1, onCreate: ( Database db, int v){
    
    //tables
    db.execute('create table todolist(id integer primery key autoincrement , name varchar(255))');
   });
   return _db;
 }
 //insertion
 Future <int> createTodo(ModelTodo todo) async{
   Database db =await createDatabase();
   return db.insert('todolist',todo.toMap());
 }
 //affichage
 Future <List> allTodo()async{
   Database db =await createDatabase();
   return db.query('todolist');
 }
 //supprestion
 Future <int>delete(int id) async{
   Database db =await createDatabase();
   return db.delete('todolist' ,where: 'id=?', whereArgs: [id]);
 }
}