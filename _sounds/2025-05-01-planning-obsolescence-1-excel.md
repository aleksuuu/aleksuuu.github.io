---
title_stylized: "<i>Planning Obsolescence #1: Excel</i>"
medium: Microsoft Excel, Python, Max/MSP
media_links:
  - label: documentation
    url: https://www.youtube.com/watch?v=v53BP83Ujqw
tags: electronic
category: improvised
---

*Planning Obsolescence #1: Excel* is a musical live-coding system built in Microsoft Excel. Three sheets in the Excel file provide interfaces for a mixer, a drone generator, and a sequence generator. Both the drone and sequence generators derive their frequencies from four variable base frequencies. All of the frequencies are related by ratios; therefore, one could specify base frequency 2 to be 5/4 of base frequency 1, for instance, or make a sequence that iterates through [7/4, 9/8, 33/32] of base frequency 3, but there is no way to directly specify a frequency or pitch. In the sequencers sheet, the BPM (each cell represents a beat) of each sequencer can be adjusted, and the velocity, duration, attack, and release of each step can be adjusted as well. A Python script manages the transmission of data from Excel to Max/MSP, where eight sine-wave oscillators generate the sound. The Python script also tracks the current locations of the sequencers and displays them on the screen.