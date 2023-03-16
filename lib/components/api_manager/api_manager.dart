import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/modules/api_modules/Genres/Genre.dart';
import 'package:movies_app/modules/api_modules/MovieTrailer.dart';
import 'package:movies_app/modules/api_modules/Trailer.dart';
import 'package:movies_app/modules/api_modules/SourceResponse.dart';
import 'package:movies_app/modules/api_modules/movies_with_query/MovieWithQuery.dart';
import 'package:movies_app/modules/api_modules/selected_genre/SelectedGenre.dart';

class ApiManager {
//  https://api.themoviedb.org/3/movie/popular?api_key=63abf21cdeb51dc115b8eaaeed05b1be&language=en-US&page=1
  static const String headline = "api.themoviedb.org";
  static const String apiKey = '63abf21cdeb51dc115b8eaaeed05b1be';
  static Future<SourceResponse> getSources() async {
    var url = Uri.https(headline, '/3/movie/popular',
        {'api_key': apiKey, 'language': 'en-US', 'page': "1"});
    var response = await http.get(url);
    return SourceResponse.fromJson(jsonDecode(response.body));
  }

  static Future<MovieTrailer> getMovieTrailer(num? id) async {
    // https://api.themoviedb.org/3/movie/631842/videos
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${id.toString()}/videos?api_key=63abf21cdeb51dc115b8eaaeed05b1be&language=en-US");
    var response = await http.get(url);
    return MovieTrailer.fromJson(jsonDecode(response.body));
  }

  static Future<Genre> getGenres() async {
//  https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=63abf21cdeb51dc115b8eaaeed05b1be
    var url = Uri.https(headline, '/3/genre/movie/list',
        {'language': 'en-US', 'api_key': '63abf21cdeb51dc115b8eaaeed05b1be'});
    var response = await http.get(url);
    return Genre.fromJson(jsonDecode(response.body));
  }

  static Future<SelectedGenre> getSelectedGenreWithId(num? id) async {
//  https://api.themoviedb.org/3/discover/movie?api_key=63abf21cdeb51dc115b8eaaeed05b1be&with_genres=27
    var url = Uri.https(headline, '/3/discover/movie',
          {
          'api_key': '63abf21cdeb51dc115b8eaaeed05b1be',
            'with_genres': '${id}'
        }
        );
    var response = await http.get(url);
    return SelectedGenre.fromJson(jsonDecode(response.body));
  }static Future<MovieWithQuery> getMoviesWithQuery(String? query) async {
    // https://api.themoviedb.org/3/search/movie?api_key=63abf21cdeb51dc115b8eaaeed05b1be&query=mad
    var url = Uri.https(headline, '/3/search/movie',
          {
          'api_key': '63abf21cdeb51dc115b8eaaeed05b1be',
            'query': '${query}'
        }
        );
    var response = await http.get(url);
    return MovieWithQuery.fromJson(jsonDecode(response.body));
  }
}
