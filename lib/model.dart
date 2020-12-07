import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omdb_dart/omdb_dart.dart';


class MovieModel extends ChangeNotifier{
   double _progress;
   bool _isLoading=false;
   String _title;
   String _released;
   String _runtime;
   String _poster;
   String _director;
   String _writer;
   String _actors;
   String _plot;
   String _language;
   String _country;
   String _awards;
   String _metaScore;
   String _IMDBRatin;
   String _IMDBVotes;
   String _IMDBID;
   String _website;
   String _production;
   String _boxOffice;

   bool get isLoading => _isLoading;
   double get progress  => _progress;
   String get title     => _title;
   String get released  => _released;
   String get runtime   => _runtime;
   String get poster    => _poster;
   String get director  => _director;
   String get writer    => _writer;
   String get actors    => _actors;
   String get plot      => _plot;
   String get language  => _language;
   String get country   => _country;
   String get awards    => _awards;
   String get metaScore => _metaScore;
   String get IMDBRatin => _IMDBRatin;
   String get IMDBVotes => _IMDBVotes;
   String get IMDBID    => _IMDBID;
   String get website   => _website;
   String get production=> _production;
   String get boxOffice => _boxOffice;

   Map<dynamic,dynamic> movieList={"tile":"title"};



   void startTimer() {
     if(isLoading) {
       new Timer.periodic(
         Duration(seconds: 1),
             (Timer timer) =>
             () {
           if (_progress == 1) {
             timer.cancel();
           } else {
             _progress += 0.2;
           }
         },
       );
       notifyListeners();
     }
     else {
       notifyListeners();
     }
   }

   Future<void> getMovie(String value) async {
     _isLoading=true;
    Omdb client = new Omdb("8d0e4274", value);
    await client.getMovie();
    _title = client.movie.title;
    _released = client.movie.released;
    _runtime = client.movie.runtime;
    _poster = client.movie.poster;
    _director = client.movie.director;
    _writer = client.movie.writer;
    _actors = client.movie.actors;
    _plot = client.movie.plot;
    _language = client.movie.language;
    _country = client.movie.country;
    _awards = client.movie.awards;
    _metaScore = client.movie.metascore;
    _IMDBRatin = client.movie.imdbRating;
    _IMDBVotes = client.movie.imdbVotes;
    _IMDBID = client.movie.imdbID;
    _website = client.movie.website;
    _production = client.movie.production;
    _boxOffice = client.movie.boxOffice;

   movieList = {
     "title"    :_title,
    "released"  :_released,
    "runtime"   :_runtime,
    "director"  :_director ,
    " writer"   :_writer ,
    "actors "   :_actors ,
    "plot"      :_plot ,
    "language"  :_language ,
    "country"   :_country ,
    "awards"    :_awards ,
    "metaScore" :_metaScore ,
    "IMDBRatin" :_IMDBRatin ,
    "IMDBVotes" :_IMDBVotes ,
    "IMDBID"    :_IMDBID ,
    "website"   :_website ,
    "production":_production ,
    "boxOffice" :_boxOffice ,
  };
    print(movieList);
    _progress=1;
    startTimer();
    _isLoading=false;
   notifyListeners();
  }
}
























