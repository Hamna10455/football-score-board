import 'package:flutter/material.dart';

Widget leagueStat(String name, String logoUrl, dynamic country, String season) {
  return Container(
    color: Color(0xFFFAFAFA),
    height: 120,
   
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26),
          child: Image.network(
            logoUrl,
            width: 70.0,
          ),
        ),
        Expanded(child:
          Column(
            children: [
              SizedBox(height: 12.0,),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ), Text(
                "Year ${season}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              
              Text(
                "${country}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
