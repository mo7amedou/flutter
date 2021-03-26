class ModelTodo{
 int _id;
String _name;
ModelTodo(dynamic obj){
  _id= obj['id'];
  _name = obj['name'];
}
ModelTodo.fromMap(Map<String,dynamic> data){
  _id=data['id'];
  _name=data['name'];
}
Map<String ,dynamic>toMap()=>{'id': _id,'name': _name};
int get id => _id;
String get name => _name;
}