import 'Trailer.dart';

/// id : 631842
/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"Opportunity of a Lifetime","key":"aFWKrxBfZls","site":"YouTube","size":1080,"type":"Behind the Scenes","official":true,"published_at":"2023-01-27T19:00:00.000Z","id":"63d4a05020e6a5007ffc77fe"},{"iso_639_1":"en","iso_3166_1":"US","name":"A Look Inside","key":"vnR2Guu3atA","site":"YouTube","size":1080,"type":"Behind the Scenes","official":true,"published_at":"2023-01-23T16:00:33.000Z","id":"63cecbf30716500086334526"},{"iso_639_1":"en","iso_3166_1":"US","name":"Official Trailer 2","key":"gv_QhoUy-xc","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2022-12-25T18:00:03.000Z","id":"63a8fbbeb3316b00ae1593f4"},{"iso_639_1":"en","iso_3166_1":"US","name":"Official Trailer","key":"0wiBHEACNHs","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2022-09-22T07:01:09.000Z","id":"632c4a7850733c007d86fc45"}]

class MovieTrailer {
  MovieTrailer({
      this.id, 
      this.trailers,});

  MovieTrailer.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      trailers = [];
      json['results'].forEach((v) {
        trailers?.add(Trailer.fromJson(v));
      });
    }
  }
  num? id;
  List<Trailer>? trailers;
MovieTrailer copyWith({  num? id,
  List<Trailer>? trailers,
}) => MovieTrailer(  id: id ?? this.id,
  trailers: trailers ?? this.trailers,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (trailers != null) {
      map['results'] = trailers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}