import 'package:flutter/material.dart';
import 'package:lesson7/login.dart';
import 'package:lesson7/profile14.dart';
import 'package:lesson7/regisster.dart';
import 'package:shared_preferences/shared_preferences.dart';

class lessons14 extends StatefulWidget {
  const lessons14({super.key});

  @override
  State<lessons14> createState() => _lessons14State();
}

class _lessons14State extends State<lessons14> {

  TextEditingController loginController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController surenameController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),
      backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.login),
                suffixIcon: IconButton(onPressed: (){
                  loginController.clear();
                }, icon:  Icon(Icons.delete_forever),),
          labelText: 'Login', hintText: 'enter login',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
          
              ),
              validator: (value) {
                if (value == ''){
                  return 'login degug';
                }
                
              },
          
          
          
          
            ),
            TextFormField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),



                suffixIcon: IconButton( onPressed: (){
                  if(hidePassword == true){
                   setState(() {
                     hidePassword = false;
                   });

                  
                  }else {
                    setState(() {
                      hidePassword = true;
                    });
                  }



                }, icon:
                hidePassword == true 
                ? Icon(Icons.visibility_outlined)
                : Icon(Icons.visibility_off_rounded)
                 ),
          labelText: 'pass', hintText: 'enter pass',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
          
              ),
               validator: (value) {
                if (value == ''){
                  return 'pass debug';
                }
               },
              
          
          
            ),
            
          
            InkWell(
              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => regisster(),));

                // переход на стр
              },
              child: Text( 'если нет акк ', style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline
            
              ),),
          
          
            ),
            SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () async{ 
                      if (_formKey.currentState!.validate()){
                        SharedPreferences sp =   await SharedPreferences.getInstance();
                        sp.setString('key_login', loginController.text);

                  Navigator.push(
                    context,
                     MaterialPageRoute(
                      builder: (context) => 
                      profile14 ( ),));




                      }



          
          
          
                }, child:Text('Enter')),
          
          
          ]),
        ),
    ),
    );
  }
}