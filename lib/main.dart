import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Decider',
      theme: ThemeData(
       
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Food Decider',),
      debugShowCheckedModeBanner: false,
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

String _food = 'Yam and Egg';
var mycontroller = TextEditingController();


 List  decisions = ['Yam and Egg',  ];

   _makeDecision() {

setState(() {
Random random = Random();
                   int sel = random.nextInt(decisions.length);
                    _food = decisions[sel];
});
                  

  }
  _setDecision(controller){
    setState(() {
       String cont = controller.text;
       if(controller.text == ''){
         showDialog(
           context : context,
           builder : (context){
             return  AlertDialog(content: Text('*Decision Required*', style: TextStyle(fontSize: 20.0,color: Colors.red),),);
           } 
         ); 
       }else{
    decisions.add(cont);
      controller.text = ' ';
       }
    });

    
   
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
    
        child: Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_food',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(height: 20.0,),
            TextField(maxLength:50 ,controller: mycontroller, decoration: InputDecoration(focusColor:Colors.white, hintText: 'Enter Your Food Decision',hasFloatingPlaceholder: true, prefixIcon: Icon(Icons.add, color: Colors.deepOrangeAccent,) ),
                    //  onChanged:
                )    ,
                Center(
                     child:
                    RaisedButton(
                    onPressed:() {

                           _setDecision(mycontroller);

                          },
                     color: Colors.deepOrangeAccent,
                     
                      child: Text('Add Food Decision',style: TextStyle(color: Colors.white,fontSize: 11.0,fontFamily:'Quicksand', fontWeight: FontWeight.bold,),),
                              ),
                            
                ),//  addDecision(mycontroller),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed:() {

                            _makeDecision();
                            
                          },
        tooltip: 'Make Decision',
        child: Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
