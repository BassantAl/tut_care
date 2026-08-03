import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_error_widget.dart';
import 'package:tut_care/core/widgets/custom_loading_indicator.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';
import 'package:tut_care/features/Appointments/data/models/book_appointment_request_model.dart';
import 'package:tut_care/features/Appointments/presentation/manager/book_appointment_bloc/book_appointment_bloc.dart';
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
      child: BlocListener<BookAppointmentBloc, BookAppointmentState>(
        listener: (context, state) {
          if (state is BookAppointmentSuccess) {
            GoRouter.of(context).pop(true);
          }

          if (state is BookAppointmentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.shade400,
                behavior: SnackBarBehavior.floating,
                content: CustomErrorWidget(errorMessage: state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<GetDoctorsBloc, GetDoctorsState>(
          builder: (context, state) {
            if (state is GetDoctorsLoading) {
              return const Center(child: CustomLoadingIndicator());
            }

            if (state is GetDoctorsFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.medium16(context),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is GetDoctorsSuccess) {
              if (selectedDoctor == null && state.doctors.isNotEmpty) {
                selectedDoctor = state.doctors.first;
              }

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            color: AppColors.primary,
                            onPressed: () => context.pop(),
                          ),
                          title: 'Book Appointment',
                        ),
                        const SizedBox(height: 12),
                        if (selectedDoctor != null)
                          _SelectedDoctorLabel(
                            doctorName: selectedDoctor!.fullName,
                          ),
                        const SizedBox(height: 20),
                        DoctorDropdown(
                          doctors: state.doctors,
                          value: selectedDoctor,
                          onChanged: (doctor) {
                            setState(() => selectedDoctor = doctor);
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
                              setState(() => selectedDate = date);
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
                              setState(() => selectedTime = time);
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                        BlocBuilder<BookAppointmentBloc, BookAppointmentState>(
                          builder: (context, bookState) {
                            return BookAppointmentButton(
                              onTap: bookState is BookAppointmentLoading
                                  ? null
                                  : _onBookTap,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _onBookTap() {
    if (selectedDoctor == null) {
      _showError('Please select a doctor.');
      return;
    }
    if (selectedDate == null) {
      _showError('Please select a date.');
      return;
    }
    if (selectedTime == null) {
      _showError('Please select a time.');
      return;
    }

    final appointmentDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    context.read<BookAppointmentBloc>().add(
          BookAppointmentRequested(
            request: BookAppointmentRequestModel(
              doctorId: selectedDoctor!.id,
              appointmentDate: appointmentDateTime,
            ),
          ),
        );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade400,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: AppStyles.medium16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class _SelectedDoctorLabel extends StatelessWidget {
  const _SelectedDoctorLabel({required this.doctorName});

  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: AppColors.secondary,
          ),
          const SizedBox(width: 6),
          Text(
            'Booking with $doctorName',
            style: AppStyles.medium14(context).copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
