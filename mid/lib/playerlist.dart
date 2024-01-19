import 'package:flutter/material.dart';

Widget playerList(String name, String logoUrl, dynamic country, dynamic season) {
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
            width: 40.0,
          ),
        ),
       
          Column(
            children: [
              SizedBox(height: 25.0,),
              SizedBox(
                width: 250,
                child: Text(
                  name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 16, 90),
                    fontSize: 25.0,
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), Text(
                "${country}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 93, 97),
                  fontSize:22.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              
               Text(
                "Age: ${season}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 100, 96, 103),
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              
            ],
          ),
        
      ],
    ),
  );
}
