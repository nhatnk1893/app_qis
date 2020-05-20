import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.pinkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/level5.jpg',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('QIS',
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              SizedBox(
                height: 10.0,
              ),
              Text('\$ QIS tháng 5 ',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ));
  }
}
