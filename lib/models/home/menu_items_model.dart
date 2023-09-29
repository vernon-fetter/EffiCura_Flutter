import 'dart:convert';

MenuItems menuItemsFromJson(String str) => MenuItems.fromJson(json.decode(str));

String menuItemsToJson(MenuItems data) => json.encode(data.toJson());

class MenuItems {
  List<Result>? result;

  MenuItems({
    this.result,
  });

  factory MenuItems.fromJson(Map<String, dynamic> json) => MenuItems(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  List<dynamic>? childs;
  String? icon;
  String? label;
  String? name;
  String? url;

  Result({
    this.childs,
    this.icon,
    this.label,
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        childs: json["childs"] == null
            ? []
            : List<dynamic>.from(json["childs"]!.map((x) => x)),
        icon: json["icon"],
        label: json["label"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "childs":
            childs == null ? [] : List<dynamic>.from(childs!.map((x) => x)),
        "icon": icon,
        "label": label,
        "name": name,
        "url": url,
      };
}
