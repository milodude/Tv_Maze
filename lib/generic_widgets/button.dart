import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? color;
  final String texto;
  final Function accion;
  final double? tamano;
  final String keyString;

  const Button({Key? key, required this.texto, required this.color, required this.accion, this.tamano, this.keyString = 'widgets_propios_boton'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key(keyString),
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(side: const BorderSide(color: Colors.purpleAccent, ),borderRadius: BorderRadius.circular(20),),
          ),
      onPressed: () {
        accion();
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          texto,
          style: TextStyle(color: Colors.purple, fontSize: tamano ?? 20),
        ),
      ),
    );
  }
}
