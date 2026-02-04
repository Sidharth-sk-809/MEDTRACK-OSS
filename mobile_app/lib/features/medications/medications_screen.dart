import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/medication.dart';

final Random _random = Random();

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});
  static const int n = 10;
  static List<Medication> medicationList = List.generate(
    10,
    (index) => Medication(
      id: index.toString(),
      name: 'Medication ${index + 1}',
      dosage: '${(index + 1) * 10} mg',
      time: _random.nextInt(24).toString(),
      frequency: List.generate(7, (day) => _random.nextBool()),
    ),
  );

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medications')),
      body: ListView.builder(
        itemCount: MedicationsScreen.medicationList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 0.0,
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              tileColor: Colors.blueAccent,
              title: Text(
                MedicationsScreen.medicationList[index].name,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dosage: ${MedicationsScreen.medicationList[index].dosage}",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Text(
                    "Time: ${int.parse(MedicationsScreen.medicationList[index].time) % 12 == 0 ? 12 : (int.parse(MedicationsScreen.medicationList[index].time) % 12).toString()} ${int.parse(MedicationsScreen.medicationList[index].time) < 12 ? 'AM' : 'PM'}",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "Frequency: ",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[0]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[1]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[2]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[3]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[4]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[5]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.circle,
                        color:
                            MedicationsScreen.medicationList[index].frequency[6]
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // Action to view medication details
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add new medication
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
