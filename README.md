# youtube_i_ringtone
A small CLI interface to download and convert a youtube videos into a standard iOS ringtone. The task it to compress rather tedious process of finding, downloading and converting a file into a single command you can run from your terminal

# Installation
The script itself is portable in relation to directory, so just clone thу repo or download the script individually and run with:

However, there are dependencies: `bash`,`youtube-dl`, `ffmpeg`. Apple still ships macOS with `bash 3.2`, the seems to work fine anyways, but shebang points to newer version installed via `brew`. The recommended approach is to [update](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba) `bash` to much newer version.

## Dependencies
Since currently this script only targets macOS, you are recommended to install them using [Homebrew](https://brew.sh). If you don't use `brew` yet, you probably should start doing that. If you prefer manual instalation, this is also fine, just ensure that all dependencies are in `$PATH`.

Script to install dependencies using `brew`:
```bash
brew install bash youtube-dl ffmpeg
```


# Usage
`cd` into the directory, you have chosen for the script, then run it with either:

```bash
bash youtube_i_ringtone -v [link_to_video]
```

or:

```bash
./youtube_i_ringotne -v [link_to_video]
```

## Getting help
To get help page you can run script with no arguments or use `-h` flag. 


## Arguments and Flags
The only strictly necessary argument is a youtube video link. However, script comes with a minimal number of flags that allow you to change the length of the ringtone, select a specific part of a video, set a path (and name) to the output file. From the help menu:

```bash
-h    Shows help message
-v    Link to Youtube video to make the ringtone from. Uses youtube-dl
-p    Path (with a name) to the output (.m4r) file. Default is $HOME/Downloads/ringtone.m4r
-o    Offset (in seconds) the starting point of the ringtone. Default is 0 sec
-l    Lenght of the final ringtone. Starting from the offset. Default and max is 30 sec
```

# License

License file is available in the repo. It is GPLv3. 

# Contribution

Feel free to add or modify my code. This is essentially my first published shell coding project, so it a little rough around the edges. If you feel confident in your ability to improve it, I would be very much willing to collaborate.

Thanks to @vudaltsov for helping me with a repo setup and tips.
