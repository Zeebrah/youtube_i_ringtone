#!/usr/local/bin/bash
# check the dependencies
for name in  bash youtube-dl ffmpeg
do
  [[ $(command -v $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed. Install it manually or with package manager";deps=1; }
done

# help function
function usage { 
    printf "\n"
    echo "-h    Shows this help message"
    echo "-v    Link to Yourube video to make the ringtone from. Uses youtube-dl"
    echo "-p    Path (with a name) to the output (.m4r) file. Default is ~/Downloads/ringtone.m4r"
    echo "-o    Offset (in seconds) the starting point of the ringtone. Default is 0 sec"
    echo "-l    Lenght of the final ringtone. Starting from the offset. Default and max is 30 sec"
}

# if no input argument found, exit the script with usage
if [[ ${#} -eq 0 ]]; then
    printf "\n"
    echo "./$(basename $0) -h --> shows usage"
    usage
fi

# Initiate defaults
filepath_format="~/Downloads/ringtone.%(ext)s"
filepath_interim="~/Downloads/ringtone.m4a"
filepath_out="~/Downloads/ringtone.m4r"
run=0 # main run loop 
offset=0
length=30

# list of arguments expected in the input
optstring=":hv:fol"

while getopts ${optstring} arg; do
  case ${arg} in
    h) # help menu
      usage
      ;;
    v) # a link to a youtube video
      video_link="${OPTARG}"
      run=1
      ;;
    p) # full path to output file
      filepath_out="${FILEPATH_OUT}"
      ;;
    o) # offset for ringtone
      offset="${OPTARG}"
      ;;
    l) # length or the ringtone, def is 30s
       # note, that it should be not higher than 30
      length="${OPTARG}"
      ;;
    :) # missing option argument
      echo "$0: Must supply an argument to -$OPTARG." >&2
      exit 1
      ;;
    ?) # invalid option
      echo "Invalid option: -${OPTARGS}."
      exit 2
  esac
done

# download link with specified nameø
if [ $run -eq 1 ]; then
    youtube-dl -i --extract-audio --audio-format m4a -o $filepath_interim  --audio-quality 0 $video_link
    ffmpeg -i ~/Downloads/ringtone.m4a -acodec copy -f ipod -ss $offset  -t $length ~/Downloads/ringtone.m4r
fi
