import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie.dart';
import 'movieWidget.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({Key? key}) : super(key: key);

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  late Future<Movie> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<Movie>(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10, start: 10, bottom: 10, end: 10),
                    itemCount: snapshot.data!.results!.length,
                    itemBuilder: (ctx, index) {
                      return MovieWidget(
                          (snapshot.data!.results)![index], context);
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<Movie> fetchMovies() async {
    const url =
        'https://api.themoviedb.org/3/discover/movie?api_key=96eee189d8f440bae690d17f36e9f700&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return fromJson(res.body);
    } else {
      throw Exception("Error!");
    }
  }
}