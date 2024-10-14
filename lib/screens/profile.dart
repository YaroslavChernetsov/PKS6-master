import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  String name = "Иван";
  String surname = "Иванов";
  String email = "ivan@example.com";
  String phone = "1234567890";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    surnameController.text = surname;
    emailController.text = email;
    phoneController.text = phone;
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      name = nameController.text;
      surname = surnameController.text;
      email = emailController.text;
      phone = phoneController.text;
      isEditing = false;
    });
  }

  void _editProfile() {
    setState(() {
      isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 20),
          isEditing
              ? Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Имя'),
                      controller: nameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Фамилия'),
                      controller: surnameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                      controller: emailController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Телефон'),
                      controller: phoneController,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveProfile,
                      child: Text('Сохранить'),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text('Имя: $name', style: TextStyle(fontSize: 18)),
                    Text('Фамилия: $surname', style: TextStyle(fontSize: 18)),
                    Text('Email: $email', style: TextStyle(fontSize: 18)),
                    Text('Телефон: $phone', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _editProfile,
                      child: Text('Редактировать'),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
