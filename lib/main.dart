import 'package:flutter/material.dart';
import './SellCryptoRequest.dart';
import './WithdrawCash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        tabBarTheme: const TabBarTheme(),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Sell & Withdraw',
                style: TextStyle(color: Colors.black),
              ),
              leading: BackButton(
                color: Colors.black,
              ),
              backgroundColor: Color.fromARGB(255, 243, 248, 243),
              bottom: TabBar(
                indicatorColor: Colors.transparent,
                labelColor: Color.fromARGB(255, 247, 243, 243),
                unselectedLabelColor: Color.fromARGB(255, 5, 5, 5),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 17, 16, 16)),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Sell Crypto Request"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Withdraw Cash"),
                    ),
                  ),
                ],
              ),
            ),
            body: Center(
                child: Container(
              margin: const EdgeInsets.only(top: 25),
              child: TabBarView(
                children: [
                  SellCryptoRequestCard(),
                  WithdrawCashCard(),
                ],
              ),
            ))),
      ),
    );
  }
}
