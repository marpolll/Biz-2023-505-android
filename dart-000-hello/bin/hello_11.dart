void main(List<String> args) {
  var names = ["hong", "lee", "sung"];

  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (var name in names) {
    print(name);
  }

  names.forEach((name) {
    print(name);
  });

  var result = names.map((name) {
    return "name : $name";
  });
  print(result);

  result = names.map((name) => "name : $name");
  print(result);
}
