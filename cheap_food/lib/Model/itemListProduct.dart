import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

Widget itemListProduct( String es, String marca, String precio ){
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
            new BoxShadow(
            color: colorAccentuado,
              offset: new Offset(0.0, 5.0),
              blurRadius: 5.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      color: Colors.grey[800],
      /*gradient: LinearGradient(
          colors: [
            colorPrimario,
            Colors.black38, 
          ]
      )*/
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "$marca - 1.25 kg",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Text(
            "12.50 €",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )
        ],
      ),
    ),
  );

}