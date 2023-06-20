class ProductionModel {
  String title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String poster;
  List<Ratings>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dVD;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  ProductionModel({
    this.title = '',
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster = '',
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dVD,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  factory ProductionModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductionModel(
        title: json.containsKey("Title") ? json["Title"] ?? "" : "",
        year: json.containsKey("Year") ? json["Year"] ?? "" : "",
        imdbID: json.containsKey("imdbID") ? json["imdbID"] ?? "" : "",
        type: json.containsKey("Type") ? json["Type"] ?? "" : "",
        poster: json.containsKey("Poster") ? json["Poster"] ?? "" : "",
      );
      // year = json['Year'];
      // rated = json['Rated'];
      // released = json['Released'];
      // runtime = json['Runtime'];
      // genre = json['Genre'];
      // director = json['Director'];
      // writer = json['Writer'];
      // actors = json['Actors'];
      // plot = json['Plot'];
      // language = json['Language'];
      // country = json['Country'];
      // awards = json['Awards'];
      // poster = json['Poster'];
      // if (json['Ratings'] != null) {
      //   ratings = <Ratings>[];
      //   json['Ratings'].forEach((v) {
      //     ratings!.add(new Ratings.fromJson(v));
      //   });
      // }
      // metascore = json['Metascore'];
      // imdbRating = json['imdbRating'];
      // imdbVotes = json['imdbVotes'];
      // imdbID = json['imdbID'];
      // type = json['Type'];
      // dVD = json['DVD'];
      // boxOffice = json['BoxOffice'];
      // production = json['Production'];
      // website = json['Website'];
      // response = json['Response'];
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
