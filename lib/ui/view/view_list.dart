import 'package:flutter/material.dart';

import '../../models/view/view_list_model.dart';
import '../../services/view/get/get_view_list.dart';
import '../../widgets/general/button.dart';
import '../../widgets/view/responsive_table.dart';

class MyTable extends StatefulWidget {
  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  late Future<ApiResponse> apiResponseJson; // Change to apiResponseJson

  @override
  void initState() {
    super.initState();
    apiResponseJson = getApiResponse(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResponse>(
      future: apiResponseJson,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
          return Text('No data available');
        } else {
          final headers = snapshot.data!.result.isNotEmpty
              ? snapshot.data!.result.first.keys
                  .map((key) => key.toString())
                  .toList()
              : <String>[];

          final rows = snapshot.data!.result.map((data) {
            return headers.map((header) => data[header].toString()).toList();
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: const Text('EffiCura'),
              centerTitle: true,
              leading: ButtonControl(
                title: "Back",
                onTap: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/home", (_) => false);
                },
                isBusy: false,
                type: ButtonControlType.primary,
              ),
            ),
            body: SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  ResponsiveTableControl(
                    headers: headers,
                    rows: rows,
                    onRowSelected: (int index) {
                      print('Selected row: $index');
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
