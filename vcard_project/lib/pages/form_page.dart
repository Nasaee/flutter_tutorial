import 'package:flutter/material.dart';
import 'package:vcard_project/models/contact_model.dart';
import 'package:vcard_project/utils/constants.dart';

class FormPage extends StatefulWidget {
  static const String routeName = 'form';
  final ContactModel contactModel;
  const FormPage({super.key, required this.contactModel});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _companyController = TextEditingController();
  final _designationController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contactModel.name;
    _mobileController.text = widget.contactModel.mobile;
    _emailController.text = widget.contactModel.email;
    _companyController.text = widget.contactModel.company;
    _designationController.text = widget.contactModel.designation;
    _addressController.text = widget.contactModel.address;
    _websiteController.text = widget.contactModel.website;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Page')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Contact Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrMsg;
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _mobileController,
              decoration: const InputDecoration(labelText: 'Mobile Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrMsg;
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrMsg;
                } else if (!value.contains('@')) {
                  return 'Invalid Email Address';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Street Address'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyFieldErrMsg;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(labelText: 'Company Name'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _designationController,
              decoration: const InputDecoration(labelText: 'Designation'),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              controller: _websiteController,
              decoration: const InputDecoration(labelText: 'Website'),
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _companyController.dispose();
    _designationController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    super.dispose();
  }
}
