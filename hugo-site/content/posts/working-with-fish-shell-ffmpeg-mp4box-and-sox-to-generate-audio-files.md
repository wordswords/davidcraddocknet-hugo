---
category:
  - assets
  - audio-testing
  - commandline
  - dash
  - ffmpeg
  - generator
  - sox
  - tips
date: "2016-03-08T17:22:37+00:00"
guid: http://www.davidcraddock.net/?p=1711
tag:
  - assets
  - audio-testing
  - commandline
  - dash
  - ffmpeg
  - generator
  - sox
title: Working with Fish Shell, ffmpeg, MP4Box and sox to generate audio files
url: /2016/03/08/working-with-fish-shell-ffmpeg-mp4box-and-sox-to-generate-audio-files/

---
More adventures with Fish shell. I have scripted the generation of a bunch of test asset audio files in mp4 format suitable for dash streaming. I have used the audio file commandline tools ffmepg MP4Box and sox in this script, they are pretty powerful and worth installing via homebrew on OSX.

Thoughts: I think that instead of quoting you can just output $variable, which is probably better coding style. I'm still working out good way to return variables from functions, it seems that you need to echo out the output and that gets picked up by the calling function, which is a bit messy.
\[code lang="bash"\]
#!/usr/bin/env fish
\# move to the asset output directory..
cd ..

\# Generate .m4a file for file, and all the associated .mp4 dash assets
function generateDash
 set bitrate $argv\[1\]
 set input\_filename $argv\[2\]
 set output\_filename "$input\_filename"-"$bitrate".m4a
 ffmpeg -i "$input\_filename" -ab "$bitrate"k "$output\_filename"
 MP4Box -dash 10000 "$output\_filename"
end

\# Generate 3 second sine wave in a specified bitrate at a specified frequency
function generateWav
 set bitrate $argv\[1\]
 set filename $argv\[2\]
 set frequency $argv\[3\]
 set wavfilename "$filename"-"$bitrate".wav
 sox -n --norm=-3 -b "$bitrate" "$wavfilename" synth 3 sine "$frequency"
 echo $wavfilename
end

\# Main loop, generate 128,192 and 320 bitrate dashed .mp4s for 16bit and 32bit 3 second sine waves
for i in (seq 24)
 set freq (math "$i \* 64.5")
 set wavfilename (generateWav 16 "output$i" "$freq")
 generateDash 128 "$wavfilename"
 generateDash 192 "$wavfilename"
 generateDash 320 "$wavfilename"
 set wavfilename (generateWav 24 "output$i" "$freq")
 generateDash 128 "$wavfilename"
 generateDash 192 "$wavfilename"
 generateDash 320 "$wavfilename"
end
\[/code\]
