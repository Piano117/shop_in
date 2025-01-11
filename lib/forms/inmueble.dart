import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_in/forms/boxes.dart';

class LoadInmueble extends StatefulWidget {
  const LoadInmueble({super.key});

  @override
  State<LoadInmueble> createState() => _LoadInmuebleState();
}

class _LoadInmuebleState extends State<LoadInmueble> {

  String coin = '';
  String inmueble = '';
  double spaceBtTxtFF = 15;

  void onCoin (String coin){
    this.coin = coin;
    print('coin $coin');
  }
  void onInmueble (String inmueble){
    this.inmueble = inmueble;
    print('coin $coin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,//const Color(0xFFECD4FF),
        title: Text('Subir inmueble'),
      ),
      backgroundColor: Colors.white,//const Color(0xFFECD4FF),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                children: [
                  Text('Complete los campos correctamente para cargar su inmueble',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),),
                  Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                      minWidth: double.infinity
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFFCFE2FF),
                    ),
                    child: const Text(
                      'Elige la opción que acomode a tu inmueble',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.width * 0.03,
                      ),
                      label: Text('Nombre del producto'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: spaceBtTxtFF),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.02,
                            vertical: MediaQuery.of(context).size.width * 0.03,
                          ),
                          label: Text('Precio'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),),
                      const SizedBox(width: 15),
                      Expanded(child: TypeOfCoin(onCoin: onCoin)),
                    ],
                  ),
                  SizedBox(height: spaceBtTxtFF),
                  Row(
                    children: [
                      Expanded(child: TypeOfInmueble(onInmueble: onInmueble)),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                        minWidth: double.infinity
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05,
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: const Color(0xFFCFE2FF),
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      'Una descripción detallada ayudará muchísimo a tu comprador',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextFormField(
                    minLines: 4,
                    maxLines: null,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Descripción',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: spaceBtTxtFF,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, MediaQuery.of(context).size.width * 0.135),
                        backgroundColor: const Color(0xFFCFE2FF),
                      surfaceTintColor: const Color(0xFFCFE2FF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {

                      }, child: const Text('Continuar', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),)),
                  SizedBox(height: spaceBtTxtFF,),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
