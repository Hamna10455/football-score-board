import 'package:flutter/material.dart';
import 'model.dart';

Widget eventTile(MatchEvent match) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 5,
    ),
    height: 130.0,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 254, 255, 254),
      border: Border.all(
        width: 1.6,
        color: Color.fromARGB(255, 234, 234, 234),
      ),
      borderRadius: BorderRadius.circular(7),
    ),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.network(
                  match.teamLogo,
                  width: 40.0,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  match.teamName.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 16, 90),
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "${match.elapsed}'",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 16, 90),
                  fontSize: 35.0,
                ),
              ),
              SizedBox(
                width: 10,),
                Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                  "${match.player}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 16, 90),
                    fontSize: 20.0,
                     fontWeight: FontWeight.w400,
                  ),
                ),
             
               Text(
                  "${match.detail}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 119, 116, 121),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            
            ],
          ),
            ],
          ),
         
         
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15.0,
      ),
    ),
  );
}
