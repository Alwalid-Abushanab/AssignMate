import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/route_generator.dart';
import 'cubit/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AssignMate SignUp"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),

              const Text("Please Fill the following fields to Sign Up",textScaleFactor: 1.5,),

              const SizedBox(height: 30,),

              //Email Field
              myTextField(
                  controller: emailController,
                  hint: "Email",
                  obscured: false
              ),

              const SizedBox(height: 15,),

              //password field
              myTextField(
                  controller: passwordController,
                  hint: 'Password',
                  obscured: true
              ),

              const SizedBox(height: 15,),

              //confirm password
              myTextField(
                  controller: confirmPasswordController,
                  hint: 'Confirm Password',
                  obscured: true
              ),

              const SizedBox(height: 20,),

              //log in button
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {

                  if(state is SignedUp){
                    //BlocProvider.of<SignupCubit>(context).successful(false);
                    Navigator.pop(context);
                  }
                  return GestureDetector(
                    onTap: state is SigningUp ? null : () async {
                      BlocProvider.of<SignupCubit>(context).trySigningUp();
                      try {
                        if(passwordController.text == confirmPasswordController.text) {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text
                          );
                          BlocProvider.of<SignupCubit>(context).successful(true);
                        }
                        else {
                          BlocProvider.of<SignupCubit>(context).successful(false);
                          showDialog(context: context, builder: (context){
                            return const AlertDialog(
                              title: Text('Password and Confirmed Password do not match'),
                            );
                          });
                        }
                      } on FirebaseAuthException catch(e) {
                        BlocProvider.of<SignupCubit>(context).successful(false);
                        showDialog(context: context, builder: (context){
                          return const AlertDialog(
                            title: Text('Incorrect Email Or Password'),
                          );
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: state is! SigningUp ? const Center(
                        child: Text("Sign Up",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ): const Center(
                        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 12,),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 50,),

              //google login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignInButton(
                    Buttons.GoogleDark,
                    onPressed: () async {
                      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
                      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
                      final credential = GoogleAuthProvider.credential(
                        accessToken: gAuth.accessToken,
                        idToken: gAuth.idToken,
                      );

                      await FirebaseAuth.instance.signInWithCredential(credential);
                    },
                  )
                ],
              ),

              const SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already a member?'),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, RouteGenerator.loginPage),
                    child: const Text('Login Now',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myTextField({required controller, required String hint, required bool obscured}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscured,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(10)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint,
        ),
      ),
    );
  }
}
