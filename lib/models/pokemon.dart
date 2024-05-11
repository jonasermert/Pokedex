class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonDetails {
  final String name;
  final int height;
  final int weight;

  PokemonDetails(
      {required this.name, required this.height, required this.weight});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
