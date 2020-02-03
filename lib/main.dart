import 'package:flutter/material.dart';

void main() => runApp(Planet());

class Planet extends StatefulWidget {
  @override
  _PlanetState createState() => _PlanetState();
}

class _PlanetState extends State<Planet> {

  final TextEditingController _weight = new TextEditingController();
  int radioValue=0;
  double res=0.0;

  void valueChanged(int v) {
    setState(() {
      radioValue=v;

      switch(radioValue)
      {
        case 0:
          res=_weightPlanet(_weight.text, 0.4);
          break;
        case 1:
          res=_weightPlanet(_weight.text, 0.9);
          break;
        case 2:
          res=_weightPlanet(_weight.text, 0.4);
          break;
        case 3:
          res=_weightPlanet(_weight.text, 2.5);
          break;
        case 4:
          res=_weightPlanet(_weight.text, 1.1);
          break;
        case 5:
          res=_weightPlanet(_weight.text, 1.2);
          break;
        case 6:
          res=_weightPlanet(_weight.text, 0.8);
          break;
        case 7:
          res=_weightPlanet(_weight.text, 0.01);
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: new AppBar(
            title: new Text("Weight on Planet"),
//          centerTitle: true,
//          backgroundColor: Colors,
          ),
          backgroundColor: Colors.grey.shade600,
          body: new Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(13.0),

            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                new Image.asset(
                  "images/pl.png",
                  width: 90.0,
                  height: 150.0,
                ),

                new TextField(
                  controller: _weight,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "Enter weight on Earth!",
                    hintText: "in kgs",
                    icon: Icon(Icons.person),
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[

                      new Radio<int>(value: 0, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Mercury", style: new TextStyle(color: Colors.white70),),
                      new Radio<int>(value: 1, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Venus", style: new TextStyle(color: Colors.white70),),
                      new Radio<int>(value: 2, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Mars", style: new TextStyle(color: Colors.white70),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(value: 3, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Jupiter", style: new TextStyle(color: Colors.white70),),

                      new Radio<int>(value: 4, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Saturn", style: new TextStyle(color: Colors.white70),),
                      new Radio<int>(value: 5, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Neptune", style: new TextStyle(color: Colors.white70),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[

                      new Radio<int>(value: 6, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Uranus", style: new TextStyle(color: Colors.white70),),

                      new Radio<int>(value: 7, groupValue: radioValue, onChanged: valueChanged),
                      new Text("Pluto", style: new TextStyle(color: Colors.white70),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Center(child: new Text("$res kgs",
                    style: new TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.white
                    ),
                  )),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: new FlatButton(
                        color: Colors.white70,
                        onPressed:() {
                          setState(() {
                            res=0;
                            _weight.clear();
                          });
                        },
                        child: new Text("reset",style: new TextStyle(fontSize: 18.0),)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

double _weightPlanet(String t,double m) {
  return int.parse(t)*m;
}