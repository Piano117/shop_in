import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_in/admin/carruseles.dart';

class Property extends StatefulWidget {
  final Map<String, dynamic> properties;
  const Property({super.key, required this.properties,});

  @override
  State<Property> createState() => _PropertyState();
}


class _PropertyState extends State<Property> {

  @override
  void initState() {
    // TODO: implement initState
    print('init ${widget.properties}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0', 'en_US');
    String formattedPrice = formatter.format(widget.properties['price']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1370),
        title: Text('Propiedad en ${widget.properties['status'].toString()}',
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.065,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
              0.04,
              0.19,
              0.29,
              0.66,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarruselProperty(properties: widget.properties['links']),
            Expanded(
              child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025,
                vertical: MediaQuery.of(context).size.width * 0.04,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(widget.properties['title'], style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.065,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(widget.properties['description'], style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.058,
                        ),), ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye_sharp, size: MediaQuery.of(context).size.width * 0.045),
                        SizedBox(width: 5,),
                        Text('Vistas recibidas ${widget.properties['views'].toString()}', style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Precio \$$formattedPrice ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width * 0.058,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'MXN',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.04,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text('Detalles Generales', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.065,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${widget.properties['location']['state']}', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.058,
                            color: Colors.black),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${widget.properties['location']['municipality']}', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.058,
                            color: Colors.black),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${widget.properties['location']['colony']}', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.058,
                            color: Colors.black),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${widget.properties['surfaceArea']}', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.058,
                            color: Colors.black),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${widget.properties['constructionArea']}', style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.058,
                            color: Colors.black),),
                      ],
                    ),
                  ],
                ),
              ),
            ),),
          ],
        ),
      )
    );
  }
}
