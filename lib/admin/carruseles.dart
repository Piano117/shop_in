import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_in/admin/views/property.dart';

class CarruselMain extends StatefulWidget {
  const CarruselMain({super.key});

  @override
  State<CarruselMain> createState() => _CarruselMainState();
}

class _CarruselMainState extends State<CarruselMain> {

  List<Map<String, dynamic>> properties = [
    {
      'links': [
        'https://tse4.mm.bing.net/th?id=OIP.QTQvX8sXY8WPTn3it64pQwHaE8&w=316&h=316&c=7',
        'https://tse1.mm.bing.net/th?id=OIP.QVLmRP3JcbHmwFMzBcqBoQHaEK&w=266&h=266&c=7',
      ],
      'status': 'Venta',
      'squareMeters': 120,
      'price': 1500000,
      'title': 'Terreno amplio en venta',
      'location': {
        'state': 'Quintana Roo',
        'municipality': 'Cancún',
        'colony': 'Centro',
      },
      'description': 'Bonito terreno en venta cerca del centro de Cancún, perfecto para construir.',
      'views': 300,
      'surfaceArea': 336, // Metros cuadrados de superficie
      'constructionArea': 84.96, // Metros cuadrados de construcción
      'landDepth': 67, // Fondo de terreno
    },
    {
      'links': [
        'https://tse4.mm.bing.net/th?id=OIP.irRljjdjM0EJUuYQOsmA7gHaFK&w=330&h=330&c=7',
        'https://tse4.mm.bing.net/th?id=OIP.0bJwDeXlSRvxwfHtH_X0SgHaFM&w=332&h=332&c=7',
        'https://tse4.mm.bing.net/th?id=OIP.irRljjdjM0EJUuYQOsmA7gHaFK&w=330&h=330&c=7',
      ],
      'status': 'Renta',
      'squareMeters': 80,
      'price': 8000,
      'title': 'Departamento en renta',
      'location': {
        'state': 'Yucatán',
        'municipality': 'Mérida',
        'colony': 'Las Américas',
      },
      'description': 'Cómodo departamento en renta, cerca de escuelas y centros comerciales.',
      'views': 500,
      'surfaceArea': 336,
      'constructionArea': 84.96,
      'landDepth': 67,
    },
    {
      'links': [
        'https://tse4.mm.bing.net/th?id=OIP.0bJwDeXlSRvxwfHtH_X0SgHaFM&w=332&h=332&c=7',
        'https://tse4.mm.bing.net/th?id=OIP.irRljjdjM0EJUuYQOsmA7gHaFK&w=330&h=330&c=7',
      ],
      'status': 'Venta',
      'squareMeters': 150,
      'price': 2000000,
      'title': 'Casa grande en venta',
      'location': {
        'state': 'Campeche',
        'municipality': 'Campeche',
        'colony': 'San Francisco',
      },
      'description': 'Hermosa casa grande con jardín, ideal para familias.',
      'views': 400,
      'surfaceArea': 336,
      'constructionArea': 84.96,
      'landDepth': 67,
    },
    {
      'links': [
        'https://tse4.mm.bing.net/th?id=OIP.irRljjdjM0EJUuYQOsmA7gHaFK&w=330&h=330&c=7',
        'https://tse4.mm.bing.net/th?id=OIP.0bJwDeXlSRvxwfHtH_X0SgHaFM&w=332&h=332&c=7',
        'https://tse4.mm.bing.net/th?id=OIP.irRljjdjM0EJUuYQOsmA7gHaFK&w=330&h=330&c=7',
      ],
      'status': 'Renta',
      'squareMeters': 100,
      'price': 10000,
      'title': 'Oficina en renta',
      'location': {
        'state': 'Quintana Roo',
        'municipality': 'Playa del Carmen',
        'colony': 'Gonzalo Guerrero',
      },
      'description': 'Oficina amplia en renta, ubicada en una zona estratégica.',
      'views': 350,
      'surfaceArea': 336,
      'constructionArea': 84.96,
      'landDepth': 67,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount: properties.length,
        itemBuilder:(ctx, index, realIdx){
          final formatter = NumberFormat('#,##0', 'en_US');
          String formattedPrice = formatter.format(properties[index]['price']);
          return GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => Property(properties: properties[index],
                    )));
            },
            child: Column(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  Stack(
                      children: [
                        Image.network(
                          properties[index]['links'][0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const Center(
                              child: Icon(
                                  Icons.broken_image, size: 50),
                            );
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.blue,
                          ),
                          child: Text(properties[index]['status'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),),
                        ),
                      ],
                    ),
                  )
                ),),
                Padding(
                  padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(properties[index]['location']['state'].toString(), style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w700
                        ),),
                      ],
                    ),
                    Text(properties[index]['title'].toString(), style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,

                    ),),
                    Text('\$$formattedPrice MXN', style: TextStyle(
                        fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),),
                  ],
                )),
              ],
            )
          );
        },
        options: CarouselOptions(
          height: 350,
          aspectRatio: 16/12,//16/8,
          viewportFraction: 0.6,
          autoPlay:true,
          autoPlayInterval: const Duration(seconds: 8),
          autoPlayAnimationDuration: const Duration(milliseconds: 400),
          enlargeCenterPage: true,
          enlargeFactor: 0.3,//0.5
          reverse: true,
        ));
  }
}

class CarruselProperty extends StatefulWidget {
  final List<String> properties;
  const CarruselProperty({super.key, required this.properties});

  @override
  State<CarruselProperty> createState() => _CarruselPropertyState();
}

class _CarruselPropertyState extends State<CarruselProperty> {

  @override
  void initState() {
    // TODO: implement initState
    print('links ${widget.properties}');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount: widget.properties.length,
        itemBuilder:(ctx, index, realIdx){
          return GestureDetector(
            onTap: (){
            },
            child: Column(
              children: [
                Expanded(child: Container(
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  Stack(
                      children: [
                        Image.network(
                          widget.properties[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const Center(
                              child: Icon(
                                  Icons.broken_image, size: 50),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ),),
              ],
            )
          );
        },
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16/12,//16/8,
          viewportFraction: 0.6,
          autoPlay:true,
          autoPlayInterval: const Duration(seconds: 15),
          autoPlayAnimationDuration: const Duration(milliseconds: 400),
          enlargeCenterPage: true,
          enlargeFactor: 0.3,//0.5
          reverse: true,
        ));
  }
}
