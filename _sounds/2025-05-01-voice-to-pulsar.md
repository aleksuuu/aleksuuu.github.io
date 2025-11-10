---
title_stylized: "voice-to-pulsar system"
medium: custom Max/MSP patch with FluCoMa, monome grid, Midi Fighter Twister, microphone
media_links:
  - label: documentation
    url: https://www.youtube.com/watch?v=TyvOHKWXlyM
tags: electronic
category: improvised
---

The system is made up of two parts: a pulsar synthesizer and an algorithm that translates my voice to a set of parameters for the synthesizer. 

## Pulsar synthesizer

Inspired by pulsar synthesis as described in Curtis Roads’s *Microsound* as well as Marcin Pietruszewski’s SuperCollider program [nuPG](https://github.com/marcinpiet/nuPG_1.0), my pulsar synthesizer is a simple system based on playback of binary buffers. Each row on the monome grid is a looped buffer, and each button represents a sample in the buffer with only two possible states: on and off. The 1s and 0s are either directly played back or used as a modulation source. An additional set of parameters, such as playback speed and effects, are available via the Midi Fighter Twister.

## Translating voice to parameters

The Max patch analyzes my voice input and dials in a set of parameters for a custom pulsar synthesizer that would produce the closest timbre to the live input. The parameters can be frozen and manually tweaked. 

## More technical details

A Python script generates 1000 random values for each parameter, and the values are fed into the pulsar synthesizer to generate 1000 sound samples. The samples are then analyzed for their spectral centroid, spectral flatness, and pitch (as well as other periphery data such as pitch confidence and derivatives of the values). The corpus is loaded into a k-d tree. In a live performance, the same analysis is performed whenever a new onset is detected. The analysis is used to look up the nearest point in a k-d tree, and the corresponding parameters are fed into the synthesizer. 
