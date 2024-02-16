import 'package:coba_tampilan/ApiService.dart';
import 'package:coba_tampilan/BerandaPage.dart';
import 'package:coba_tampilan/BerandaPageBaru.dart';
import 'package:coba_tampilan/RegisterPage.dart';
import 'package:coba_tampilan/user_model.dart';
import 'package:coba_tampilan/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

  // final ApiService apiService = ApiService('http://172.17.202.2:8080/coba/mobile');
  final ApiService apiService = ApiService();

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('assets/bg.png'), // Sesuaikan path dengan benar
                  //   fit: BoxFit.fill,
                  // ),
                ),
                child: Stack(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/bg.png'), // Sesuaikan path dengan benar
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   left: 140,
                    //   width: 80,
                    //   height: 150,
                    //   child: FadeInDown(
                    //     duration: Duration(milliseconds: 1300),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         image: DecorationImage(
                    //           image: AssetImage('assets/bg1.png'), // Sesuaikan path dengan benar
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/bg1.png'), // Sesuaikan path dengan benar
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nama Pengguna",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Kata Sandi",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _login(context);
                          },
                          splashColor: Colors.grey,
                          hoverColor: Colors.grey,
                          child: Ink(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.blueAccent,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: Text("Belum punya akun? ")),
                        InkWell(
                          onTap: () {
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: FadeInUp(
                            duration: Duration(milliseconds: 1900),
                            child: Text(
                              "Daftar disini!",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Lupa Sandi?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
void _login(BuildContext context) async {
  String username = usernameController.text;
  String password = passwordController.text;

  // Validasi form, misalnya memastikan semua field terisi dengan benar

  try {
    Map<String, dynamic> response = await apiService.login(username, password);

    print('Response from server: $response'); // Cetak respons ke konsol

    if (response['status'] == 'success') {
      print('Login successful');
      // Tambahkan logika navigasi atau tindakan setelah login berhasil


            // Set the user data using the provider
      context.read<UserProvider>().setUser(
        UserModel(
          id:  response['id'],
          nama: response['username'], // replace with the actual field name
          nomor: response['nomor'],
          foto_profil: response['foto_profil'] // replace with the actual field name
        ),
      );


      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BerandaPageBaru(),
        ),
      );
    } else {
      print('Login failed: ${response['message']}');
      // Tambahkan logika penanganan jika login gagal
    }
  } catch (e) {
    print('Error during login: $e');
    // Tambahkan logika penanganan jika terjadi error
  }
}


}

