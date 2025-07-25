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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: AudioProgressExample()));
}

class AudioProgressExample extends StatefulWidget {
  const AudioProgressExample({super.key});

  @override
  State<AudioProgressExample> createState() => _AudioProgressExampleState();
}

class _AudioProgressExampleState extends State<AudioProgressExample> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
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
      await _player.setAsset('assets/music/a_song.mp3'); // Or use setUrl()
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  /*
    const string = 'D';
    print(string.padLeft(2, 'x')); // 'xD'
  */
  String formatDuration(Duration d) =>
      "${d.inMinutes}:${(d.inSeconds).toString().padLeft(2, '0')}";

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _player.play();
      } else {
        _player.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio Progress")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<Duration>(
              // explanation in last
              stream: _player.bufferedPositionStream,
              builder: (context, snapshotDuration) {
                final duration = snapshotDuration.data ?? Duration.zero;

                return StreamBuilder<Duration>(
                  stream: _player.positionStream,
                  builder: (context, snapshotPosition) {
                    final position = snapshotPosition.data ?? Duration.zero;

                    return Column(
                      children: [
                        // ✅ Time Labels
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatDuration(position)),
                            Text(formatDuration(duration)),
                          ],
                        ),

                        /// ✅ Slider (Seek Bar)
                        Slider(
                          activeColor: Colors
                              .amber, // Color of the filled portion of the bar
                          min: 0.0, // Start at 0 milliseconds
                          max: duration.inMilliseconds
                              .toDouble(), // Total length of the audio
                          value: position
                              .inMilliseconds //The current position in milliseconds (updates live)
                              .clamp(
                                0,
                                duration.inMilliseconds,
                              ) // Make sure value doesn't go out of bounds (Ensures slider value doesn’t go above total duration)
                              .toDouble(),
                          onChanged: (value) {
                            // When user drags the slider, move the audio to that position
                            _player.seek(
                              Duration(milliseconds: value.round()),
                            ); // Seek to new position
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            /// ✅ Play & Pause
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: togglePlayPause,
                ),
              ],
            ),

            // ---------------------------------------------------
          ],
        ),
      ),
    );
  }
}

/*
--> What is a Stream (Beginner-friendly Explanation)
    - A Stream is like a pipe of live data — it keeps sending updated values over time.
      - Think of a stopwatch, it ticks every second.
      - That’s what a stream of audio position does.

--> What is StreamBuilder?
    - StreamBuilder is a Flutter widget that listens to a stream of data and automatically 
      rebuilds your UI every time new data comes in.
    - Keep watching this stream, and whenever something changes, update the UI with the 
      latest value.

--> Understanding This Line
    - stream: _player.positionStream,
      - This listens to the player’s current playback time.
      - How much audio has been played	
      - Updates the filled slider

    - stream: _player.bufferedPositionStream,
      - This listens to how much of the audio has buffered (loaded) ahead, 
        useful for streaming or slow networks.
      - How much is preloaded	
      - Optional: show a gray buffer bar behind

--> Why StreamBuilder inside another StreamBuilder?
    Because:
      - bufferedPositionStream tells you the total duration
      - positionStream tells you the current time played
    You need both values to build a working progress bar:
      - Without duration, you can’t show progress
      - Without position, you can’t move the slider

--> Real-World Examples (Use Case and it's Stream)
    - Audio/video progress
      Stream: positionStream

    - Firebase chat updates
      Stream: Firestore.collection.snapshots()

    - Timer countdown
      Stream: Stream.periodic()

    - Internet connection
      Stream: Connectivity().onConnectivityChanged

--> All Important Properties
  - stream	
    - Type: Stream<T>	
    - The source of data you want to listen to

  - builder	
    - Type: (context, snapshot)	
    - A function that builds the widget based on stream updates

  - initialData	
    - Type: T?	
    - Value to show before the first stream event (optional)

--> snapshot is the data that comes from the stream. It has these key properties:
  - snapshot.data	
    The actual data from the stream

  - snapshot.hasData
    true if new data is available

  - snapshot.hasError
    true if an error occurred

  - snapshot.error
    The error message

  - snapshot.connectionState
    - Tells you the stream status (active, done, waiting, none)
    - snapshot.connectionState values:
      values:-
      - ConnectionState.none  
        Stream is null
    
      - ConnectionState.waiting
        Waiting for first data
    
      - ConnectionState.active
        Actively receiving updates
    
      - ConnectionState.done
        Stream is closed (won’t update anymore)

*/
