import 'package:flutter/material.dart';

void main() {
  runApp(const currency_converter());
}

// ignore: camel_case_types
class currency_converter extends StatelessWidget {
  const currency_converter({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: const homepage());
  }
}

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    
  final TextEditingController amtController = TextEditingController();
    var children = <Widget>[Text("CURRENT CONVERSION",style: TextStyle(),),
       Form_for_currency(amtController: amtController,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("=92.45"),Text("EUR")],),
        Country_selection_widget(Countryname: "USD",Countrycurrency: "US Dollars",),
        Country_selection_widget(Countryname: "EUR",Countrycurrency: "Euro",),
        SizedBox(height: 40.0,),
        Calculator_widget(amtController: amtController)
        ];
    return Scaffold(
      appBar: AppBar(title: Text("Currency pro")),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: children),
    );
  }
}

// ignore: camel_case_types
class Form_for_currency extends StatefulWidget {
  final TextEditingController amtController;
  const Form_for_currency({required this.amtController,
    super.key,
  });

  @override
  State<Form_for_currency> createState() => _Form_for_currencyState();
}

// ignore: camel_case_types
class _Form_for_currencyState extends State<Form_for_currency> {
  @override
  Widget build(BuildContext context) {
    return Form(child: Row(
     children: [
       Expanded(
     child: TextFormField(
     controller: widget.amtController ,
     keyboardType: TextInputType.none,
       decoration: InputDecoration(
         labelText: "Amount",
         border: OutlineInputBorder(),
         
       ),
     ),
          ),
     ],
       
    ));
  }
}

// ignore: camel_case_types
class Calculator_widget extends StatelessWidget {
  final TextEditingController amtController;                                                                                                   
  const Calculator_widget({
    required this.amtController,
    super.key,
  });
  void onPressing(String str){
    amtController.text+=str;
  
  }
  void backspace(){
    if(amtController.text.isNotEmpty)
    amtController.text=amtController.text.substring(0,amtController.text.length-1);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
          ElevatedButton(onPressed: ()=>onPressing("1"), child: Text("1")),
          ElevatedButton(onPressed: ()=>onPressing("2"), child: Text("2")),
          ElevatedButton(onPressed: ()=>onPressing("3"), child: Text("3"))
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
          ElevatedButton(onPressed: ()=>onPressing("4"), child: Text("4")),
          ElevatedButton(onPressed: ()=>onPressing("5"), child: Text("5")),
          ElevatedButton(onPressed: ()=>onPressing("6"), child: Text("6"))
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
          ElevatedButton(onPressed: ()=>onPressing("7"), child: Text("7")),
          ElevatedButton(onPressed: ()=>onPressing("8"), child: Text("8")),
          ElevatedButton(onPressed: ()=>onPressing("9"), child: Text("9"))
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
          ElevatedButton(onPressed: ()=>onPressing("."), child: Text(".")),
          ElevatedButton(onPressed: ()=>onPressing("0"), child: Text("0")),
          ElevatedButton(onPressed: ()=>backspace(), child: Icon(Icons.backspace))
        ],)
      ],
    );
  }
}

// ignore: camel_case_types
class Country_selection_widget extends StatelessWidget {
  final String Countryname;
  final String Countrycurrency;
  const Country_selection_widget({
    required this.Countryname,
    required this.Countrycurrency,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
      elevation: 2,
      child:
      Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              children: [
                Text(Countryname,style: TextStyle(fontSize: 20.0),),
                Text(Countrycurrency)
              ],
            )
          ],
        ),
      ) 
    );
  }
}
