import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parking_app/booking_history.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _regnoController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void bookSlot() {
    FirebaseFirestore.instance.collection('bookings').add({
      'location': _locationController.text,
      'place': _placeController.text,
      'reg_no': _regnoController.text,
      'time': _timeController.text,
      'date': _dateController.text,
      'timestamp': Timestamp.now(),
    });
    print("Slot Booked Succesfully");
  }

  void showSnackBar() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Booking Successful")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Slot'),
        backgroundColor: Colors.yellow[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextField(
              controller: _regnoController,
              decoration: InputDecoration(labelText: 'Enter Vehicle No:'),
            ),

            DropdownButtonFormField<String>(
              value:
                  _locationController.text.isEmpty
                      ? null
                      : _locationController.text,
              decoration: InputDecoration(labelText: 'Select Location'),
              items:
                  ['Mumbai', 'Chennai'].map((String location) {
                    return DropdownMenuItem<String>(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _locationController.text = newValue!;
                });
              },
            ),
            TextField(
              controller: _placeController,
              decoration: InputDecoration(labelText: 'Enter Place'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Date (YYYY-MM-DD)'),
              keyboardType: TextInputType.datetime,
              onChanged: (String? newValue) {
                setState(() {
                  _dateController.text = newValue!;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Time (HH:MM)'),
              keyboardType: TextInputType.datetime,
              onChanged: (String? newValue) {
                setState(() {
                  _timeController.text = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showSnackBar();
                bookSlot();
              },
              child: Text('Confirm Booking'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingHistoryScreen(),
                  ),
                );
              },
              child: Text('Booking History'),
            ),
          ],
        ),
      ),
    );
  }
}
