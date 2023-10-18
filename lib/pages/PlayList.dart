import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:musicsync/widgets/CustomNavBar.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musicsync/widgets/MusicTile.dart';
import 'package:provider/provider.dart';
import 'package:musicsync/pages/PlayMusic.dart';

import '../provider/song_model_provider.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<SongModel> allSongs = [];

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    if (Platform.isAndroid) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Music Sync",
          style: TextStyle(
            color: Color.fromARGB(255, 216, 96, 32),
            fontSize: 30,
          ),
        ),
        elevation: 2,
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item) {
          if (item.data == null) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Loading")
                ],
              ),
            );
          }
          if (item.data!.isEmpty) {
            return const Center(child: Text("Nothing found!"));
          }
          return Stack(
            children: [
              ListView.builder(
                itemCount: item.data!.length,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                itemBuilder: (context, index) {
                  allSongs.addAll(item.data!);
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<SongModelProvider>()
                          .setId(item.data![index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayMusic(
                                  songModelList: allSongs,
                                  audioPlayer: _audioPlayer)));
                    },
                    child: MusicTile(
                      songModel: item.data![index],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
