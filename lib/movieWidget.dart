import 'package:flutter/material.dart';

import 'movie.dart';

class MovieWidget extends StatelessWidget {
  final Result? movie;

  // ignore: use_key_in_widget_constructors
  const MovieWidget(this.movie, BuildContext context);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostDetailsScreen(post: post,)));
      // },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: Colors.amber,
          shadowColor: Colors.amberAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(movie!.title.toString(),style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 10),
                Hero(
                    tag: movie!.id.toString(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("http://image.tmdb.org/t/p/w200" + movie!.posterPath.toString(),),
                          )
                      ),
                    )
                ),
                const SizedBox(height: 10),
                Center(
                  child:
                  Text(movie!.voteAverage.toString(),textAlign: TextAlign.center, style: const TextStyle(fontSize: 14),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}