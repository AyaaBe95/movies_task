import 'package:flutter/material.dart';

import 'movie.dart';

class movieDetails extends StatelessWidget {
  final Result? movie;
  const movieDetails({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Card(
        color: Colors.amber,
        shadowColor: Colors.amberAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 10.0,
        child: Column(
          children: [
            Flexible(child: Text(movie!.title.toString(),textAlign: TextAlign.center, style: const TextStyle(fontSize: 20),)),
            const SizedBox(height: 10),
            Hero(
              tag: movie!.id.toString(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("http://image.tmdb.org/t/p/w185" + movie!.posterPath.toString()),
                    )
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(child: Text(movie!.overview.toString(),textAlign: TextAlign.center)),
            const SizedBox(height: 10),
            Center(child: Text("Release Date: ${movie!.releaseDate.toString()}",textAlign: TextAlign.center)),


          ],
        ),
      ),

    );
  }
  }

