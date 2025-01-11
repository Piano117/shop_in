import 'package:flutter/material.dart';

class TypeOfCoin extends StatefulWidget {
  final Function (String) onCoin;
  const TypeOfCoin({super.key, required this.onCoin});

  @override
  State<TypeOfCoin> createState() => _TypeOfCoinState();
}

class _TypeOfCoinState extends State<TypeOfCoin> {
  String? selectedOpt;

  List<String> listPet = [
    'MXN',
    'Dolar',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              ),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.width * 0.03,
          ),
          labelText: 'Moneda'
      ),
      iconDisabledColor: Colors.black54,
      iconEnabledColor: Colors.black54,
      value: selectedOpt,
      items: listPet.map((edo) {
        return DropdownMenuItem(
          value: edo,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              edo,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedOpt = value;
          widget.onCoin(selectedOpt!);
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Por favor selecciona una opción';
        }
        return null;
      },
    );
  }
}
///todo

class TypeOfInmueble extends StatefulWidget {
  final Function (String) onInmueble;
  const TypeOfInmueble({super.key, required this.onInmueble});

  @override
  State<TypeOfInmueble> createState() => _TypeOfInmuebleState();
}

class _TypeOfInmuebleState extends State<TypeOfInmueble> {
  String? selectedOpt;

  List<String> typeOfInmueble = [
    'Terreno ejidal',
    'Terreno propio',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              ),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              )
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.width * 0.03,
          ),
          labelText: 'Seleccione tipo de inmueble'
      ),
      iconDisabledColor: Colors.black54,
      iconEnabledColor: Colors.black54,
      value: selectedOpt,
      items: typeOfInmueble.map((inmueble) {
        return DropdownMenuItem(
          value: inmueble,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              inmueble,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedOpt = value;
          widget.onInmueble(selectedOpt!);
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Por favor selecciona una opción';
        }
        return null;
      },
    );
  }
}

