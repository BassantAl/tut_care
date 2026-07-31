import 'package:flutter/material.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/appointment_date_field.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/appointment_time_field.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/book_appointment_button.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_app_bar.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/doctor_dropdown.dart';

class BookAppointmentBody extends StatefulWidget {
  const BookAppointmentBody({super.key});

  @override
  State<BookAppointmentBody> createState() => _BookAppointmentBodyState();
}

class _BookAppointmentBodyState extends State<BookAppointmentBody> {
  final doctors = const [
    'Dr. Eyad Ashraf',
    'Dr. Ahmed Mohamed',
    'Dr. Sara Ali',
  ];

  String? selectedDoctor = 'Dr. Eyad Ashraf';

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: [

            CustomAppBar(title: 'Book Appointment' ),
            DoctorDropdown(
              doctors: doctors,
              value: selectedDoctor,
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value;
                });
              },
            ),
      
            const SizedBox(height: 20),
      
            AppointmentDateField(
              date: selectedDate,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                );
      
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
            ),
      
            const SizedBox(height: 20),
      
            AppointmentTimeField(
              time: selectedTime,
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
      
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                  });
                }
              },
            ),
      
            const SizedBox(height: 40),
      
            BookAppointmentButton(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}