// import 'package:flutter/material.dart';

// class FormValidationExample extends StatefulWidget {
//   @override
//   _FormValidationExampleState createState() => _FormValidationExampleState();
// }

// class _FormValidationExampleState extends State<FormValidationExample> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   // Text controllers for each TextFormField
//   final List<TextEditingController> _controllers =
//       List.generate(10, (_) => TextEditingController());

//   final List<String> _fieldLabels = [
//     "First Name",
//     "Last Name",
//     "Email",
//     "Phone Number",
//     "Address",
//     "City",
//     "State",
//     "Postal Code",
//     "Country",
//     "Company"
//   ];
//   void _submitForm() {
//     bool formValid = true;

//     // Check if any field is empty
//     for (int i = 0; i < _controllers.length; i++) {
//       if (_controllers[i].text.isEmpty) {
//         formValid = false;
//         // Show a Snackbar with the appropriate message
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('${_fieldLabels[i]} is empty! Please fill it out.'),
//           backgroundColor: Colors.red,
//         ));
//         break;
//       }
//     }

//     if (formValid) {
//       // If the form is valid, submit the data
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Form Submitted Successfully')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Form Fields
//           ...List.generate(10, (index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: TextFormField(
//                 controller: _controllers[index],
//                 decoration: InputDecoration(
//                   labelText: 'Field ${index + 1}',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'This field cannot be empty';
//                   }
//                   return null;
//                 },
//               ),
//             );
//           }),

//           // Submit Button
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: ElevatedButton(
//               onPressed: _submitForm,
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
