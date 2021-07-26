import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

Widget itemListProduct( String es, String marca, String precio ){
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
            new BoxShadow(
            color: colorAccentuado,
              offset: new Offset(0.0, 2.0),
              blurRadius: 1.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //color: Colors.grey[800],
      gradient: LinearGradient(
          colors: [
            colorPrimario,
            colorSecundario, 
          ]
      )
    ),
    height: 90,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$es", 
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "$marca",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Text(
            "$precio",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )
        ],
      ),
    ),
  );

}