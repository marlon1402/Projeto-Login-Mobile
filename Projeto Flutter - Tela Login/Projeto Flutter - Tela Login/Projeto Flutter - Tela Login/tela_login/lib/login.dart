// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls, prefer_adjacent_string_concatenation, avoid_print

import 'package:flutter/material.dart';
import 'package:tela_login/user.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<user> lista = [];
  GlobalKey<FormState> userKey = GlobalKey<FormState>();
  bool existe = false;
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tela de Login",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 223, 136, 153),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: userKey,
            child: Column(
          children: [
            SizedBox(height: 50,),
            Image.asset(
              "assets/images/saude-mental.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50,),
            TextFormField(
              style: TextStyle(color: const Color.fromARGB(255, 223, 136, 153)),
              controller: userController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Usuario",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 223, 136, 153)),
                prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 223, 136, 153),),
                filled: true,
                fillColor: const Color.fromARGB(30, 223, 136, 153),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  
                  ),
              ),
              validator: (value) {
                if(value!.isEmpty){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Atenção!"),
                        content: Text("O campo nome não pode ser Vázio!"),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("OK")
                          )
                        ],
                      );
                    }
                  );
                }
                else{
                  return null;
                }
                return null;
              },
            ),
            SizedBox(height: 30,),
            TextFormField(
              style: TextStyle(color: const Color.fromARGB(255, 223, 136, 153)),
              controller: passwordController,
              autofocus: true,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: const Color.fromARGB(255, 223, 136, 153)),
                prefixIcon: Icon(Icons.https, color: const Color.fromARGB(255, 223, 136, 153),),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromARGB(255, 223, 136, 153),
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
                filled: true,
                fillColor: Color.fromARGB(30, 223, 136, 154),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  ),
              ),
              validator: (value) {
                if(value!.isEmpty){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Atenção!"),
                        content: Text("O campo senha não pode ser Vázio!"),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    }
                  );
                }
                else {
                  if(value.length <3){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Atenção!"),
                          content: Text("O campo senha deve ter mais de 3 caracteres!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK")
                            )
                          ],
                        );
                      },
                    );
                  }
                  return null;
                }
                return null;
              },
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 10),
                    backgroundColor: const Color.fromARGB(255, 223, 136, 153),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  onPressed: () {
                    if(userKey.currentState!.validate()){
                      criaUsuarios();
                    }

                    String usuario = userController.text;
                    String senha = passwordController.text;
                    user a = user(usuario, senha);
                    verifica(a);
                  }, 
                  child: Text("Entrar", style: TextStyle(color: Colors.white),)
                ),
                SizedBox(width: 50,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 10),
                    backgroundColor: const Color.fromARGB(255, 223, 136, 153),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                  onPressed: () {
                    userController.text = "";
                    passwordController.text = "";
                    existe = false;
                  }, 
                  child: Text("Cancelar", style: TextStyle(color: Colors.white),)
                )
              ],
            )
          ],
        ),
        )
        ),
      ),
    );
  }

  void criaUsuarios(){
    user a = user("marlon", "naotemsenha");
    user b = user("agnaldo", "admin123");
    user c = user("jeremias", "habla");
    user d = user("andré", "aiainerd");
    user e = user("davi", "senai");
    user f = user("enfermeira do caps", "caps");

    lista.add(a);
    lista.add(b);
    lista.add(c);
    lista.add(d);
    lista.add(e);
    lista.add(f);

    lista.forEach((user a) { 
      print("===========================\n"+
      "Usuario: " + a.nome + "\nSenha: " + a.senha);
    }); 
  }


  void verifica(user a){
    lista.forEach((user b) {
      if (a.nome == b.nome && a.senha == b.senha){
        existe = true;
      }
     });

     if(existe == true){
      showDialog(
        context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Sucesso!"),
          content: Text("O Usuario Existe! EBAAAA!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, 
              child: Text("OK")
            )
          ],
        );
      },
      );
    }
    else{
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text("ERROR!"),
            content: Text("Usuario Não Encontrado! COMEDIA!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text("OK")
              )
            ],
          );
        },
      );
    }
  }
}
