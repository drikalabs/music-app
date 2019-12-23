class Genre{
  String idString;
  String labelName;

  Genre({this.idString, this.labelName});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return new Genre(idString: json['idString'],labelName: json['labelName']);
  }
}