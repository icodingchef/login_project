import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                      'images/signup.png',
                      width: 150,
                      height: 150,
                    )
                    .animate()
                    .fade()
                    .slideY(
                      begin: -3,
                      end: 0,
                    )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shake(
                      hz: 4,
                      curve: Curves.easeInOutCubic,
                      duration: 1800.ms,
                    ),
                SizedBox(
                  height: 5,
                ),
                Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    .animate()
                    .fade(delay: 500.ms)
                    .slideX(begin: -2, end: 0)
                    .tint(color: Colors.purple, delay: 1000.ms),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Sign up to continue",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ).animate().fade(delay: 500.ms).slideX(begin: 2, end: 0),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ).animate().fade(delay: 900.ms).slideX(begin: -3, end: 0),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ).animate().fade(delay: 900.ms).slideX(begin: 3, end: 0),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      final newUser = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      if (newUser.user != null) {
                        emailController.clear();
                        passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("회원가입에 성공했습니다"),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("회원가입 도중에 문제가 발생했습니다"),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orange[300],
                    ),
                    child: Icon(Icons.arrow_forward),
                  ).animate().fade(delay: 1000.ms),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ).animate().slideX(
                      begin: -3,
                      end: 0,
                      duration: 300.ms,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ).animate().slideX(
                      begin: 3,
                      end: 0,
                      duration: 300.ms,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text("Powered by CodingChef").animate().fade().slideX(
                          begin: -3,
                          end: 0,
                          delay: 300.ms,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[200],
                            image: DecorationImage(
                              image: AssetImage('images/codingchef4.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .animate()
                        .slideX(begin: 3, end: 0, delay: 300.ms)
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(delay: 1000.ms, duration: 1800.ms),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
