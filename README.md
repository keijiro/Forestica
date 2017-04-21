Forestica
=========

![screenshot](http://i.imgur.com/xo4mYAg.png)

**[Forestica]** is a Tilt Brush scene drawn by [George Peaslee]. This
repository contains a setup for rendering the scene with [Unity].

The original scene files of [Forestica] are shared under the
[Creative Commons Attribution 4.0 International License][CC].

This setup was made for testing the effects of the [Post-processing Stack].
The scene looks like the following image when without post-processing.

![without post fx](http://i.imgur.com/6ypOEoL.png)

[Forestica]: https://sketchfab.com/models/05c0b469befa48aea2a0435a657c95de
[George Peaslee]: https://sketchfab.com/georgepeaslee
[Unity]: https://unity3d.com
[CC]: https://creativecommons.org/licenses/by/4.0/
[Post-processing Stack]: https://github.com/Unity-Technologies/PostProcessing

How to Set Up
-------------

This repository doesn't contain the original scene files. They have to be
downloaded separately. After downloading the files, copy them into the project
with the following steps.

- Copy the fbx file into `Assets/Forestica/source`.
- Copy the png files into `Assets/Forestica/textures`.

It's recommended to copy these files before opening the project for the first
time because Unity will remove .meta files when asset files are missing.
