

@ECHO off

IF EXIST %PWD%\g (
	rd /S/Q  %CD%\g
)

IF EXIST %CD%\google (
	rd /S/Q %CD%\google
)

git clone https://github.com/google/benchmark -b main g --recursive || exit 666 /b

mkdir %CD%\google
mkdir %CD%\google\src
mkdir %CD%\google\src\posix

ROBOCOPY  %CD%\g %CD%\google /NFL /NDL /NJH /NJS /nc /ns /np
ROBOCOPY /s %CD%\g\test %CD%\google\test /NFL /NDL /NJH /NJS /nc /ns /np
ROBOCOPY /s %CD%\g\include %CD%\google\include /NFL /NDL /NJH /NJS /nc /ns /np
ROBOCOPY /s %CD%\g\src %CD%\google\src /NFL /NDL /NJH /NJS /nc /ns /np

MOVE google\src\re_posix.cc google\src\posix\re_posix.cc

DEL /Q %CD%\google\app*
DEL /Q %CD%\google\CM*
DEL /Q %CD%\google\ming*
DEL /Q %CD%\google\.trav*
DEL /Q %CD%\google\.ycm*


rd /S/Q g



