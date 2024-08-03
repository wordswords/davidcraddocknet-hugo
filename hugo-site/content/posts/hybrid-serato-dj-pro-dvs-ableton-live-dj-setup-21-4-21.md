---
category:
  - ableton-live
  - denon-ds1
  - reloop-8000mk2
date: "2021-04-08T03:49:31+00:00"
guid: http://davidcraddock.net/?p=2424
tag:
  - ableton-live
  - denon-ds1
  - reloop-8000mk2
  - serato-dj-pro
  - serato-dvs
  - vestax-vcm-600
title: Hybrid Serato DJ Pro DVS/Ableton Live DJ setup (21/4/21)
url: /2021/04/08/dj-setup-8-4-21/

---
![](/wp-content/uploads/2021/04/hybridsetup.jpg)

I recently found a good price on a Vestax VCM-600 controller. It is a specially made MIDI controller for Ableton Live, with the same build quality as a DJ mixer. It allows for control over 6 channels in the Ableton Live 'session' view, which is arranged similarly to a mixing console. It also adds dozens of MIDI mappable DJ controls such as the traditional Hi, Mid and Lo EQs, a crossfader, a filter control, control over a lot of Ableton FX, and more. It has 6 channel faders + 2 send faders for FX. More info in this video:

\[youtube https://www.youtube.com/watch?v=GpZ7o\_H9u2M&w=560&h=315\]

It replaces my Pioneer DJM-S3 mixer. I use a 4x4 interface compatible with Serato DJ Pro DVS, the Denon DS1, and run the timecode audio from the Reloop 8000Mk2 decks through the Denon DS1. It outputs the Serato DJ Pro modified audio for both decks. The outputs of the DS1 are connected via a Douk VU-Meter (to see the levels for both decks for accurate gain control while mixing) to the Behringer UMC1820 audio interface which is connected to my broadcast PC running Ableton.

When I move the faders on the Vestax VCM-600 controller attached to the broadcast PC, it functions as a DJ mixer, with the actual mixing taking place in Ableton through the UMC1820 audio interface.

The microphone for streaming is connected to the sound interface as usual, and the DJ headphones are connected to the headphone amp on the the sound interface, with mic levels and cueing dealt with via Ableton Live.

The advantages of this setup over my previous setup are multifold, as I now have a 6 channel fully configurable mixer. Firstly it will allow me to bring in various external hardware instruments such as drum machines, hardware synths etc, all controlled via Ableton. I could also bring in software instruments/VSTs. It would allow me to use high quality studio software FX in my DJ sets. It would also allow me to trigger samples from Ableton Live and have them output on one of the channels, synced to the beat.

I am currently using the 4-band X:One EQ filter Ableton FX Unit clone from https://tarekith.com/freestuff/, see: https://forum.ableton.com/viewtopic.php?t=144388 .
I am also using the https://xferrecords.com/freeware DJM-900 filter clone. I have adapted these both into my Ableton VCM600 template set. I might release this set later once I've built it up more with Ableton FX.

![](/wp-content/uploads/2021/04/ableton-vcm600-set.png)

I am currently using Serato DJ Pro FX controlled by my Akai SP8 cheap controller connected to my DJ laptop, which I have changed the knobs on to make them more tactile. I also have an Ableton Push mk1 controller hooked up to broadcast PC which is useful for multiple things, but mostly for quickly controlling Ableton Live without having to mess around with the mouse. I have not synced the BPM automatically yet between Serato and Ableton; Serato has a problem with Ableton Link integration I found. For the moment, I am using the Serato DJ Pro beat-synced FX on Serato, and using tap-tempo on my Ableton Push controller to set the BPM in Ableton Live. I don't need the BPM to be exact at the moment for Ableton Live as I am not using any beat-synced FX or looping FX on Ableton.

Looping, beat repeat, cue point jumping, tempo, sync, scratching and platter changes for each deck are handled by the controls on the Reloop 8000mk2 which are both connected via USB to Serato on the DJ laptop, so they function as a DVS system but with also pads and controls for Serato too.

I am using Resolume on my broadcast PC. I run a number of scenes on autopilot mode, and use the ancient Novation SL1 Mk1 MIDI controller to apply video FX to Resolume. I sync the BPM to Resolume through Ableton Link, with Ableton Live setting the BPM for Resolume through Ableton Link, and me setting the BPM for Ableton Live using the tap-tempo on the Ableton Push controller.

I have a sustain pedal which I use to trigger the 'ducking' affect in Ableton when I want to talk over the music.. when the pedal is depressed, the music fades down and the mic up a bit, so people can hear me better. When the pedal is let go, the microphone volume is killed so no background noise is picked up.

![](/wp-content/uploads/2021/04/dj-setup-21-4-2021.png)

Here it is in action - the clicks are me flipping the crossfader or the channel faders on the VCM-600:

\[youtube https://www.youtube.com/watch?v=LJs7rw7jDtQ&w=560&h=315\]

As you can see from the video, the latency really isn't an issue. It's very responsive even though the timecode audio from the turntables is being processed by the Denon DS1, sent through the Douk VU-meter, and then converted to digital signals by the UMC1820 sound interface, sent through an EQ and FX chain, and mixed by Ableton according to the VCM600 DJ controller movements.

Here is a flowchart which should help explain the signal flow:
![](/wp-content/uploads/2021/04/dj-setup-flowchart.png)

Here is a list of equipment that I use:

- VESTAX VCM-600 Ableton Controller. Came out in 2010, cannot buy anymore new. Bought second-hand for £175. Had to clean the knobs with isopropyl alcohol as the coating becomes sticky after years and years of use.

- Novation Remote Zero SL Controller. Very old MIDI controller, cannot buy anymore. Can buy very cheaply now. Not sure if I would buy this exact controller again but it certainly is durable.

- AKAI LPD8 Controller. Very cheap MIDI controller still being sold. Bought new for £30. Took the knobs off and replaced them with Doepfer knobs from my Eurorack for better grip.

- Behringer UMC1820 Sound Interface. Very good value USB audio interface with lots of inputs and outputs. It comes with 8 physical inputs and 10 physical outputs. To get access to the other inputs and outputs you would need to buy an ADAT or SPDIF expander. Bought new for around £200.

- Douk VU-Meter. Very cheap though accurate VU-meter for checking volume levels. Bought new for £60.

- Denon DS1 Serato Interface. Not sold anymore, sadly, although it has a class-compliant driver for OSX so it is likely to remain suported for a while, while the alternative Rane Serato interfaces may not. Bought secondhand via Ebay for £120.

- Reloop 8000mk2 vinyl turntables. Excellent turntables with a huge amount of features and a solid build. They are available quite cheaply new. Paid around £400 each for them. I use Concorde Mk2 Digital needles and Serato Butterrug slipmats and Serato control vinyl.

- Ableton Push Mk1 Controller. Although the MK2 is out, the MK1 is still supported and there is no indication it will be deprecated soon. Not available new anymore, buy secondhand. I paid £250 for mine although they're available much cheaper now.

- RODE Procaster Microphone, cage, pop sheild and boom mount - This is an excellent high quality microphone. You can get a lot cheaper if you wanted to. Mic setup cost about £200 new.

- Apple Macbook Pro 2015 13" Retina edition. Still going strong from when I bought it. Only has 8GB memory and that is shared with the graphics card, but otherwise it is fine. I have kept it on Mojave, no plans to update. I only use it with Serato DJ Pro. I have an external HD attached to it for all my DJ music.

- Broadcast PC - a workstation PC I built myself. For the specs see: [/my-computer-setup/](/my-computer-setup/). In particular I have found the Nvidea 1080 graphics card very useful for Resolume - no way would it run well on my laptop.


For new equipment I use [Thomann.de](http://www.thomann.de) often or [DV247.com](http://www.dv247.com), or Amazon, or whatever is cheaper on Google Shopping.
For used equipment I use [Reverb.com](http://www.reverb.com) or [Ebay.co.uk](http://www.ebay.co.uk) or occasionally Facebook adverts.
