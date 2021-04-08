import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: new Home(),
      ),
    );

//
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentStep=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Utils App"),
      ),
      body: new Container(
        child: new Stepper(
          steps: _myStep(),
          currentStep: this._currentStep,
          onStepTapped: (step){
            setState(() {
              this._currentStep=step;
            });
          },
          onStepContinue: (){
            setState(() {
              if(this._currentStep<this._myStep().length-1){
                this._currentStep=this._currentStep+1;
              }else{
                print("Complet,check fields");
              }
            }
            );
          },
          onStepCancel: (){
            setState(() {
              if(this._currentStep>0){
                this._currentStep=this._currentStep-1;
              }
            });
          },
        ),
      ),
    );
  }
  List<Step> _myStep(){
    List<Step> _steps=[
       new Step(
          title: Text("Name"),
          content: new TextField(
            decoration: InputDecoration(
              labelText: "Name",
              focusColor: Colors.greenAccent
            ),
          ),
          isActive: _currentStep>1,
       ),
       new Step(
          title: Text("User name"),
          content: new TextField(
            decoration: InputDecoration(
              labelText: "Name",
              focusColor: Colors.greenAccent
            ),
          ),
          isActive: _currentStep>0,
       ),
       new Step(
          title: Text("Date of Birth"),
          content: new TextField(
            decoration: InputDecoration(
              labelText: "Name",
              focusColor: Colors.greenAccent
            ),
          ),
          isActive: _currentStep>2,
       ),
    ];
    return _steps;
  }
}

