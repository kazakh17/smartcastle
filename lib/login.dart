import 'package:flutter/material.dart';
import 'package:lesson7/Profile.dart';
import 'package:lesson7/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 208, 213),
      appBar: AppBar(
        title: Text('Логин'),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: login,
                decoration: InputDecoration(
                    labelText: 'Логин',
                    hintText: 'Напишите логин',
                    prefixIcon: Icon(Icons.login),
                    suffixIcon: IconButton(
                        onPressed: () {
                          login.clear();
                        },
                        icon: Icon(Icons.delete)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(16))),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Логин не заполнено';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    labelText: 'Пароль',
                    hintText: 'Напишите пароль',
                    prefixIcon: Icon(Icons.login),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (hidePassword == true) {
                            hidePassword = false;
                          } else {
                            hidePassword = true;
                          }
                        });
                      },
                      icon: Icon(hidePassword == true
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )),
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                validator: (value) {
                  if (value == '') {
                    return 'Пароль не заполнено';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('Login', login.text);
                      // ignore: use_build_context_synchronously

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                    name: login.text,
                                    familya: '',
                                    Ot4estvo: '',
                                    emeil: '',
                                    phone: '',
                                    city: '',
                                  )));
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              backgroundColor: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text('Заполниет все поля!'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Закрыть'))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                  ),
                  child: Text('Войти')),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  'Если нет аккаунта, то зарегистрируйтесь',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
