import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';
import 'package:tut_care/features/Appointments/presentation/manager/get_doctors_block/get_doctors_bloc.dart';
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
  AvailableDoctorModel? selectedDoctor;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GetDoctorsBloc, GetDoctorsState>(
        builder: (context, state) {
          if (state is GetDoctorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetDoctorsFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          if (state is GetDoctorsSuccess) {
            if (selectedDoctor == null && state.doctors.isNotEmpty) {
              selectedDoctor = state.doctors.first;
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Book Appointment',
                  ),

                  DoctorDropdown(
                    doctors: state.doctors,
                    value: selectedDoctor,
                    onChanged: (doctor) {
                      setState(() {
                        selectedDoctor = doctor;
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
                    onTap: () {
                     
                    },
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
