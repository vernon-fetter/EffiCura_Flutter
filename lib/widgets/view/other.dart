import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Table Example'),
        ),
        body: DataTableDemo(),
      ),
    );
  }
}

class DataTableDemo extends StatelessWidget {
  // Sample data for the table
  final List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'name': 'John',
      'age': 30,
      'birthdate': '01/01/1990',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 2,
      'name': 'Jane',
      'age': 25,
      'birthdate': '01/01/1995',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 3,
      'name': 'Mary',
      'age': 20,
      'birthdate': '01/01/2000',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 4,
      'name': 'Peter',
      'age': 35,
      'birthdate': '01/01/1985',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 5,
      'name': 'Paul',
      'age': 40,
      'birthdate': '01/01/1980',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 6,
      'name': 'Mark',
      'age': 45,
      'birthdate': '01/01/1975',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 7,
      'name': 'Luke',
      'age': 50,
      'birthdate': '01/01/1970',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 8,
      'name': 'James',
      'age': 55,
      'birthdate': '01/01/1965',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc, eget aliquet nisl nunc eget nisl.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 9,
      'name': 'Jude',
      'age': 60,
      'birthdate': '01/01/1960',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices, nunc nisl aliquam nunc.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 10,
      'name': 'Simon',
      'age': 65,
      'birthdate': '01/01/1955',
      'biography':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies ultrices.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 11,
      'name': 'Thomas',
      'age': 70,
      'birthdate': '01/01/1950',
      'biography': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 12,
      'name': 'Andrew',
      'age': 75,
      'birthdate': '01/01/1945',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 13,
      'name': 'Philip',
      'age': 80,
      'birthdate': '01/01/1940',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 14,
      'name': 'Bartholomew',
      'age': 85,
      'birthdate': '01/01/1935',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 15,
      'name': 'Matthew',
      'age': 90,
      'birthdate': '01/01/1930',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 16,
      'name': 'James',
      'age': 95,
      'birthdate': '01/01/1925',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 17,
      'name': 'Judas',
      'age': 100,
      'birthdate': '01/01/1920',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 18,
      'name': 'Matthias',
      'age': 105,
      'birthdate': '01/01/1915',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 19,
      'name': 'John',
      'age': 110,
      'birthdate': '01/01/1910',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
    {
      'id': 20,
      'name': 'Simon',
      'age': 115,
      'birthdate': '01/01/1905',
      'biography': 'Lorem ipsum dolor sit amet.',
      'actions': 'Edit | Delete'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Birthdate')),
          DataColumn(label: Text('Biography')),
          DataColumn(label: Text('Actions')),
        ],
        rows: data.map((item) {
          return DataRow(cells: [
            DataCell(Text(item['id'].toString())),
            DataCell(Text(item['name'])),
            DataCell(Text(item['age'].toString())),
            DataCell(Text(item['birthdate'])),
            DataCell(Text(item['biography'])),
            DataCell(Text(item['actions']))
          ]);
        }).toList(),
      ),
    );
  }
}
