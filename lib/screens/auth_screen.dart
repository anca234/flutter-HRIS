import 'package:flutter/material.dart';
import 'package:secondly/screens/main_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        // Gunakan Center untuk memusatkan konten
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // Pusatkan konten secara horizontal
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome to HR Apps",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sign up, or login to proceed to your HR dashboard",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const Image(
              image: AssetImage('assets/threepeople.png'),
              width: 340,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSignInBottomSheet(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)),
                backgroundColor: const Color.fromRGBO(204, 0, 0, 1.0),
                padding: EdgeInsets.symmetric(horizontal: 133, vertical: 10),
              ),
              child: const Text('Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showComingSoonPopup(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 181, 173, 173))),
                backgroundColor: const Color.fromRGBO(217, 217, 217, 1.0),
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
              ),
              child: const Text('Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 84, 82, 82),
                    fontSize: 20,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void showComingSoonPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Coming Soon"),
        content: const Text("Fitur ini sedang dalam pengembangan."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }

  void _showSignInBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Agar modal menyesuaikan konten
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Color.fromARGB(255, 217, 217, 217),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(),
                  hintText: "Enter your e-mail",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 8), // Memberikan jarak kecil
              GestureDetector(
                onTap: () {
                  showComingSoonPopup(context);
                  print("Forgot Password tapped!");
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.red, // Warna teks merah
                    decoration: TextDecoration.underline, // Garis bawah
                    fontSize: 16, // Ukuran font opsional
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)),
                  backgroundColor: const Color.fromRGBO(204, 0, 0, 1.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
