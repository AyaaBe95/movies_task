import 'dart:convert';


Movie fromJson(String str) {
  final jsonData = json.decode(str);
  return Movie.fromJson(jsonData);
}

String toJson(Movie data) {
  final obj = data.toJson();
  return json.encode(obj);
}

class Movie {
  int? page;
  int? totalResults;
  int? totalPages;
  List<Result>? results;

  Movie({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory Movie.fromJson(Map<String, dynamic> json) =>  Movie(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results:  List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results":  List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  int? voteCount;
  int? id;
  bool? video;
  double? voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>  Result(
    voteCount: json["vote_count"],
    id: json["id"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    originalTitle: json["original_title"],
    genreIds:  List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: json["backdrop_path"],
    adult: json["adult"],
    overview: json["overview"],
    releaseDate: json["release_date"],
  );

  Map<String, dynamic> toJson() => {
    "vote_count": voteCount,
    "id": id,
    "video": video,
    "vote_average": voteAverage,
    "title": title,
    "popularity": popularity,
    "poster_path": posterPath,
    "original_title": originalTitle,
    "genre_ids":  List<dynamic>.from(genreIds!.map((x) => x)),
    "backdrop_path": backdropPath,
    "adult": adult,
    "overview": overview,
    "release_date": releaseDate,
  };
}