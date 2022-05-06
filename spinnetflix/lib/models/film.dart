class Film {
  //props

  String? _identifiant, _titre, _description, _type;

  //getters /setters

//   un identifiant
// un titre
// une description
// une affiche
// un type de programme; m pour un film et s pour une série

  // ignore: unnecessary_getters_setters
  String? get identifiant => _identifiant;
  // ignore: unnecessary_getters_setters
  String? get titre => _titre;
  // ignore: unnecessary_getters_setters
  String? get description => _description;
  // ignore: unnecessary_getters_setters
  String? get type => _type;

  set identifiant(String? value) => _identifiant = value;
  set titre(String? value) => _titre = value;
  set description(String? value) => _description = value;

  set type(String? value) => _type = value;

//Constructor
  Film();

  factory Film.fromJSON(json) {
    Film film = Film();

    film._identifiant = json['id'];
    film._titre = json['title'];
    film._description = json['overview'];
    film._type = json['content_type'];

    return film;
  }
}
