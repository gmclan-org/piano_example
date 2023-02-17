# GameMaker 2023+ Piano demo

This demo shows how to change audio pitch by semitones, using Piano as an example.

It contains only one audio sample - which is note "C", and all others are played using "magical formula" - `pitchShift = power(2, semitone/12)`, where `semitone` is number of semitones from default sound (for example D is +2 semitones). Works with negative numbers too.

As it uses additional params added recently in `audio_play_sound`, may not work in some GM versions from 2022 (and earlier).



You can check live demo on: https://gnysek.itch.io/gamemaker-piano 

You can watch demo on youtube: https://www.youtube.com/watch?v=HgYJ12VPtU0

Made with <3 for https://gmclan.org