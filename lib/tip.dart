import 'package:flutter/material.dart';

class tip extends StatefulWidget {
  @override
  _tipState createState() => _tipState();
}

class _tipState extends State<tip> {

  int tip_percent = 0;
  int person_count = 1;
  double amount = 0.0;
  double tip = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text("Bill Splitter",
          style: new TextStyle(fontSize: 36,fontWeight: FontWeight.w600,color: Colors.purple,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        centerTitle: true,

      ),
      body: new Container(
        color: Colors.white,
        alignment: Alignment.center,

        //margin: EdgeInsets.only(top: 30.0),
        child: new ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Container(
              
              height: 180,
              width: 50,
              color: Colors.purpleAccent.shade50,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.purpleAccent.shade100.withOpacity(0.1)
              ),
              child: Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text("Each has to pay",style: new TextStyle(fontSize: 20,color: Colors.purple),),
                        new Text("\$${calculator(amount, person_count, )}",style: new TextStyle(fontSize: 48,color: Colors.purple,fontWeight: FontWeight.w600),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            new Container(
              height: 360,

              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey,
                  //style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: new  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: new TextStyle(fontSize: 26,color: Colors.purple,fontWeight: FontWeight.w600),
                    decoration: new InputDecoration(
                      labelText: "Bill Amount",
                      hintText: "Enter amount",
                      prefixText: "\$",
                    ),
                    onChanged: (String value)
                    {
                      try
                      {
                        amount = double.parse(value);
                      }catch(exception){
                        amount = 0.0;
                      }
                    },
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Split",style: new TextStyle(color: Colors.purpleAccent,fontSize: 20,fontWeight: FontWeight.w600),),
                      new Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FlatButton(onPressed: _decreaseperson, child: new Text("-",style: new TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.w600),),color: Colors.purpleAccent.shade100.withOpacity(0.2),),
                          new Padding(padding: EdgeInsets.only(left: 15.0)),
                          new Text("$person_count",style: new TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.w900),),
                          new Padding(padding: EdgeInsets.only(left: 15.0)),
                          new FlatButton(onPressed: _addperson, child: new Text("+",style: new TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.w600),),color: Colors.purpleAccent.shade100.withOpacity(0.2))
                        ],
                      )

                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("Tip",style: new TextStyle(color: Colors.purpleAccent,fontSize: 20,fontWeight: FontWeight.w600),),
                      new Text("\$${tipcalculator(amount, tip_percent)}",style: new TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.w900),)]
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("$tip_percent%",style: new TextStyle(fontSize: 20,color: Colors.purple,fontWeight: FontWeight.w900),),
                      new Padding(padding: EdgeInsets.only(top: 20)),
                      new Slider(value: tip_percent.toDouble(), onChanged: (double value){
                        setState(() {
                          tip_percent = value.round();
                        });
                      },
                        min: 0,max: 100,divisions: 10,activeColor: Colors.purpleAccent,)
                    ],
                  )
                ],
              ),

            )

          ],
        )
      ),
    );
  }

  //double ttip = tipcalculator(amount,tip_percent);

  calculator(double billamount,int persons){

    //double totaltip = billamount*(tippercent/100);
    double finalvalue = (billamount + double.parse(tipcalculator(amount, tip_percent)))/persons;
    return finalvalue.toStringAsFixed(2);

  }

   tipcalculator(double billamount, int tippercent){

    double totaltip = billamount*(tippercent/100);
    return totaltip.toStringAsFixed(2);
  }

  _addperson() {
    setState(() {
      person_count+=1;
    });

  }

  void _decreaseperson() {
    setState(() {
      person_count--;
      if(person_count<1) person_count=1;
    });
  }
}

