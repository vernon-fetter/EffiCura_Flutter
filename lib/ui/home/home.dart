import 'package:flutter/material.dart';

import '../../models/home/menu_items_model.dart';
import '../../models/view/view_list_model.dart';
import '../../services/home/get/get_menu_items.dart';
import '../../services/view/get/get_view_list.dart';
import '../../widgets/general/button.dart';
import '../../widgets/body/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<MenuItems> menuItems;

  late Future<ApiResponse> apiResponse;

  bool isBusy = false;

  bool isCheckedValue = false;

  String? selectedValue = "Option 1";

  DateTime? selectedDate = DateTime.now();
  DateTime? selectedDateTime = DateTime.now();

  void _handleDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _handleDateTimeSelected(DateTime dateTime) {
    setState(() {
      selectedDateTime = dateTime;
    });
  }

  @override
  void initState() {
    super.initState();
    menuItems = getMenuItems(context: context);
    apiResponse = getApiResponse(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EffiCura'),
        centerTitle: true,
      ),
      drawer: DrawerControl(
        menuItems: menuItems,
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: FutureBuilder<ApiResponse>(
          future: apiResponse, // Use the apiResponse Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading indicator while waiting for data
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Handle any errors that occur during data retrieval
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data?.result == null) {
              // Handle the case where no data is available
              return Center(
                child: Text('No data available.'),
              );
            } else {
              // Data retrieval was successful, display the data
              final apiData = snapshot.data;

              // Example: Access data from the API response
              final companyData = apiData!.result;
              final companyName =
                  companyData.isNotEmpty ? companyData[0]['company_name'] : '';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Company Name: $companyName'),
                  // Add more widgets to display other data here
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Company: Your Company Name', // Add your company name here
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Site: Your Company Site', // Add your company site here
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Welcome to EffiCura!\nEffiCura is your hub for efficient task management.',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ButtonControl(
                    title: "Components",
                    onTap: () async {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/components", (_) => false);
                    },
                    isBusy: false,
                    type: ButtonControlType.primary,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
