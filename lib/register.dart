// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson7/Profile.dart';
import 'package:lesson7/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController Ot4estvo = TextEditingController();
  TextEditingController emeil = TextEditingController();
  TextEditingController phone = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  List<String> cities = ['Шымкент', 'Алматы', 'Астана', 'Кокшетау', 'Актау'];
  String selectedCity = 'Шымкент';

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Регистрация',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 128, 159, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration:
                    InputDecoration(labelText: 'Имя', hintText: 'Напишите имя'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return 'Имя не заполнено';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: familya,
                decoration: InputDecoration(labelText: 'Фамилия'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return 'Фамилия не заполнено';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                    controller: Ot4estvo,
                    decoration: InputDecoration(labelText: 'Отчество'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      {
                        if (value!.isEmpty) {
                          return 'Отчество не заполнено';
                        }
                      }
                      return null;
                    },
                  ),
              InkWell(
                onTap: () async{
                  DateTime? pickedDate = await showDatePicker(context: context, 
                  initialDate:DateTime.now(),
                  firstDate: DateTime(1950), 
                  lastDate: DateTime(2030));

                  if(pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }


                },
                child: Container(
                  height: 40,
                  color: Colors.amber,
                
                  child: Center(child: Text(
                    DateFormat('dd MMMM yyyy', 'ru').format(selectedDate)
                    )),),),
              
              DropdownButtonFormField(
                  items: cities
                      .map((city) => DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          ))
                      .toList(),
                      value: selectedCity,
                  onChanged: (newcity){
                    selectedCity = newcity!;
                  }),
              TextFormField(
                controller: emeil,
                decoration: InputDecoration(labelText: 'emeil:'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  {
                    if (value!.isEmpty) {
                      return 'emeil адрес не заполнено';
                    }
                  }
                  return null;
                },
              ),
              TextField(
                controller: phone,
                decoration: InputDecoration(labelText: 'Номер телефона'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate())
                    // ignore: curly_braces_in_flow_control_structures
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            name: name.text,
                            familya: familya.text,
                            Ot4estvo: Ot4estvo.text,
                            emeil: emeil.text,
                            phone: phone.text,
                            city: selectedCity,
                          ),
                        ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 18, 211, 82)),
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: ()  {
                  



                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Если есть аккаунта, то нажмите войти',
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
