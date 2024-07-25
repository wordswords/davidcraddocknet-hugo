---
category:
  - uncategorized
date: "2015-09-02T08:13:17+00:00"
guid: http://www.davidcraddock.net/?p=1493
title: Completed Eurorack
url: /2015/09/02/completed-eurorack/

---
I've finished my 6U Eurorack case. It took me 9 months to build, buying a couple of modules a month.

### Goals

I wanted to make a self-contained dual voice synthesizer that would interface with my 2x Doepfer Dark Energy MK1s and my Microbrute, on a budget. I also wanted to add some random sound generation features.

I chose to make the synthesizer out of Doepfer modules because they are easy to find cheap second-hand, and also because they are well-engineered. (If they're good enough for Kraftwerk, who am I to complain?)

[![eurorack](/wp-content/uploads/2015/09/eurorack.png)](/wp-content/uploads/2015/09/eurorack.png)

#### Oscillators and Sound Generation

1. 2x standard Doepfer _A-110-1 VCOs_ with pulse-width modulation. I am no expert, but find these oscillators sound good enough for the money.
2. _A-118 Random Noise_ module, which outputs white and coloured noise. This has been useful for adding noise to a patch, as well as feeding the random noise generator through the quantizer and S&H modules for interesting random effects.

#### LFOs and Envelopes

1. _A-143-3 Quad LFO_, which has been very useful in modulating my external gear, such as my Microbrute and Doepfer Dark Energy synths. I find it's a good utility module to just patch something up for modulation, even though I rarely find myself using all 4 LFOs at once.
2. _A-145 LFO_ \- I actually find myself wishing this was a VCLFO so that I could make midi-synced LFO sweeps, and might replace it with one eventually. I like the reset feature though.
3. 2x _A-140 ADSR_ \- Standard envelopes, I bought two so I can modulate the VCA and filter separately at the same time, as is standard in synthesizers.

#### Mixers and VCAs

1. _A-132-3 Dual VCA_ \- Another standard module, this is particularly useful as it has two VCAs, so I can feed each oscillator into its own separate VCA. I would like another one of these so I could amplify the output of the noise module separately from the VCOs.
2. 2x _A-138 Exponential Mixers_ \- I have two so I can mix multiple waveforms from the VCOs with the white noise output from my noise generator module. The mixer in the bottom right corner of the case has rubber no-slip knobs, and I use it for the main output from my synth.

#### Quantizer and S&H

1. _A-156 Dual Quantizer_ \- This is a really fun module which I use with LFOs, envelopes and my noise generator to make musical sounds from non-musical sources. I think it will come into its own when I get the Make Noise Maths module, which is on my 'next steps' list.
2. _A-148 Dual Sample & Hold_ \- This is a module I haven't quite grasped the utility of yet, I currently use it wired up to filters and a LFO for S&H filter effects.

#### Filters

I love filters.. so I got quite a few!

1. _A-120 VCF1 Low Pass Filter_ (Moog style) - The standard moogy filter, nothing wrong with it. I like the sound but mostly use it for filter sweeps.
2. _A-127 Triple Voltage Controlled Resonance Filter with Breakout Box_ \- This is the key element of my setup. It allows for some really nice multiple filter chaining effects. I have the top filter set to 'Low Pass' mode, and the second and third filters set to 'Band pass' mode. Since I already have a LP filter in the Moog style A-120 I may change this back so it becomes a triple BP filter, which is the default. You can make some really nice patches with the inbuilt LFOs modulating the filter sweeps, but usually I will wire it up to my Quad LFO for modulation. As a unit, it is really good at making vowel-like sounds for eerie 'almost human voice' effects. The breakout box, which I haven't soldered in yet, so haven't actually used, will expand the possibilities of the unit even more, allowing me to put separate filers on each oscillator, for example. Love this module.
3. _A-106-1 Xtreme Filter_ \- I haven't used this much yet, but I just had to have the MS-20 style LP/HP filter in my case, and this filter ticks all the boxes.

#### MIDI Interface and Multiples

1. _Kenton Pro Solo MIDI-to-CV interface_ \- I use this with my computer, allowing me to send CV for the oscillators through the Intelligel Buff Mult. It has clock out and a bunch of different features, such as portamento and even a LFO.
2. _Intelligel 'Buff Mult'_ \- My only non-Doepfer module. This is a buffered multiplier, meant to make sure that fast pitch changes are duplicated correctly over the oscillators. I also wire up my Doepfer Dark Energy Mk1s to this, so I can have 4 oscillators playing at once.
3. _A180-1 Multipler_ \- Just a standard multiplier which I use because I don't use stackable cables (can't afford them).
