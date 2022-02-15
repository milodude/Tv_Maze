import 'package:flutter/material.dart';
///Button that can be used through out the application
class Button extends StatelessWidget {
  ///Constructor
  const Button(
      {Key? key,
      required this.texto,
      required this.color,
      required this.accion,
      this.tamano,
      this.keyString = 'widgets_propios_boton'})
      : super(key: key);
  ///Color  of the button
  final Color? color;
  ///Text that needs to be inside the button
  final String texto;
  ///Function to execute when the button is pressed
  final Function accion;
  ///size of the button. If null default value is 20.
  final double? tamano;
  ///String to identify the button. Mostly used for testing.
  final String keyString;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key(keyString),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.purpleAccent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
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
