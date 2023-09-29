import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../models/home/menu_items_model.dart';
import '../../models/view/view_list_model.dart';
import '../../services/home/get/get_menu_items.dart';
import '../../services/view/get/get_view_list.dart';
import '../widgets/body/drawer.dart';
import '../../widgets/view/check_box.dart';
import '../../widgets/view/date_picker.dart';
import '../../widgets/view/date_time_picker.dart';
import '../../widgets/view/display_image.dart';
import '../../widgets/view/dropdown_list.dart';
import '../../widgets/view/list_tile.dart';
import '../../widgets/view/responsive_table.dart';
import '../widgets/general/button.dart';

class Components extends StatefulWidget {
  const Components({Key? key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  late Future<MenuItems> menuItems;

  late Future<ApiResponse> apiResponseJson;

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
    apiResponseJson = getApiResponse(context: context);
  }

  @override
  Widget build(BuildContext context) {
    //  final ApiResponse<Map<String, dynamic>> apiResponse = ApiResponse.fromJson(await apiResponseJson);
    // // Extract headers from the first item in the result
    // final headers = apiResponse.result.isNotEmpty
    //     ? apiResponse.result.first.keys.map((key) => key.toString()).toList()
    //     : <String>[];

    // // Extract rows from the result
    // final rows = apiResponse.result.map((data) {
    //   return headers.map((header) => data[header].toString()).toList();
    // }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('EffiCura'),
        backgroundColor: colorGreen,
      ),
      drawer: DrawerControl(
        menuItems: menuItems,
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: FutureBuilder<ApiResponse>(
          future: apiResponseJson, // Use the apiResponse Future
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
                  CheckBoxControl(
                    title: "Check 1",
                    isChecked: isCheckedValue,
                    onChanged: (value) {
                      setState(() {
                        isCheckedValue = value;
                      });
                    },
                  ),
                  Container(
                    child: ResponsiveTableControl(
                      headers: [
                        'Header 1',
                        'Header 2',
                        'Header 3',
                        'Header 4',
                        'Header 5',
                        'Header 6',
                        'Header 7',
                        'Header 8',
                        'Header 9',
                      ],
                      rows: [
                        [
                          'Row 1, Cell 1',
                          'Row 1, Cell 2',
                          'Row 1, Cell 3',
                          'Row 1, Cell 4',
                          'Row 1, Cell 5',
                          'Row 1, Cell 6',
                          'Row 1, Cell 7',
                          'Row 1, Cell 8',
                          'Row 1, Cell 9',
                        ],
                        [
                          'Row 2, Cell 1',
                          'Row 2, Cell 2',
                          'Row 2, Cell 3',
                          'Row 2, Cell 4',
                          'Row 2, Cell 5',
                          'Row 2, Cell 6',
                          'Row 2, Cell 7',
                          'Row 2, Cell 8',
                          'Row 2, Cell 9',
                        ],
                        // Add more rows as needed
                      ],
                    ),
                  ),
                  
                  DropdownListControl<String>(
                    isBusy: isBusy,
                    labelText: "Select an option",
                    items: [
                      DropdownMenuItem<String>(
                        value: "Option 1",
                        child: Text("Option 1"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Option 2",
                        child: Text("Option 2"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Option 3",
                        child: Text("Option 3"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Option 4",
                        child: Text("Option 4"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Option 5",
                        child: Text("Option 5"),
                      ),
                      // Add more items as needed
                    ],
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                  DatePickerControl(
                    label: 'Birthday',
                    selectedDate: selectedDate,
                    onDateSelected: _handleDateSelected,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Selected Date: ${selectedDate != null ? selectedDate!.toLocal().toString().split(' ')[0] : "No date selected"}',
                    style: TextStyle(fontSize: 18),
                  ),
                  DateTimePickerControl(
                    label: 'Birthday',
                    selectedDateTime: selectedDateTime,
                    onDateTimeSelected: _handleDateTimeSelected,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Selected Date and Time: ${selectedDate != null ? "${selectedDate!.toLocal().toString()}".split(' ')[0] + " " + "${selectedDate!.toLocal().toString()}".split(' ')[1] : "No date selected"}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  DisplayImageControl(
                    imageUrl: "http://127.0.0.1:5000/static/img/logo.png",
                    onTap: () {},
                  ),
                  ListTileControl(
                    title: 'List Tile Title',
                    subtitle: 'List Tile Subtitle',
                    thumbnailUrl: "http://127.0.0.1:5000/static/img/logo.png",
                    onTap: () {
                      // Handle tap action here
                      print('List Tile tapped!');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Company: Your Company Name', // Add your company name here
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Site: Your Company Site', // Add your company site here
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Welcome to EffiCura!\nEffiCura is your hub for efficient task management.',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ButtonControl(
                    title: "Back",
                    onTap: () async {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/home", (_) => false);
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
