import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color colorPrimario = Color(0xFFFFF87F);
Color colorAccentuado = Color(0xFFFF637D);
Color colorSecundario = Color(0xFF66D7D1);

double tamanoPantalla(BuildContext context, String direccion){
  if(direccion == "h")
    return MediaQuery.of(context).size.width;
  else
    return MediaQuery.of(context).size.height;
}

RichText textoCompletoDescripcion = RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Que hacemos\n-\n",
              style: GoogleFonts.poppins(
                color: colorAccentuado,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ), 
            ),
            TextSpan(text: textoDescripcion + textoDescripcion),
          ],
        ),
      );


String textoDescripcion = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";