import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_in/keyboardVisibility.dart';
import 'package:shop_in/login/registerUser.dart';

import '../admin/admin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode pswFocus = FocusNode();
  late KeyboardVisibilityManager keyboardVisibilityManager;
  //
  bool showPsw = true;
  final _formKey = GlobalKey<FormState>();
  bool isValidationActive = false;

  //
  void changeFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void lookforEmpFields() {
    _formKey.currentState!.validate();
  }

  void addTextListeners(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.addListener(() {
        setState(() {
          isValidationActive ? lookforEmpFields() : null;
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    keyboardVisibilityManager = KeyboardVisibilityManager();
    addTextListeners([emailController, pswController]);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    keyboardVisibilityManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: keyboardVisibilityManager.visibleKeyboard ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            collapsedHeight: MediaQuery.of(context).size.width * 0.25,
            expandedHeight: MediaQuery.of(context).size.width * 0.25,
            pinned: true,
            backgroundColor: const Color(0xFFECD4FF),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/shopImg/logoshop.png',
                fit: BoxFit.contain, // Ajusta cómo se adapta la imagen
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.085,
                vertical: MediaQuery.of(context).size.width * 0.03,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => Admin()));
                  }, child: Text('FlyBTN')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          height: 2.5,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          focusNode: emailFocus,
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            suffixIcon: const Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                          onEditingComplete: () => changeFocus(context, emailFocus,pswFocus),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'El correo es obligatorio';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                              return 'Por favor ingrese un correo válido';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                obscureText: showPsw,
                                focusNode: pswFocus,
                                controller: pswController,
                                decoration: InputDecoration(
                                  hintText: 'Contraseña',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPsw = !showPsw;
                                      });
                                    },
                                    icon: !showPsw
                                        ? const Icon(CupertinoIcons.eye_slash)
                                        : const Icon(CupertinoIcons.eye),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'La contraseña es obligatoria';
                                  }
                                  if (value.length <= 3) {
                                    return 'La contraseña debe tener al menos 4 caracteres';
                                  }
                                  return null;
                                },
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width * 0.03,
                            ),
                            backgroundColor: const Color(0xFF6E29C4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            lookforEmpFields();
                            isValidationActive = true;
                          },
                          child: Text(
                            'Ingresar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Ingresar con usuario',
                    style: TextStyle(
                      color: Colors.black,
                      height: 2.0,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width * 0.03,
                            ),
                            backgroundColor: const Color(0xFFE9544F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                          },
                          child: Icon(Icons.g_mobiledata_sharp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Ingresar con tu cuenta Google',
                    style: TextStyle(
                      color: Colors.black,
                      height: 2.0,
                    ),
                  ),
                ],
              ),),
            ),
          ),

          // Tercera sección: Registro
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFECD4FF),
                border: Border(
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.085,
                vertical: MediaQuery.of(context).size.width * 0.065,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '¿Nuevo\nShopper?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.065,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Regístrate y obten 15 días de servicio',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      height: 2.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'GRATIS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.065,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 1.2),
                            padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.width * 0.03,
                            ),
                            backgroundColor: const Color(0xFF6E29C4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            //
                            /*CupertinoPageRoute(
                              builder: (context) => adminInv(docLog: widget.isDoctorLog),
                            ),
                            (Route<dynamic> route) => false,
                            );*/
                            //
                            Navigator.of(context).push(
                              CupertinoPageRoute(builder: (context) => RegisterUser()));
                          },
                          child: Text(
                            'Registrarse',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
