import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class MySliderApp extends StatefulWidget {
  MySliderApp({super.key});

  @override
  SellCryptoRequestSlider createState() => SellCryptoRequestSlider();
}

class SellCryptoRequestSlider extends State<MySliderApp> {
  int _value = 10;
  int _balance = 35000;
  TextEditingController nameController = TextEditingController();
  double _amount = 0;

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
          Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: Text(
                        'Slide and adjust Your amount',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      )))),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: new Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: new Column(children: [
                    new Container(
                        child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.grey,
                        trackHeight: 3.0,
                        thumbColor: Colors.yellow,
                        overlayColor:
                            Color.fromARGB(255, 144, 132, 146).withAlpha(32),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Slider(
                        thumbColor: Color.fromARGB(255, 219, 216, 216),
                        min: 10.0,
                        max: 100.0,
                        divisions: 2,
                        label: (_amount).toStringAsFixed(1),
                        value: _value.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _value = value.round();
                          });
                          _amount = (_balance * value) / 100;
                          nameController.text = _amount.toString();
                        },
                      ),
                    )),
                  ]),
                ),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: new Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: ('Amount'),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: nameController,
                onChanged: (text) {
                  // _doSomething(text);
                  _amount = double.parse(text);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                  backgroundColor: Colors.blue),
              child: Text('Submit',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
              onPressed: () async {
                if (_amount > 0) {
                  var _email = 'pawan@growspace.ai';
                  var _action = 'sell';
                  var res = await http.get(Uri.parse(
                      'https://shielded-gorge-32779.herokuapp.com/send-mail?dest=${_email}&action=${_action}&amount=${_amount}'));
                  print(res.body);
                  showToast(res.body);
                } else {
                  showToast('Amount should be greater than 0!');
                }
              },
            ),
          ),
        ]));
  }
}

class SellCryptoRequestCard extends StatelessWidget {
  SellCryptoRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Container(
          height: 180,
          width: 370,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Color.fromARGB(255, 225, 230, 226),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                        width: 220,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Column(children: [
                              Padding(padding: const EdgeInsets.all(10.0)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: new Column(children: [
                                  new Text('Total Crypto Balance',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color.fromARGB(255, 8, 8, 8),
                                      )),
                                  new Text('₹35000.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25.0,
                                        color: Color.fromARGB(255, 23, 134, 30),
                                      )),
                                  new Text('in INR',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromARGB(255, 98, 100, 98),
                                      )),
                                ]),
                              ),
                            ]))),
                    new Container(
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topRight: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0))),
                      child: new Image.asset(
                        'images/growspace1.png',
                        height: 170.0,
                        width: 140.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 25),
            child: new Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: "How much want to sell?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = 'https://www.growspace.ai/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }),
                      ),
                    )),
              ],
            )),
        MySliderApp(),
      ],
    ));
  }
}
