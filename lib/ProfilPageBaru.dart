import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilPageBaru extends StatefulWidget {
  const ProfilPageBaru({super.key});

  @override
  State<ProfilPageBaru> createState() => _ProfilPageBaruState();
}

class _ProfilPageBaruState extends State<ProfilPageBaru> {
  File? image;

 Future getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? imagepicked = await _picker.pickImage(source: ImageSource.gallery);

  // Periksa apakah pengguna memilih foto atau membatalkan
  if (imagepicked != null) {
    image = File(imagepicked.path);
    setState(() {});
  } else {
    // Pengguna membatalkan pemilihan, tidak ada perubahan yang perlu di-handle
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                          // Ganti nilai sesuai keinginan Anda
                          ),
                      child: image != null
                          ? Image.file(image!, fit: BoxFit.cover, width: 200, height: 200,)
                          : Image.asset("assets/gb.jpg",
                              width: 200, height: 200, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue, // Ganti warna sesuai keinginan Anda
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () async {
                          await getImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Informasi Profil
            UserInfoCard(
              name: 'John Doe',
              email: 'johndoe@example.com',
              address: 'Jl. Contoh No. 123',
            ),
          ],
        ),
      ),
    );
  }

  void _changePhoto(BuildContext context) {
    // Implement logic to change the profile photo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ganti Foto Profil'),
          content: Text('Implement logic to change the profile photo here.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String address;

  const UserInfoCard(
      {Key? key,
      required this.name,
      required this.email,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $name', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Email: $email', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Alamat: $address', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
