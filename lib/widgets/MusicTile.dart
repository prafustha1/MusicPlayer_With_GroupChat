import 'package:flutter/material.dart';
import 'package:musicsync/utils/SongModelExtensions.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicTile extends StatelessWidget {
  final SongModel songModel;

  const MusicTile({
    required this.songModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        songModel.displayNameWOExt,
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(songModel.additionalSongInfo,
          style: TextStyle(color: Colors.white)),
      trailing: const Icon(
        Icons.more_horiz,
        size: 40,
        color: Color.fromARGB(255, 216, 96, 32),
      ),
      leading: QueryArtworkWidget(
        id: songModel.id,
        type: ArtworkType.AUDIO,
        nullArtworkWidget: const Icon(
          Icons.music_note,
          size: 40,
          color: Color.fromARGB(255, 216, 96, 32),
        ),
      ),
    );
  }
}
