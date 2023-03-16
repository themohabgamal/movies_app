/// id : 28
/// name : "Action"

class SingleGenre {
  num? id;
  String? name;
  SingleGenre({
      this.id, 
      this.name,});

  SingleGenre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
SingleGenre copyWith({  num? id,
  String? name,
}) => SingleGenre(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}