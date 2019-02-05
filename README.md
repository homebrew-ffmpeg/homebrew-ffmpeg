# homebrew-ffmpeg-with-options
This is a 3rd party tap of ffmpeg that includes options for enabling additional features in ffmpeg

To use, first tap this:
```brew tap varenc/ffmpeg-with-options```

To install with all the options:
```brew install varenc/ffmpeg-with-options/ffmpeg $(brew options varenc/ffmpeg-with-options/ffmpeg | grep -vE '\s' | grep -- '--with-' | tr '\n' ' ')```

Or you can choose what options you want. To see the list of options:
```brew options varenc/ffmpeg-with-options/ffmpeg```

Then just run:
```brew install varenc/ffmpeg-with-options/ffmpeg --with-<CHOSEN_OPTIONS>```