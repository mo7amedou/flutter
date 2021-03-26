import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget{
@override
Widget build(BuildContext context){
  return
 MaterialApp(
    home: Scaffold(
        body : Container(
          width: double.infinity,
          height:  double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            
            
          ),
          child: Padding(padding: 
          const EdgeInsets.symmetric( vertical:40),
          child: Center(
            child: Column(
              
              
              children: [
                SizedBox(height:50),
                Text("Welcome ", style: TextStyle(color: Colors.grey, fontSize: 60)
                ,),
                SizedBox(height:250),
                Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: (){
                      Navigator.pushNamed(context, 'todo');
                    },
                    color: Colors.redAccent,
                    child:
                        Text("Open My To Do Liste",
                    style: TextStyle(fontSize:23,color: Colors.white),),
                        
                      ),
                      ),
                        SizedBox(height:30),
                        Text("By Medou",style:TextStyle(color: Colors.grey ,fontSize: 15),),
              ]),
              
            
          ),
          ),

          )
      ),
 );
  }

}