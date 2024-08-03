---
category:
  - music
date: "2021-06-13T20:54:40+00:00"
guid: http://davidcraddock.net/?p=2595
title: Making Twitch DJ Promo Mix Videos
url: /2021/06/13/making-twitch-dj-promo-mix-videos/

---
Sometimes as a DJ you may want to reconstruct the Twitch stream you have streamed into a video format to send to other people, for promotional purposes, or just to have a record of what you've done. Twitch makes this difficult though, as it mutes copyrighted music in the video it records for your Twitch stream. Also, when you download this video, it does not include the chat log, so any attempts at reconstruction are without the chat, so it looks like the DJ is just talking to him/herself. Not good. However you can get past this. This is how I reconstruct a video set to create a promo DJ video mix for my stream. You will need:

1. Twitch.tv VOD recording of your stream
2. A full audio capture unmuted. I use mixcloud.com for this as I find it very convinent. It is a paid service but it's cheap, and you can just set it as a stream endpoint on Streamlabs OBS and forget about it - it will record all the audio from your streams. Currently there is not an option to download the audio, but you can get past that, see below.
3. https://github.com/lay295/TwitchDownloader - The Twitch Downloader tool that allows you to download chat logs from the Twitch VOD and reconstruct them into a twitch chat pane video
4. A video editor and some basic video editing skills. iMovie for OSX is good, I use the free Video Editor for Windows 10

### Downloading the video from Twitch

Just browse to your video section of the creator dashboard and you will have an oppertunity to download the video of your Twitch stream.

### Downloading the audio from Mixcloud

Make sure your audio recording is published on your Mixcloud and just use the site [https://www.dlmixcloud.com](https://www.dlmixcloud.com) to download a m4a copy of your audio stream.

### Downloading and rendering the chat playback using Twitch Downloader

This is a great program but is a bit technical. There are two steps you need to do - 1) download the chat logs from a VOD and then 2) Render them into a video. So for example:

1. ```
   .\TwitchDownloaderCLI.exe -m ChatDownload -u 1055017670 -o bla.json
   ```


   \- where 1055017670 is your VOD ID (find this by browsing to your video on Twitch. the VOD ID will be displayed in the URL)
2. ```
   .\TwitchDownloaderCLI -m ChatRender -i bla.json -h 540 -w 212 --framerate 30 --update-rate 0 --font-size 11 -o chat.mp4
   ```


   \- this will render your chat playback in a video file with the dimensions 540x212px and the font-size of 11. This is what I use, you can edit this to suit your tastes.

Once you have these three elements, you can use any good video editor to sync the audio with the video, and overlay the chat video onto the video of your stream. Add some titles and there you have a promo video.

### Distributing your promo DJ mix video

You may run into problems distributing your video as services like YouTube will flag up that you are using copyrighted music. However you can use the fantastic Handbrake tool to compress your video file into a small filesize, and then upload the resulting video to Google Drive. Then you can set Google Drive to 'share via link' and distribute that link to people you want to watch your video. They will sometimes be offered a live stream option but for best results they need to download the whole video file (so make it small!) and watch in a video player like Windows Media Player.

### A Basic Example - Here's one I made earlier

Remember to download the whole file for best results: [https://drive.google.com/file/d/1qezKXSAvBK29hUCcuRNx1i3-fnodVss9/view](https://drive.google.com/file/d/1qezKXSAvBK29hUCcuRNx1i3-fnodVss9/view)
You should (maybe) also be able to preview it here:

\[googleapps domain="drive" dir="file/d/1qezKXSAvBK29hUCcuRNx1i3-fnodVss9/preview" query="" width="640" height="480" /\]
