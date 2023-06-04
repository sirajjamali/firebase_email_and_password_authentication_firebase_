import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../scree_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formfield = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNamelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  // passToggle as me password hide krna hai or password show krna hai
  bool newPassToggle = true;
  // passToggle as me password hide krna hai or password show krna hai
  bool confiromPassToggle = true;

  @override
  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: newPassController.text,
        // password: confiromPassController.text,
      );
      print("User Addes Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up "),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset("assets/1.jpg", height: 200, width: 200,),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter First Name";
                        }
                        // name ke alphabete 3 se ziada hona chahie
                        else if (newPassController.text.length <= 3) {
                          return "Password Lenth Should not be more than 3 characters";
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: lastNamelController,
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Last Name";
                        }
                        // last name ke alphabete 3 se ziada hona chahie
                        else if (newPassController.text.length <= 3) {
                          return "Password Lenth Should not be more than 3 characters";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        }
                        if (value.isEmpty || !value.contains('@gmail.com')) {
                          return "Enter Valid Email";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: newPassController,
                      obscureText: newPassToggle,
                      decoration: InputDecoration(
                          labelText: "New Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                newPassToggle = !newPassToggle;
                              });
                            },
                            child: Icon(newPassToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter New Password";
                        } else if (newPassController.text.length < 8) {
                          return "Password Lenth Should not be more than 8 characters";
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenView()));
                  //      if (_formfield.currentState!.validate());
                  // validator: (value) {
                  //   if(value!.isEmpty){
                  //     return "Enter the right Email";
                  //   }
                  //    if (value.isEmpty || !value.contains('@gmail.com')) {
                  //         return "Email Valid ";
                  //       }
                  // };
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context)=> ScreenView()));
                  // {
                  //   print("Success");
                  //   emailController.clear();
                  //   newPassController.clear();
                  // }
                  //     },
                  //     child: Text("Sign Up"))
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("back")),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formfield.currentState!.validate())
                          signup(context);
                        {
                          print("Success");
                          emailController.clear();
                          newPassController.clear();
                        }
                      },
                      child: Text("Signup"))
                ],
              )),
        ),
      ),
    );
  }
}
