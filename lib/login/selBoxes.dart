import 'dart:convert';
import 'package:flutter/material.dart';

class SelEdo extends StatefulWidget {
  final Function(String?) onSelEdo;
  const SelEdo({super.key, required this.onSelEdo});

  @override
  State<SelEdo> createState() => _SelEdoState();
}

class _SelEdoState extends State<SelEdo> {
  String? selectedEdo;

  List<String> listEdo = [
    'Yucatán',
    'Quintana Roo',
    'Campeche'
    ];
  
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.037,
        ),
      labelText: 'Seleecione estado'
      ),
      value: selectedEdo,
      items: listEdo.map((edo) {
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
          selectedEdo = value;
          widget.onSelEdo(selectedEdo);
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
//cambiar a String, Dynamic.
class SelGiroEmp extends StatefulWidget {
  final Function(String?) onSelGiroEmp;
  const SelGiroEmp({super.key, required this.onSelGiroEmp});

  @override
  State<SelGiroEmp> createState() => _SelGiroEmpState();
}

class _SelGiroEmpState extends State<SelGiroEmp> {
  String? selectedGiro;

  List<String> listGiro = [
    'Asesor Independiente',
    'Empresarial',
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'Seleccione giro empresarial',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.037,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: selectedGiro,
      items: listGiro.map((giro) {
        return DropdownMenuItem(
          value: giro,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              giro,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          selectedGiro = value;
          widget.onSelGiroEmp(selectedGiro);
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Por favor selecciona una opción';
        }
        return null;
      },
      /*selectedItemBuilder: (BuildContext context) {
        return listGiro.map((giro) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              giro,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              )));
        }).toList();
      },*/
    );
  }
}