import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_in/forms/inmueble.dart';

import 'carruseles.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1370),
        title: Text('Panel', style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.08,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xFF1F1370),
              Color(0xFF6148A8),
              Color(0xFFB79AF2),
              Color(0xFFECD4FF),
              //Color(0xFFD3A4FF),
              //Color(0xFF9A4FD8),
            ],
            stops: [
              0.02,
              0.16,
              0.25,
              0.6,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Text(
            textAlign: TextAlign.center,
            'Agregados recientemente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.055,
              color: Colors.white,
              fontFamily: 'md',
            ),),),
          const SizedBox(height: 40,),
          Container(
            decoration: const BoxDecoration(
            ),
            width: MediaQuery.of(context).size.width,
            child: const CarruselMain()
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> LoadInmueble()));
                      }, child: Text('Subir propiedad', style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),)),
              ],
            )
          ],
        )
      ),
    );
  }
}
