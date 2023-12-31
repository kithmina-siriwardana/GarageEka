import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkshopRegistrationScreen extends StatefulWidget {
  @override
  _WorkshopRegistrationScreenState createState() =>
      _WorkshopRegistrationScreenState();
}

class _WorkshopRegistrationScreenState
    extends State<WorkshopRegistrationScreen> {
  final nameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final mobileController = TextEditingController();
  final whatsappController = TextEditingController();
  final descriptionController = TextEditingController();
  final provinceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf7c910),
        title: Text('Workshop Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Logo', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Brands', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[
                  Chip(label: Text('Hyundai')),
                  Chip(label: Text('Toyota')),
                  Chip(label: Text('Nissan')),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Classification',
                  hintText: 'Choose Classification',
                  suffixIcon: Icon(Icons.arrow_forward_ios),
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Garage name...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ownerNameController,
                decoration: InputDecoration(
                  labelText: 'Name (Owner)',
                  hintText: 'Owner name ...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: mobileController,
                decoration: InputDecoration(
                  prefixText: '+968 ',
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: whatsappController,
                decoration: InputDecoration(
                  prefixText: '+968 ',
                  labelText: 'Whatsapp Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: provinceController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Province',
                  hintText: 'Select Province',
                  border: OutlineInputBorder(),
                ),
                onTap: () {},
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.red),
                title: Text('Colombo, Sri Lanka'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Lorem ipsum dummy text',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text('CANCEL'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> dataToSave = {
                        'Name': nameController.text,
                        'Owner Name': ownerNameController.text,
                        'Mobile': mobileController.text,
                        'Whatsapp Number': whatsappController.text,
                        'Description': descriptionController.text,
                      };

                      final firestore = FirebaseFirestore.instance;
                      await firestore.collection('workshops').add(dataToSave);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                    ),
                    child: Text('SUBMIT'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
