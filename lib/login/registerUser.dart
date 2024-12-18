import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_in/keyboardVisibility.dart';
import 'package:shop_in/login/selBoxes.dart';
import 'package:shop_in/regEx.dart';


class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  late KeyboardVisibilityManager keyboardVisibilityManager;

  double textSpace = 20;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController celController = TextEditingController();
  TextEditingController pswController = TextEditingController();
  TextEditingController confirmPswController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode celFocus = FocusNode();
  FocusNode pswFocus = FocusNode();
  FocusNode confirmPswFocus = FocusNode();
  String? edo;
  String? giro;
  final _formKey = GlobalKey<FormState>();
  bool isValidationActive = false;

  @override
  void initState() {
    // TODO: implement initState
    keyboardVisibilityManager = KeyboardVisibilityManager();
    addTextListeners([nameController, lastNameController, emailController, pswController, celController, pswController, confirmPswController]);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    keyboardVisibilityManager.dispose();
    super.dispose();
  }

  void onSelEdo(String? edo) {
    this.edo = edo;
    isValidationActive ? look4EmpFields() : null;
  }
  void onSelGiroEmp(String? giro) {
    this.giro = giro;
    isValidationActive ? look4EmpFields() : null;
  }

  void changeFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void look4EmpFields (){
    _formKey.currentState?.validate();
  }

  void addTextListeners(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.addListener(() {
        setState(() {
          isValidationActive ? look4EmpFields() : null;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_rounded, size: MediaQuery.of(context).size.width * 0.07,
          color: Colors.black,
        )),
        title: Text('Registrar Usuario', style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.065,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        backgroundColor: const Color(0xFFECD4FF),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFFECD4FF),
                  //Color(0xFFD3A4FF),
                  Color(0xFFB79AF2),
                  Color(0xFF6148A8),
                  //Color(0xFF9A4FD8),
                  Color(0xFF1F1370),
                ],
                stops: [
                  keyboardVisibilityManager.visibleKeyboard ? 0.2 :  0.08,
                  keyboardVisibilityManager.visibleKeyboard ? 0.4 : 0.25,
                  keyboardVisibilityManager.visibleKeyboard ? 0.6 : 0.6,
                  keyboardVisibilityManager.visibleKeyboard ? 0.7 : 0.9,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

            ),
          ),
          CustomScrollView(
            slivers: [
              /*SliverAppBar(
                leading: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_rounded, size: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.black,
                )),
                title: Text('Registrar Usuario', style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.065,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                pinned: true,
                floating: true,
                backgroundColor: const Color(0xFFECD4FF),
              ),*/
              SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.width * 0.06),
                    child: Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.width * 0.04,
                                ),
                                child: Text(
                                    textAlign: TextAlign.left,
                                    'Por favor complete los campos', style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width * 0.04,
                                )),),
                              ],
                            ),
                            TextFormField(
                              controller: nameController,
                              focusNode: nameFocus,
                              inputFormatters: [
                                RegEx(type: InputFormatterType.name)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Nombre(s)',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El nombre es obligatorio';
                                }
                                if (value.length <= 2) {
                                  return 'El nombre debe tener al menos 3 caracteres';
                                }
                                return null;
                              },
                              onEditingComplete: () => changeFocus(context, nameFocus, lastNameFocus),
                            ),
                            textFormSpacer(textSpace),
                            TextFormField(
                              controller: lastNameController,
                              focusNode: lastNameFocus,
                              inputFormatters: [
                                RegEx(type: InputFormatterType.name)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Apellido(s)',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El apellido es obligatorio';
                                }
                                return null;
                              },
                              onEditingComplete: () => changeFocus(context, lastNameFocus, emailFocus),
                            ),
                            textFormSpacer(textSpace),
                            TextFormField(
                              controller: emailController,
                              focusNode: emailFocus,
                              inputFormatters: [
                                RegEx(type: InputFormatterType.email)
                              ],
                              decoration: InputDecoration(
                                hintText: 'Correo electrónico',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El correo es obligatorio';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+\w{2,4}').hasMatch(value)) {
                                  return 'Por favor ingrese un correo válido';
                                }
                                return null;
                              },
                              onEditingComplete: () => changeFocus(context, emailFocus, celFocus),
                            ),
                            textFormSpacer(textSpace),
                            TextFormField(
                              controller: celController,
                              focusNode: celFocus,
                              inputFormatters: [
                                RegEx(type: InputFormatterType.numeric),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                hintText: 'Celular',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El celular es obligatorio';
                                }
                                if (value.length != 9) {
                                  return 'El celular debe tener 10 dígitos';
                                }
                                return null;
                              },
                            ),
                            textFormSpacer(textSpace),
                            SelEdo(onSelEdo: onSelEdo),
                            textFormSpacer(textSpace),
                            SelGiroEmp(onSelGiroEmp: onSelGiroEmp),
                            textFormSpacer(textSpace),
                            TextFormField(
                              controller: pswController,
                              focusNode: pswFocus,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
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
                                if (value.length < 5) {
                                  return 'La contraseña debe ser de al menos de 6 dígitos';
                                }
                                return null;
                              },
                            ),
                            textFormSpacer(textSpace),
                            TextFormField(
                              controller: confirmPswController,
                              focusNode:  confirmPswFocus,
                              decoration: InputDecoration(
                                hintText: 'Confirmar Contraseña',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'El apellido es obligatorio';
                                }
                                if (value != pswController.text) {
                                  return 'Verifique contraseña';
                                }
                                return null;
                              },
                            ),
                            textFormSpacer(textSpace),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0D6EFD),
                                  minimumSize: Size(double.infinity, MediaQuery.of(context).size.width * 0.12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: (){
                                  setState(() {
                                    isValidationActive = true;
                                    look4EmpFields();
                                  });
                                }, child: Text('Completar Registro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width * 0.045,
                            ),)),
                          ],
                        )),
                  )
              ),
            ],
          ),
        ],
      )
    );
  }

  Widget textFormSpacer (double textFormSpacerVal){
    return SizedBox(height: textFormSpacerVal);
  }
}
