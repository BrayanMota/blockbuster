class ProductionModel {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  List<Ratings>? ratings;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String dvd;
  String boxOffice;
  String production;
  String website;
  String response;

  ProductionModel({
    this.title = '',
    this.year = '',
    this.rated = '',
    this.released = '',
    this.runtime = '',
    this.genre = '',
    this.director = '',
    this.writer = '',
    this.actors = '',
    this.plot = '',
    this.language = '',
    this.country = '',
    this.awards = '',
    this.poster = '',
    this.ratings,
    this.metascore = '',
    this.imdbRating = '',
    this.imdbVotes = '',
    this.imdbID = '',
    this.type = '',
    this.dvd = '',
    this.boxOffice = '',
    this.production = '',
    this.website = '',
    this.response = '',
  });

  factory ProductionModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductionModel(
        title: json.containsKey("Title") ? json["Title"] ?? "" : "",
        year: json.containsKey("Year") ? json["Year"] ?? "" : "",
        imdbID: json.containsKey("imdbID") ? json["imdbID"] ?? "" : "",
        type: json.containsKey("Type") ? json["Type"] ?? "" : "",
        poster: json.containsKey("Poster") ? json["Poster"] ?? "" : "",
        rated: json.containsKey("Rated") ? json["Rated"] ?? "" : "",
        released: json.containsKey("Released") ? json["Released"] ?? "" : "",
        runtime: json.containsKey("Runtime") ? json["Runtime"] ?? "" : "",
        genre: json.containsKey("Genre") ? json["Genre"] ?? "" : "",
        director: json.containsKey("Director") ? json["Director"] ?? "" : "",
        writer: json.containsKey("Writer") ? json["Writer"] ?? "" : "",
        actors: json.containsKey("Actors") ? json["Actors"] ?? "" : "",
        plot: json.containsKey("Plot") ? json["Plot"] ?? "" : "",
        language: json.containsKey("Language") ? json["Language"] ?? "" : "",
        country: json.containsKey("Country") ? json["Country"] ?? "" : "",
        awards: json.containsKey("Awards") ? json["Awards"] ?? "" : "",
        ratings: json.containsKey("Ratings")
            ? (json["Ratings"] as List).map((e) => Ratings.fromJson(e)).toList()
            : [],
        metascore: json.containsKey("Metascore") ? json["Metascore"] ?? "" : "",
        imdbRating:
            json.containsKey("imdbRating") ? json["imdbRating"] ?? "" : "",
        imdbVotes: json.containsKey("imdbVotes") ? json["imdbVotes"] ?? "" : "",
        dvd: json.containsKey("DVD") ? json["DVD"] ?? "" : "",
        boxOffice: json.containsKey("BoxOffice") ? json["BoxOffice"] ?? "" : "",
        production:
            json.containsKey("Production") ? json["Production"] ?? "" : "",
        website: json.containsKey("Website") ? json["Website"] ?? "" : "",
        response: json.containsKey("Response") ? json["Response"] ?? "" : "",
      );
    } catch (error) {
      return ProductionModel();
    }
  }
}

class Ratings {
  String? source;
  String? value;

  Ratings({this.source, this.value});

  Ratings.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Source'] = this.source;
    data['Value'] = this.value;
    return data;
  }
}
