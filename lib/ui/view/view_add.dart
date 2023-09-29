import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Widgets Example'),
        ),
        body: ViewWidget(
          jsonResponse: jsonResponse2, // Change to jsonResponse2 for the second response
        ),
      ),
    );
  }
}

class ViewWidget extends StatelessWidget {
  final String jsonResponse;

  ViewWidget({required this.jsonResponse});

  @override
  Widget build(BuildContext context) {
    final view = viewFromJson(jsonResponse);
    final addColumns = view.addColumns;

    return ListView.builder(
      itemCount: addColumns?.length ?? 0,
      itemBuilder: (context, index) {
        final addColumn = addColumns![index];
        return ListTile(
          title: Text(addColumn.label ?? ''),
          subtitle: Text(addColumn.type ?? ''),
          // Customize the ListTile or use different widgets based on the addColumn properties.
        );
      },
    );
  }
}

// Define your JSON responses
const jsonResponse1 = '''
{
  "add_columns": [
    {
      "count": 0,
      "description": "",
      "label": "Sites",
      "name": "sites",
      "required": false,
      "type": "RelatedList",
      "unique": false,
      "values": []
    },
    {
      "count": 1,
      "description": "",
      "label": "Created By",
      "name": "created_by",
      "required": true,
      "type": "Related",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    },
    {
      "count": 1,
      "description": "",
      "label": "Changed By",
      "name": "changed_by",
      "required": true,
      "type": "Related",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    },
    {
      "description": "",
      "label": "Created On",
      "name": "created_on",
      "required": false,
      "type": "DateTime",
      "unique": false
    },
    {
      "description": "",
      "label": "Changed On",
      "name": "changed_on",
      "required": false,
      "type": "DateTime",
      "unique": false
    },
    {
      "description": "",
      "label": "Company Name",
      "name": "company_name",
      "required": true,
      "type": "String",
      "unique": true,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Address",
      "name": "company_address",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company City",
      "name": "company_city",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company State",
      "name": "company_state",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Zip",
      "name": "company_zip",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Country",
      "name": "company_country",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Phone Number",
      "name": "company_phone_number",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=64, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Website",
      "name": "company_website",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=128, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Email",
      "name": "company_email",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=128, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Company Logo",
      "name": "company_logo",
      "required": false,
      "type": "String",
      "unique": false
    }
  ]
}
''';

const jsonResponse2 = '''
{
  "add_columns": [
    {
      "count": 0,
      "description": "",
      "label": "Employee",
      "name": "employee",
      "required": false,
      "type": "Related",
      "unique": false,
      "values": []
    },
    {
      "count": 2,
      "description": "",
      "label": "Roles",
      "name": "roles",
      "required": false,
      "type": "RelatedList",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Admin"
        },
        {
          "id": 2,
          "value": "Public"
        }
      ]
    },
    {
      "count": 1,
      "description": "",
      "label": "Created By",
      "name": "created_by",
      "required": false,
      "type": "Related",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    },
    {
      "count": 1,
      "description": "",
      "label": "Changed By",
      "name": "changed_by",
      "required": false,
      "type": "Related",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    },
    {
      "description": "",
      "label": "First Name",
      "name": "first_name",
      "required": true,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=64, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Last Name",
      "name": "last_name",
      "required": true,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=64, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Username",
      "name": "username",
      "required": true,
      "type": "String",
      "unique": true,
      "validate": [
        "<Length(min=None, max=64, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Password",
      "name": "password",
      "required": false,
      "type": "String",
      "unique": false,
      "validate": [
        "<Length(min=None, max=256, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Active",
      "name": "active",
      "required": false,
      "type": "Boolean",
      "unique": false
    },
    {
      "description": "",
      "label": "Email",
      "name": "email",
      "required": true,
      "type": "String",
      "unique": true,
      "validate": [
        "<Length(min=None, max=64, equal=None, error=None)>"
      ]
    },
    {
      "description": "",
      "label": "Last Login",
      "name": "last_login",
      "required": false,
      "type": "DateTime",
      "unique": false
    },
    {
      "description": "",
      "label": "Login Count",
      "name": "login_count",
      "required": false,
      "type": "Integer",
      "unique": false
    },
    {
      "description": "",
      "label": "Fail Login Count",
      "name": "fail_login_count",
      "required": false,
      "type": "Integer",
      "unique": false
    },
    {
      "description": "",
      "label": "Created On",
      "name": "created_on",
      "required": false,
      "type": "DateTime",
      "unique": false
    },
    {
      "description": "",
      "label": "Changed On",
      "name": "changed_on",
      "required": false,
      "type": "DateTime",
      "unique": false
    },
    {
      "count": 1,
      "description": "",
      "label": "Created",
      "name": "created",
      "required": false,
      "type": "RelatedList",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    },
    {
      "count": 1,
      "description": "",
      "label": "Changed",
      "name": "changed",
      "required": false,
      "type": "RelatedList",
      "unique": false,
      "values": [
        {
          "id": 1,
          "value": "Vernon Fetter"
        }
      ]
    }
  ]
}
''';

View viewFromJson(String str) => View.fromJson(json.decode(str));

String viewToJson(View data) => json.encode(data.toJson());

class View {
    List<AddColumn>? addColumns;

    View({
        this.addColumns,
    });

    factory View.fromJson(Map<String, dynamic> json) => View(
        addColumns: json["add_columns"] == null ? [] : List<AddColumn>.from(json["add_columns"]!.map((x) => AddColumn.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "add_columns": addColumns == null ? [] : List<dynamic>.from(addColumns!.map((x) => x.toJson())),
    };
}

class AddColumn {
    int? count;
    String? description;
    String? label;
    String? name;
    bool? required;
    String? type;
    bool? unique;
    List<Value>? values;
    List<String>? validate;

    AddColumn({
        this.count,
        this.description,
        this.label,
        this.name,
        this.required,
        this.type,
        this.unique,
        this.values,
        this.validate,
    });

    factory AddColumn.fromJson(Map<String, dynamic> json) => AddColumn(
        count: json["count"],
        description: json["description"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        type: json["type"],
        unique: json["unique"],
        values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
        validate: json["validate"] == null ? [] : List<String>.from(json["validate"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "description": description,
        "label": label,
        "name": name,
        "required": required,
        "type": type,
        "unique": unique,
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
        "validate": validate == null ? [] : List<dynamic>.from(validate!.map((x) => x)),
    };
}

class Value {
    int? id;
    String? value;

    Value({
        this.id,
        this.value,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}


