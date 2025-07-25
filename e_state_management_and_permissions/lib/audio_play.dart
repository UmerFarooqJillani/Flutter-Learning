/* 
--> Install the Packages 
    - just_audio: ^0.10.4 
    - import 'package:just_audio/just_audio.dart'; 

--> Components
    - AudioPlayer()
      The main player object                      

    - setAsset() 
      Load audio from local file (inside assets)  

    - setUrl()    
      Load audio from the internet (e.g. MP3 link)
      e.g: 
        await _player.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');

    - play()      
      Start or resume audio playback              

    - pause()
      Pause the audio                             

    - stop()      
      Stop audio completely                       

    - dispose()
      Always call this to free memory             

--> 
*/
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MaterialApp(home: AudioPlayerScreen()));
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    /*
      - Future<void> tells Flutter: "This task takes time, I’ll return nothing (void) 
        but only after I’m done."
      - async is required because await is used inside it.
      - Without Future<void>, the compiler will show an error when you use await.
    */
    try {
      await _player.setAsset('assets/music/a_song.mp3');
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose(); // Very important
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Play MP3 Audio")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => _player.play(),
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () => _player.pause(),
            ),
            IconButton(icon: Icon(Icons.stop), onPressed: () => _player.stop()),
          ],
        ),
      ),
    );
  }
}
