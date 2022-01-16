import 'package:flutter/material.dart';
import 'package:midterm_620710771/cal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _con = TextEditingController();
  final _con1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'PIG WEIGHT',
                          style: TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                        Text(
                          'CALCULATOR',
                          style: TextStyle(color: Colors.pink, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/pig.png',
                      width: 500.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('LENGHT'),
                                  Text('(cm)'),
                                  TextField(
                                    controller: _con,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Enter length',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('GIRTH'),
                                  Text('(cm)'),
                                  TextField(
                                    controller: _con1,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Enter length',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink),
                        ),
                        onPressed: () {
                          var input = _con.text;
                          var input2 = _con1.text;
                          var length = double.tryParse(input);
                          var girth = double.tryParse(input2);

                          if (length == null && girth == null) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('ERROR'),
                                    content: Text('invaild input'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK')),
                                    ],
                                  );
                                });
                          } else if (length == null || girth == null) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('ERROR'),
                                    content: Text('invaild input'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK')),
                                    ],
                                  );
                                });
                          } else {
                            var cal = Cal(length, girth);
                            var check = cal.setCalWeight();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('RESULT'),
                                    content: Text(
                                        'Weight:${cal.b.round()} - ${cal.a.round()} kg\nPrice: ${cal.pb.round()} - ${cal.pa.round()} Bath'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK')),
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text('CALCULATE',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
