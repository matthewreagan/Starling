# Starling

**Starling** is a simple audio library for **iOS + macOS** written in **Swift**. It provides _low-latency_ sound resource playback for games, real-time media solutions, or other performance-critical applications. It is built around Apple's [AVAudioEngine](https://developer.apple.com/documentation/avfoundation/avaudioengine) and simplifies the API in an effort to reduce the amount of boilerplate needed for basic audio playback.

## Goal

**Starling** is built for simple & fast audio file playback. It is designed to be as easy to use as possible, and to provide a minimal API which abstracts the under-the-hood interaction with [AVFoundation](https://developer.apple.com/av-foundation/).

## Background

Starling was developed while working on [Tank Wars](http://sound-of-silence.com/tanks), after it became apparent that other common solutions (such as leveraging SKAction or AVAudioPlayer) would be insufficient (even when utilizing somewhat 'hacky' solutions such as [pre-playing the sound at 0 volume](https://stackoverflow.com/questions/900461/slow-start-for-avaudioplayer-the-first-time-a-sound-is-played)).

## Features

- Simple & easy-to-use
- Per-effect control over asynchronous playback / overlapping
- Nodes are increased dynamically as needed to accommodate any number of concurrent audio effects
- Thread safe and performant, never blocks the main thread for loading or playback

## Basic Playback

1. Add an audio file to your app (ex: `myAlarmSound.wav`)

2. _(Optional)_ Define your sounds by extending `SoundIdentifier`:

```
extension SoundIdentifier {
    static let alarm = SoundIdentifier("alarm")
}
```

Alternatively you can use a string for your sound names, but using static members in this fashion will allow Xcode to provide nice autocompletion within the IDE, and easier refactoring or renaming of sounds in the future.

3. Create an instance of Starling:

`let starling = Starling()`

4. During app launch or game startup, load the sound:

`starling.load(resource: "myAlarmSound", type: "wav", for: .alarm)`

This only needs to be done once per audio file.

5. Play the sound!

`starling.play(.alarm)`

Again, note that we're using the members of the extended `SoundIdentifier` type. You could also call `starling.play("alarm")` but avoiding literal strings will make renaming your sounds much easier.

## Other Playback Options

In some cases you may wish to prevent a specific sound effect from overlapping itself (playing the same sound asynchronously ontop of itself before the first  play() call has finished). This can be avoided by including the allowOverlap argument.

`starling.play(.alarm, allowOverlap: false)`

### More Info

**Starling** is a very basic API and is still a work-in-progress. Pull requests and feature requests welcome.

## Author

**Matt Reagan** - Website: [http://sound-of-silence.com/](http://sound-of-silence.com/) - Twitter: [@hmblebee](https://twitter.com/hmblebee)

## License

Source code and related resources are Copyright (C) Matthew Reagan 2018. The source code is released under the [MIT License](https://opensource.org/licenses/MIT).
