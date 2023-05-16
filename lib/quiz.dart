import 'package:flutter/material.dart';

import 'modelclass.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Serena Williams has one more singles tennis Grand Slam titles than sister Venus',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 40,
                width: 150,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'True',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green[500])),
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
              ),
            )
          ],
        ),
      ),
    );
  }
  List _question = [
    Quiz(qus: 'Car have 4 wheels', ans: true),
    Quiz(qus: 'Bike have 3 wheels', ans: false),
    Quiz(qus: 'Sky color is blue', ans: true),
    Quiz(qus: 'Human blood color is green', ans: false),
    Quiz(qus: 'Kerala is the state of America', ans: false),
    Quiz(qus: 'India is Asian country', ans: true),
    Quiz(qus: 'Malayalam is the mother tongue of kerala', ans: true),
    Quiz(qus: 'Lionel Messi is a cricket player', ans: false),

    Quiz(qus: '125 less than 25', ans: false),
    Quiz(qus: 'Cat have 4 legs', ans: true),
  ];
  List<Icon> ico=[];
  int count = 0;
  int _qusNo =0;
  void nextQus(){
    if(_qusNo<_question.length){
      _qusNo++;

    }
  }
  String getQus()
  {
    return _question[_qusNo].qus;
  }
  bool isFinished(){
    if( _qusNo >=_question.length - 1){
      return true;
    }
    else {
      return false;
    }
    }
    int reset(){
    _qusNo = 0;
    count = 0;
    return _qusNo;

  }
  void check(bool answer) {
    bool value= getAns();
    setState(() {
      if(isFinished()== true) {
        if (count <= 5) {
          Alert(context: context, title: 'THE END', desc: 'You are Failed')
              .show();
          reset();
          ico = [];
        }
        else
        {
          Alert(
              context: context;
              title:'THE END'
              desc:'You are passed ith $count mark')
              .show();
          reset();
          ico = [];
        }
      }else{
        if (value ==answer) {
          print(count);
          ico.add(Icon(Icons.check,
            color: Colors.amberAccent,

          ));
          count++;
        }else {
          ico.add(Icon(Icons.close,
          color: Colors.red,
          )
          );
          }
        nextQus();
        }
    });
  }
}
