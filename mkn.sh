

rm -rf g google

git clone https://github.com/google/benchmark -b master g --recursive

mkdir -p google/src/posix

cp -r g/include google/include
cp -r g/src google/src
cp -r g/test google/test
cp g/* google 2>&1 | grep -v "omitting directory"

mv google/src/re_posix.cc google/src/posix/re_posix.cc

rm google/app*
rm google/CM*
rm google/ming*
rm google/.trav*
rm google/.ycm*

rm -rf g