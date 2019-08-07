import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _ageController   = new TextEditingController();
  final TextEditingController _heightController= new TextEditingController();
  final TextEditingController _weightController= new TextEditingController();

  double result=0.0;
   double meters=0.0;
   String _resultReading="";

  String _finalResult="";


  void _calculateBmi(){
  setState(() {

    int age= int.parse(_ageController.text);
    double height = double.parse(_heightController.text);
    meters= height/100;

    double weight = double.parse(_weightController.text);

    if((_ageController.text.isNotEmpty || age>0)&& (_heightController.text.isNotEmpty || height>0)
        &&(_weightController.text.isNotEmpty || weight>0)) {
      result = weight / (meters * meters);
      if (double.parse(result.toStringAsFixed(1)) < 18.5) {
        _resultReading = "Underweight";
        print(_resultReading);
      }

      else if (double.parse(result.toStringAsFixed(1)) > 18.5 && result < 25) {
        _resultReading = "Normal";
        print(_resultReading);
      }

      else if (double.parse(result.toStringAsFixed(1)) > 25.0 && result < 30) {
        _resultReading = "Overweight";
      }
      else if (double.parse(result.toStringAsFixed(1)) > 30.0) {
        _resultReading = "Obese";
      }
    }
    else{
      result=0.0;
    }



  });
  _finalResult= "Your BMI:${result.toStringAsFixed(1)}";


  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: GradientAppBar(
        title: new Text("BMI Calculator"),
        centerTitle: true,
        backgroundColorStart: Color(0xffcc2b5e),
        backgroundColorEnd: Color(0xff753a88),


      ),
      body: new Container(
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
//          stops: [0.4,0.6],
              colors: [
                Color(0xffeecda3),
                Color(0xffef629f),
              ],
            )
        ),
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 100,
              width: 70,
            ),
            new Container(
              margin: EdgeInsets.all(1.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Age',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Height',
                      hintText: 'Height in cms',
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight',
                      hintText: 'Your Weight in Kgs',
                      icon: new Icon(Icons.bubble_chart),
                    ),


                  ),
                  new Padding(padding: new EdgeInsets.all(10.1)),
                      new Center(
                        child: new Row(
                          children: <Widget>[
                            new Container(
                             margin: EdgeInsets.only(left: 125),
                              child: new RaisedButton(
                                  onPressed:_calculateBmi,
                                color: Colors.pinkAccent,
                                child: new Text("Calculate",style: TextStyle(color: Colors.white),),


                              ),


                              
                             
                            ),
                          ],


                        ),

                      ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.2)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("$_finalResult", style: TextStyle(color: Colors.cyanAccent, fontSize: 19.9,
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),),
//                new Padding(padding: const EdgeInsets.all(5.0)),

                new Text("$_resultReading",style: TextStyle(color: Colors.greenAccent, fontSize: 19.9,
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
