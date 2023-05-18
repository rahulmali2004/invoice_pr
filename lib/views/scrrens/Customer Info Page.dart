import 'package:flutter/material.dart';

import '../../modals/product_modals.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({Key? key}) : super(key: key);

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CustomerInfoPage",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Name"),
              TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",
                    border: OutlineInputBorder()),
                onSaved: (val) {
                  Myvariable.name = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your Name";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Mail"),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Enter Mail",
                    labelText: "Mail",
                    border: OutlineInputBorder()),
                onSaved: (val) {
                  Myvariable.email = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Phone Number"),
              TextFormField(
                maxLength: 10,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Enter Phone Number",
                    labelText: "Phone",
                    prefixText: "+91",
                    border: OutlineInputBorder()),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Phone Number";
                  } else if (val!.length < 10) {
                    return "Invalid Number";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  Myvariable.mobile_no = int.parse(val!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
    );
  }
}
