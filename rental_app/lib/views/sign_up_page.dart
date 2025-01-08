import 'package:flutter/material.dart';
import 'package:krysha_kz/data/house_data.dart';
import 'package:krysha_kz/views/homepage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- EMAIL FIELD -- 
              const Text("Email", style: TextStyle(fontSize: 16),),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                },
              ),

              // -- PASSWORD FIELD --
              const SizedBox(height: 16,),
              const Text("Password", style: TextStyle(fontSize: 16),),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              // -- SUBMIT BUTTON --
              const SizedBox(height: 24,),
              Center(
                child: ElevatedButton(
                  onPressed: () { print("Sign up button pressed");},
                  child: const Text("Sign Up")),
              ),

              // -- SIGN IN LINK --
              const SizedBox(height: 16,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print("Sign in button pressed");
                  },
                  child: const Text("Already have an account?", style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 16),),
                ),
              ),
            ],
          ),
        ),  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(initialHouses: houses,)));
        },
        child: const Icon(Icons.admin_panel_settings_sharp),
      ),
    );
  }
}