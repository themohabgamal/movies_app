/// adult : false
/// backdrop_path : null
/// genre_ids : [35,18]
/// id : 380683
/// original_language : "en"
/// original_title : "Mad"
/// overview : "A matriarch past the point of a nervous breakdown, her two daughters that don't give a damn, and the heat-seeking missiles of resentment they toss at each other."
/// popularity : 1.892
/// poster_path : null
/// release_date : "2016-01-22"
/// title : "Mad"
/// video : false
/// vote_average : 7.4
/// vote_count : 5

class Results {
  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  dynamic backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  dynamic posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
Results copyWith({  bool? adult,
  dynamic backdropPath,
  List<num>? genreIds,
  num? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  dynamic posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => Results(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  genreIds: genreIds ?? this.genreIds,
  id: id ?? this.id,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  releaseDate: releaseDate ?? this.releaseDate,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}