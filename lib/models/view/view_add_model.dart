import 'dart:convert';

View viewFromJson(String str) => View.fromJson(json.decode(str));

String viewToJson(View data) => json.encode(data.toJson());

class View {
  List<AddColumn>? addColumns;
  String? addTitle;
  List<EditColumn>? editColumns;
  String? editTitle;
  Map<String, List<Filter>>? filters;
  List<String>? permissions;

  View({
    this.addColumns,
    this.addTitle,
    this.editColumns,
    this.editTitle,
    this.filters,
    this.permissions,
  });

  factory View.fromJson(Map<String, dynamic> json) => View(
        addColumns: json["add_columns"] == null
            ? []
            : List<AddColumn>.from(
                json["add_columns"]!.map((x) => AddColumn.fromJson(x))),
        addTitle: json["add_title"],
        editColumns: json["edit_columns"] == null
            ? []
            : List<EditColumn>.from(
                json["edit_columns"]!.map((x) => EditColumn.fromJson(x))),
        editTitle: json["edit_title"],
        filters: Map.from(json["filters"]!).map((k, v) =>
            MapEntry<String, List<Filter>>(
                k, List<Filter>.from(v.map((x) => Filter.fromJson(x))))),
        permissions: json["permissions"] == null
            ? []
            : List<String>.from(json["permissions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "add_columns": addColumns == null
            ? []
            : List<dynamic>.from(addColumns!.map((x) => x.toJson())),
        "add_title": addTitle,
        "edit_columns": editColumns == null
            ? []
            : List<dynamic>.from(editColumns!.map((x) => x.toJson())),
        "edit_title": editTitle,
        "filters": Map.from(filters!).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x)),
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
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
        validate: json["validate"] == null
            ? []
            : List<String>.from(json["validate"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "description": description,
        "label": label,
        "name": name,
        "required": required,
        "type": type,
        "unique": unique,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
        "validate":
            validate == null ? [] : List<dynamic>.from(validate!.map((x) => x)),
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

class EditColumn {
  int? count;
  String? description;
  String? label;
  String? name;
  bool? required;
  String? type;
  bool? unique;
  List<Value>? values;
  List<String>? validate;

  EditColumn({
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

  factory EditColumn.fromJson(Map<String, dynamic> json) => EditColumn(
        count: json["count"],
        description: json["description"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        type: json["type"],
        unique: json["unique"],
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
        validate: json["validate"] == null
            ? []
            : List<String>.from(json["validate"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "description": description,
        "label": label,
        "name": name,
        "required": required,
        "type": type,
        "unique": unique,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
        "validate":
            validate == null ? [] : List<dynamic>.from(validate!.map((x) => x)),
      };
}

class Filter {
  String? name;
  String? filterOperator;

  Filter({
    this.name,
    this.filterOperator,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"],
        filterOperator: json["operator"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "operator": filterOperator,
      };
}
