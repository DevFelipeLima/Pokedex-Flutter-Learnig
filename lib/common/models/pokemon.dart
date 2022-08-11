class Pokemon {
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['img'],
      id: json['id'],
      //pega o testo do json dentro do type e transforma e retorna uma lista de strings.
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      num: json['num'],
    );
  }
  Pokemon({
    required this.name,
    required this.image,
    required this.id,
    required this.num,
    required this.type,
  });
}
