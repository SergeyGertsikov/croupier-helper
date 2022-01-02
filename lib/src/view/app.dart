import 'package:flutter/material.dart';
import 'package:pockergui1/src/logic/match.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => MatchScreenState();
}

class MatchScreenState extends State<MatchScreen> {
  int _setBet = 0;

  Match match = Match();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text('Pocker'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Text(
                'Egor',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text('${match.player1.buyIn}\$'),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('set bat'),
                              content: TextField(
                                onChanged: (String value) {
                                  _setBet = int.parse(value);
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        match.player1.bet = _setBet;
                                        match.bankSize();
                                        match.devByIn(1);
                                      });
                                    },
                                    child: Text('add')),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Bat',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => setState(() {
                      match.callBet(1);
                      match.bankSize();
                      match.devByIn(1);
                    }),
                    child: const Text(
                      'Call',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Chek',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Fold',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text('${match.player1.bet}\$'), //${match.player1.bat}\$
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Text(
                'bank ${match.bank}\$',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Text('${match.player2.bet}\$'),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('set bat'),
                              content: TextField(
                                onChanged: (String value) {
                                  _setBet = int.parse(value);
                                },
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        match.player2.bet = _setBet;
                                        match.bankSize();
                                        match.devByIn(2);
                                      });
                                    },
                                    child: Text('add')),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Bet',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      match.callBet(2);
                      match.bankSize();
                      match.devByIn(2);
                    },
                    child: const Text(
                      'Call',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Chek',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Fold',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Text(
                'Sergey',
                // match.right.name,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text('${match.player2.buyIn}\$'),
            ]),
          ],
        ),
      ),
    );
  }
}
