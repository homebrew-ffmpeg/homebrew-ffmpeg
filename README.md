# homebrew-ffmpeg-with-options
This is a 3rd party tap of ffmpeg that includes options for enabling additional features in ffmpeg

## Installation and usage

To use, first tap and pin this repo:
```
brew tap varenc/ffmpeg-with-options
brew tap-pin varenc/ffmpeg-with-options
```

To compile and install ffmpeg with all options, just run:
```
brew install ffmpeg $(brew options ffmpeg --compact)
```

Or you can choose what options you want. To see the list of options:
```
brew options ffmpeg
```

Then just specify your options when you install ffmpeg
```
brew install ffmpeg --with-<CHOSEN_OPTIONS>
```


#### Note about tap pinning
Using `brew tap-pin` gives this tap's `ffmpeg` formula priority over homebrew-core to make installation simpler.  Now `ffmpeg` will refer to this tap's formula.  If you don't want to pin this tap you can still reference this tap's ffmpeg formula directly with `varenc/ffmpeg-with-options/ffmpeg`. Tap pinning will not influence an `ffmpeg` dependency in another formula.