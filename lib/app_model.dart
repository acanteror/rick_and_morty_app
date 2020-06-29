class Data {
  Info info;
  List<Result> results;

  Data({
    this.info,
    this.results,
  });
}

class Info {
  int count;
  int pages;
  int next;
  int prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });
}

class Result {
  String id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  Origin origin;

  Result({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.origin,
  });
}

class Origin {
  String id;

  Origin({
    this.id,
  });
}
