import 'dart:convert';

import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getTrending();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getPlayingNow();
  Future<List<Movie>> getComingSoon();
}

class MovieRemoteDatasourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDatasourceImpl(this._client);

  @override
  Future<List<Movie>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<Movie>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<Movie>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<Movie>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}
