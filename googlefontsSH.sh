path=$HOME"/Schreibtisch/GoogleFonts/git"
pathgit=$HOME"/Schreibtisch/GoogleFonts/git/.git"
pathto=$HOME"/Schreibtisch/GoogleFonts/ALLGoogleFonts"

if [ ! -d $HOME"/Schreibtisch/GoogleFonts" ]; then
    git clone https://github.com/google/fonts $path
    cd $pathgit
    git remote add fonts https://github.com/google/fonts
else
    cd $pathgit
    git fetch fonts
fi

if [ ! -d $pathto ]; then
    mkdir $pathto
fi

if [ ! -d $path ]; then
    mkdir $path
fi

find $path -type f -name '*.ttf' -exec cp {} $pathto
dolphin $pathto