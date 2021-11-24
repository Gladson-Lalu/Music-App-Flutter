import 'package:flutter/material.dart';

const List topCategory = [
  "Pop",
  "Hip Hop",
  "Rock",
  "Soul",
];
const List allCategory = [
  "Podcasts",
  "Made For You",
  "Charts",
  "New Releases",
  "Discover",
  "Concerts",
  "Pop",
  "Hip Hop",
  "Rock",
  "Soul",
  "Classic",
  "R&B",
];

final List<Color> colors = [
  Color(0xfff69921),
  Color(0xff99BACB),
  Color(0xff498D7C),
  Color(0xff4E97F2),
  Color(0xffe75f5f),
  Color(0xffb196c4),
  Color(0xfff6427c),
  Color(0xfff95f35),
  Color(0xffE55C1B),
  Color(0xff05BE86),
  Color(0xff9C47D5),
  Color(0xff867647)
];

const Map songsJson1 = {
  "title": "Discover",
  "songs": [
    {
      "img": "assets/images/img_2.jpg",
      "title": "Chill Lofi Study Beats",
      "description": "The perfect study beats, twenty four seven.",
      "color": Color(0xFF93689a),
      "songs": [
        {"title": "Imagination", "song_url": "songs/1.mp3"},
        {"title": "Home_", "song_url": "songs/1.mp3"},
        {"title": "Do I Wanna Know?", "song_url": "songs/1.mp3"},
        {"title": "Whiskey Sour", "song_url": "songs/1.mp3"},
        {"title": "Decisions", "song_url": "songs/1.mp3"},
        {"title": "Trees", "song_url": "songs/1.mp3"},
        {
          "title": "Earth",
          "song_url": "songs/1.mp3",
        },
      ]
    },
    {
      "img": "assets/images/img_4.jpg",
      "title": "Lo-Fi Beats",
      "description": "Beats to relax, study and focus.",
      "color": Color(0xFFbad6ec),
      "song_url": "songs/2.mp3",
      "songs": [
        {"title": "Imagination", "song_url": "songs/1.mp3"},
        {"title": "Home_", "song_url": "songs/1.mp3"},
        {"title": "Do I Wanna Know?", "song_url": "songs/1.mp3"},
        {"title": "Whiskey Sour", "song_url": "songs/1.mp3"},
        {"title": "Decisions", "song_url": "songs/1.mp3"},
        {"title": "Trees", "song_url": "songs/1.mp3"},
        {
          "title": "Earth",
          "song_url": "songs/1.mp3",
        },
      ]
    },
    {
      "img": "assets/images/img_5.jpg",
      "title": "Peaceful Piano",
      "description": "Relax and indulge with beautiful piano pieces",
      "color": Color(0xFF64849c),
      "songs": [
        {"title": "Kaleidoscope", "duration": "2:01"},
        {"title": "Larks", "duration": "2:54"},
        {"title": "Homeland", "duration": "2:22"},
        {"title": "Une Danse", "duration": "3:03"},
        {"title": "Almonte", "duration": "2:31"},
        {"title": "Days Like These", "duration": "4:09"},
        {"title": "In questo momento", "duration": "2:40"},
      ]
    },
    {
      "img": "assets/images/img_7.jpg",
      "title": "Deep Focus",
      "description": "Keep calm and focus with ambient and post-rock music.",
      "color": Color(0xFF58546c),
      "song_url": "songs/1.mp3",
      "songs": [
        {"title": "Escaping Time", "duration": "3:20"},
        {"title": "Just Look at You", "duration": "3:07"},
        {"title": "Flowing", "duration": "2:11"},
        {"title": "With Resolve", "duration": "2:09"},
        {"title": "Infinite Sustain", "duration": "2:29"},
        {"title": "Ingénue", "duration": "2:38"},
        {"title": "Hidden Chambers", "duration": "2:49"},
      ]
    },
    {
      "img": "assets/images/img_3.jpg",
      "title": "Feelin' Good",
      "description": "Feel good with this positively timeless playlist!",
      "color": Color(0xFFf69129),
      "song_url": "songs/1.mp3",
      "songs": [
        {"title": "Imagination", "duration": "1:21"},
        {"title": "Home_", "duration": "2:17"},
        {"title": "Do I Wanna Know?", "duration": "1:31"},
        {"title": "Whiskey Sour", "duration": "1:42"},
        {"title": "Decisions", "duration": "1:29"},
        {"title": "Trees", "duration": "1:51"},
        {"title": "Earth", "duration": "1:39"},
      ]
    },
  ]
};

const Map songsJson2 = {
  "title": "Made for you",
  "songs": [
    {
      "img": "assets/images/img_6.jpg",
      "title": "Chill Hits",
      "description": "Kick back to the best new and recent chill tunes.",
      "color": Color(0xFFa4c4d3),
      "song_url": "songs/2.mp3",
      "songs": [
        {"title": "Imagination", "duration": "1:21"},
        {"title": "Home_", "duration": "2:17"},
        {"title": "Do I Wanna Know?", "duration": "1:31"},
        {"title": "Whiskey Sour", "duration": "1:42"},
        {"title": "Decisions", "duration": "1:29"},
        {"title": "Trees", "duration": "1:51"},
        {"title": "Earth", "duration": "1:39"},
      ]
    },
    {
      "img": "assets/images/img_1.jpg",
      "title": "Dark & Stormy",
      "description": "Beautifully dark, dramatic tracks.",
      "color": Color(0xFF5e4f78),
      "song_url": "songs/1.mp3",
      "songs": [
        {"title": "Kaleidoscope", "duration": "2:01"},
        {"title": "Larks", "duration": "2:54"},
        {"title": "Homeland", "duration": "2:22"},
        {"title": "Une Danse", "duration": "3:03"},
        {"title": "Almonte", "duration": "2:31"},
        {"title": "Days Like These", "duration": "4:09"},
        {"title": "In questo momento", "duration": "2:40"},
      ]
    },
    {
      "img": "assets/images/img_8.jpg",
      "title": "Feel Good Piano",
      "description": "Positive piano music",
      "color": Color(0xFFa4c1ad),
      "song_url": "songs/2.mp3",
      "songs": [
        {"title": "Escaping Time", "duration": "3:20"},
        {"title": "Just Look at You", "duration": "3:07"},
        {"title": "Flowing", "duration": "2:11"},
        {"title": "With Resolve", "duration": "2:09"},
        {"title": "Infinite Sustain", "duration": "2:29"},
        {"title": "Ingénue", "duration": "2:38"},
        {"title": "Hidden Chambers", "duration": "2:49"},
      ]
    },
    {
      "img": "assets/images/img_9.jpg",
      "title": "Sad Songs",
      "description": "Beautiful songs to break your heart...",
      "color": Color(0xFFd9e3ec),
      "song_url": "songs/1.mp3",
      "songs": [
        {"title": "Imagination", "duration": "1:21"},
        {"title": "Home_", "duration": "2:17"},
        {"title": "Do I Wanna Know?", "duration": "1:31"},
        {"title": "Whiskey Sour", "duration": "1:42"},
        {"title": "Decisions", "duration": "1:29"},
        {"title": "Trees", "duration": "1:51"},
        {"title": "Earth", "duration": "1:39"},
      ]
    },
    {
      "img": "assets/images/img_10.jpg",
      "title": "Mood Booster",
      "description": "Get happy with today's dose of feel-good songs",
      "color": Color(0xFF4e6171),
      "song_url": "songs/2.mp3",
      "songs": [
        {"title": "Imagination", "duration": "1:21"},
        {"title": "Home_", "duration": "2:17"},
        {"title": "Do I Wanna Know?", "duration": "1:31"},
        {"title": "Whiskey Sour", "duration": "1:42"},
        {"title": "Decisions", "duration": "1:29"},
        {"title": "Trees", "duration": "1:51"},
        {"title": "Earth", "duration": "1:39"},
      ]
    }
  ]
};

const Map artistJson = {
  "title": "Your favorite artist",
  "songs": [
    {"img": "assets/images/justinbieber.jpg", "title": "Justin Bieber"},
    {"img": "assets/images/ArianaGrande.jpg", "title": "Ariana Grande"},
    {"img": "assets/images/BileshEilish.jpg", "title": "Bilesh Eilish"},
    {"img": "assets/images/DuaLipa.jpg", "title": "Dua Lipa"},
    {"img": "assets/images/Halsey.jpg", "title": "Halsey"},
    {"img": "assets/images/NiallHoran.jpg", "title": "Niall Horan"},
    {"img": "assets/images/Shawnmendes.jpg", "title": "Shawn Mendes"}
  ]
};

const Map chartsJson = {
  "title": "Charts",
  "songs": [
    {
      "img": "assets/images/viral_50.jpg",
      "description": "Your daily update of the most viral tracks"
    },
    {
      "img": "assets/images/pic1.jfif",
      "description": "Catch the hottest Punjabi tracks"
    },
    {
      "img": "assets/images/pic2.jfif",
      "description": "Stay updated with all smashing new punjabi songs"
    },
    {
      "img": "assets/images/pic9.jfif",
      "description": "Tune in to the Top Tracks of Arijit Singh"
    },
    {
      "img": "assets/images/pic5.jpg",
      "description": "Enjoy the latest tracks of Latin favorites"
    },
    {
      "img": "assets/images/pic6.jpg",
      "description": "The hottest tracks in Latin. From Rock The Moon"
    }
  ]
};

const Map podcastsJson = {
  "title": "Podcasts for you",
  "songs": [
    {
      "img": "assets/images/pic8.jpg",
      "description": "Podcasts . Best of 2016 Latino Radar"
    },
    {"img": "assets/images/pic14.jfif", "description": "Podcasts . TED"},
    {"img": "assets/images/pic15.jfif", "description": "Podcasts . Jay Shetty"},
    {
      "img": "assets/images/pic16.jpg",
      "description": "Podcasts . The Write Life"
    },
    {"img": "assets/images/pic17.jfif", "description": "Podcasts . PKSpeaks"},
    {"img": "assets/images/pic18.jpg", "description": "Podcasts . Judda"},
  ]
};

const Map indianPlaylistJson = {
  "title": "Top Playlists India",
  "songs": [
    {
      "img": "assets/images/pic11.jpg",
      "description": "Hottest Hindi music served here."
    },
    {
      "img": "assets/images/pic12.jfif",
      "description": "These radiant Bollywood will keep you comming back."
    },
    {
      "img": "assets/images/pic4.jpg",
      "description": "Gentle Indie songs for a relaxed dinner."
    },
    {
      "img": "assets/images/pic10.jpg",
      "description": "Greatest Hits of Arijit Singh."
    },
    {
      "img": "assets/images/pic13.jpg",
      "description": "Most Favorites Hindi songs 2021"
    }
  ]
};
