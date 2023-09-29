import 'package:flutter/material.dart';

import '../../colors.dart';

enum DropdownOption { Delete, DeleteAll }

class ResponsiveTableControl extends StatefulWidget {
  final List<String> headers;
  final List<List<String>> rows;
  final Function(int)? onRowSelected; // Callback for row selection

  const ResponsiveTableControl({
    Key? key,
    required this.headers,
    required this.rows,
    this.onRowSelected,
  }) : super(key: key);

  @override
  _ResponsiveTableControlState createState() => _ResponsiveTableControlState();
}

class _ResponsiveTableControlState extends State<ResponsiveTableControl> {
  int? selectedRowIndex;
  bool ascending = true; // Sorting order
  int selectedColumnIndex = -1; // Column index for sorting

  List<bool> columnFilters = []; // Initialize with an empty list

  TextEditingController searchController = TextEditingController();
  String searchText = '';
  List<List<String>> filteredRows = []; // Initialize as an empty list

  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initialize columnFilters with false values for each header
    columnFilters = List.generate(widget.headers.length, (index) => false);
    filterRows(); // Initial filtering based on searchText
  }

  void filterRows() {
    if (searchText.isEmpty) {
      filteredRows = List.from(widget.rows);
    } else {
      filteredRows = widget.rows
          .where((row) => row.any(
              (cell) => cell.toLowerCase().contains(searchText.toLowerCase())))
          .toList();
    }
  }

  void toggleSort(int columnIndex) {
    if (columnIndex == selectedColumnIndex) {
      setState(() {
        ascending = !ascending;
      });
    } else {
      setState(() {
        selectedColumnIndex = columnIndex;
        ascending = true;
      });
    }
    filterRows(); // Reapply filtering after sorting
  }

  void resetSorting() {
    setState(() {
      selectedColumnIndex = -1;
      ascending = true;
    });
    filterRows(); // Reapply filtering after resetting sorting
  }

  @override
  Widget build(BuildContext context) {
    // Sort the rows based on the selected column and sorting order
    if (selectedColumnIndex >= 0) {
      filteredRows.sort((a, b) {
        return ascending
            ? a[selectedColumnIndex].compareTo(b[selectedColumnIndex])
            : b[selectedColumnIndex].compareTo(a[selectedColumnIndex]);
      });
    }

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Enable vertical scrolling
        controller: _verticalScrollController, // Set vertical scroll controller
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          controller:
              _horizontalScrollController, // Set horizontal scroll controller
          child: DataTable(
            columnSpacing: 40,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            columns: [
              ...widget.headers.asMap().entries.map((entry) {
                final columnIndex = entry.key;
                final header = entry.value;
                return DataColumn(
                  label: Row(
                    children: [
                      Text(
                        header,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: colorWhite,
                        ),
                      ),
                      // Add filter icon and functionality
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {
                          showFilterMenu(context, columnIndex);
                        },
                      ),
                    ],
                  ),
                  onSort: (columnIndex, ascending) {
                    toggleSort(columnIndex);
                  },
                );
              }),
            ],
            rows: filteredRows.asMap().entries.map((entry) {
              final index = entry.key;
              final row = entry.value;
              final isSelected = selectedRowIndex == index;

              return DataRow(
                selected: isSelected,
                color: isSelected
                    ? MaterialStateColor.resolveWith(
                        (states) => Colors.blue,
                      )
                    : null,
                onSelectChanged: (isSelected) {
                  setState(() {
                    selectedRowIndex = isSelected! ? index : null;
                  });
                  if (widget.onRowSelected != null) {
                    widget.onRowSelected!(isSelected! ? index : -1);
                  }
                },
                cells: [
                  ...row.map(
                    (cell) => DataCell(
                      Text(
                        cell,
                        style: const TextStyle(
                          fontSize: 14,
                          color: colorWhite,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      onTap: () {
                        if (selectedColumnIndex == 0) {
                          // Add cell-specific functionality for the first column
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Cell Details'),
                                content: Text('You tapped on cell: $cell'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Handle other columns' cell taps here
                        }
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the scroll controllers when the widget is disposed
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  void showFilterMenu(BuildContext context, int columnIndex) {
    final List<String> columnValues =
        widget.rows.map((row) => row[columnIndex]).toSet().toList();
    columnValues.sort();

    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        0,
        0,
        0,
        40,
      ),
      items: columnValues.map((value) {
        return PopupMenuItem<String>(
          value: value,
          child: CheckboxListTile(
            title: Text(
              value,
              style: TextStyle(
                fontWeight: columnFilters[columnIndex]
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: columnFilters[columnIndex] ? Colors.blue : Colors.black,
              ),
            ),
            value: columnFilters[columnIndex],
            onChanged: (isChecked) {
              setState(() {
                columnFilters[columnIndex] = isChecked!;
                applyColumnFilter(columnIndex, value);
              });
              Navigator.of(context).pop();
            },
          ),
        );
      }).toList(),
    );
  }

  void applyColumnFilter(int columnIndex, String filterValue) {
    setState(() {
      columnFilters[columnIndex] = true;
      filteredRows = widget.rows.where((row) {
        return row[columnIndex] == filterValue;
      }).toList();

      // Check if a column is filtered and update sorting accordingly
      if (selectedColumnIndex != -1) {
        toggleSort(selectedColumnIndex);
      }
    });
  }
}



// return Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     // Search Input
    //     Padding(
    //       padding: const EdgeInsets.only(
    //         bottom: 12.0,
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           TextField(
    //             controller: searchController,
    //             onChanged: (value) {
    //               setState(() {
    //                 searchText = value;
    //                 filterRows(); // Update filtering when the search text changes
    //               });
    //             },
    //             style: TextStyle(
    //               color: colorWhite,
    //             ),
    //             decoration: InputDecoration(
    //               hintText: 'Search...',
    //               hintStyle: TextStyle(
    //                 color: colorWhite,
    //               ),
    //               prefixIcon: Icon(Icons.search, color: colorWhite),
    //               suffixIcon: searchText.isNotEmpty
    //                   ? IconButton(
    //                       icon: Icon(Icons.clear),
    //                       onPressed: () {
    //                         setState(() {
    //                           searchController.clear();
    //                           searchText = '';
    //                           filterRows(); // Clear search and update filtering
    //                         });
    //                       },
    //                     )
    //                   : null,
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.blue),
    //                 borderRadius: BorderRadius.circular(5.0),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: colorWhite),
    //                 borderRadius: BorderRadius.circular(5.0),
    //               ),
    //             ),
    //           ),
    //           // Add the PopupMenuButton for Delete and Delete All options
    //           PopupMenuButton<DropdownOption>(
    //             icon: Icon(
    //               Icons.more_vert,
    //               color: Colors.white,
    //             ),
    //             onSelected: (option) {
    //               if (option == DropdownOption.Delete) {
    //                 // Handle Delete option here
    //                 // You can use the selectedRowIndex to delete a specific row
    //               } else if (option == DropdownOption.DeleteAll) {
    //                 // Handle Delete All option here
    //                 // You can delete all rows in your table
    //               }
    //             },
    //             itemBuilder: (BuildContext context) {
    //               return [
    //                 PopupMenuItem<DropdownOption>(
    //                   value: DropdownOption.Delete,
    //                   child: Text('Delete'),
    //                 ),
    //                 PopupMenuItem<DropdownOption>(
    //                   value: DropdownOption.DeleteAll,
    //                   child: Text('Delete All'),
    //                 ),
    //               ];
    //             },
    //           ),
    //         ],
    //       ),
    //     ),
    //     // Table headers with sorting wrapped in a ListView
    //     DataTable(
    //       columns: [
    //         ...widget.headers.asMap().entries.map((entry) {
    //           final columnIndex = entry.key;
    //           final header = entry.value;
    //           return DataColumn(
    //             label: Row(
    //               children: [
    //                 Text(
    //                   header,
    //                   style: const TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 16,
    //                     color: colorWhite,
    //                   ),
    //                 ),
    //                 // Add filter icon and functionality
    //                 IconButton(
    //                   icon: Icon(Icons.filter_list),
    //                   onPressed: () {
    //                     showFilterMenu(context, columnIndex);
    //                   },
    //                 ),
    //               ],
    //             ),
    //             onSort: (columnIndex, ascending) {
    //               toggleSort(columnIndex);
    //             },
    //           );
    //         }),
    //       ],
    //       rows: filteredRows.asMap().entries.map((entry) {
    //         final index = entry.key;
    //         final row = entry.value;
    //         final isSelected = selectedRowIndex == index;

    //         return DataRow(
    //           selected: isSelected,
    //           color: isSelected
    //               ? MaterialStateColor.resolveWith(
    //                   (states) => Colors.blue,
    //                 )
    //               : null,
    //           onSelectChanged: (isSelected) {
    //             setState(() {
    //               selectedRowIndex = isSelected! ? index : null;
    //             });
    //             if (widget.onRowSelected != null) {
    //               widget.onRowSelected!(isSelected! ? index : -1);
    //             }
    //           },
    //           cells: [
    //             ...row.map(
    //               (cell) => DataCell(
    //                 Text(
    //                   cell,
    //                   style: const TextStyle(
    //                     fontSize: 14,
    //                     color: colorWhite,
    //                   ),
    //                   overflow: TextOverflow.ellipsis,
    //                   maxLines: 1,
    //                 ),
    //                 onTap: () {
    //                   if (selectedColumnIndex == 0) {
    //                     // Add cell-specific functionality for the first column
    //                     showDialog(
    //                       context: context,
    //                       builder: (BuildContext context) {
    //                         return AlertDialog(
    //                           title: Text('Cell Details'),
    //                           content: Text('You tapped on cell: $cell'),
    //                           actions: [
    //                             TextButton(
    //                               onPressed: () {
    //                                 Navigator.of(context).pop();
    //                               },
    //                               child: Text('Close'),
    //                             ),
    //                           ],
    //                         );
    //                       },
    //                     );
    //                   } else {
    //                     // Handle other columns' cell taps here
    //                   }
    //                 },
    //               ),
    //             ),
    //           ],
    //         );
    //       }).toList(),
    //     ),
    //   ],
    // );