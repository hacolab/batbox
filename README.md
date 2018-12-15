# batbox
========
This is useful Windows *.bat scripts and libraries package.  
It is useful operate functions for string, array, path, debug, test etc...  
If your write *.bat scripts, this package's libraries may be make your happy.  
If your not write *.bat scripts, this package's scripts may be make your happy.  
Let's play in a strange new bat scripts world.

## Description
Why are bat scripts now?  
Unfortunately, I work and should sometimes write bat scripts.  
I think that it is better not to use it if possible.  

But bat script has merit as well.  

1. It runs on defult Windows, which has the most users in the world!
2. It is very easy to combine commands!
3. I do not have it anymore.

We want to focus on combining commands. This package help it.  

Our Goal is to say that "That is in this box".

## Demo

## Requirement
### batbox/lib/*.bat
- standard dos commands

### cmd/*

## Directory Layout
```
+-- batbox
    +-- *.bat ... there are script provided by batbox.
    |
    +-- lib ... there are script provided by batbox or you.
    |   +-- *.bat ... generic script used from cmd/*.bat scripts. 
    |
    +-- src ... useful *.bat scripts, provided by botbox or you.
    |   | 
    |   +-- CmdName1
    |   |   +-- Main.bat  ... command main script. need file name is 'Main.bat'
    |   |   +-- Sub1.bat  ... sub script only use CmdName1.
    |   |   +-- Sub2.bat  ... sub script only use CmdName1.
    |   |
    |   +-- CmdName2
    |       +-- Main.bat  ... command main script. need file name is 'Main.bat'
    |
    +-- cmd ... they are make and update by mkcmdlink.bat 
    |   +-- CmdName1.bat.lnk ... symbolic link for CmdName1 main script.
    |   +-- CmdName2.bat.lnk ... symbolic link for CmdName2 main script.
    |   |
    |   +-- _configs ... if necessary, put commands config file
    |   |   +-- CmdName1/ ... CmdName1 config files directory
    |   |
    |   +-- _cache ... if necessary, put commands cache file
    |   |   +-- CmdName1/ ... CmdName1 cache files directory
    |   |   +-- CmdName2/ ... CmdName2 cache files directory
    |   |
    |   +-- _temp ... if necessary, put commands tempolary file
    |       +-- CmdName2/ ... CmdName2 temp files dirctory
    |
    +-- bin ... if necessary, you can put external commands
        +-- ExtCmd1.exe
        +-- ExtCmd2.exe
```


## Coding Rules and Parts of script provided by batbox
### Definition of the meaning of words.
#### Command and script
Command is *.exe or *.bat(main script).
Script is *.bat script(include sub script).

#### Process or Proc
Process is use goto :TAG

[define]
```
:TAG_NAME
echo Hello, World
exit /b 0   ... bat script exit
```

[use]
```
goto :TAG_NAME
```

#### Function or Func
Function is use `call :TAG`.

[define]
```
:FuncName
setlocal
set /a retVar=%1*2
endlocal && %2=%retVar%
exit /b 0   ... function exit, must return code(Success:0, Faild:not 0)
```

[use]
```
call :FuncName %param% retBuf
echo %retBuf%
```

#### Array
Array is not exist normal bat world.  
But we can imitate it in a pseudo array.  
We treat it as starting from 1.  
This allows the array length to be used as it is for the end value of the for loop.  

[define]
Array has elements and 'Len' property. it is array length

```
call _NewAry Ary "Hello" "World"
call _PushAry Ary "!"
call _PopAry Ary LastElm
call _DelAry Ary "Hello" "World"

or

rem _NewAry
set Ary[1]="Hello"
set Ary[2]="World"
set Ary.Len=2

rem _PushAry
set Ary[3]="!"
set /a Ary.Len=Ary.Len + 1

rem _PopAry
set LastElm=!Ary[%Ary.Len%]!
set Ary[%Ary.Len%]=
set /a Ary.Len=Ary.Len - 1

rem _DelAry
for /l %%i in (1, 1, %Ary.Len%) do set Ary[%%i]=
Ary.Len=
```

[use]
```
call :EchoAry Ary

...

:EchoAry
setlocal enabledelayedexpansion
for /l %%i in (1, 1, !%1.Len!) do echo %1[%%i]: !%1[%%i]!
endlocal
exit /b 0
```

### Naming Rule
Global Constant ... set CONST_NAME=0
Global Variable ... set VariableName=0
Local Variable  ... set variableName=0
Global Proc TAG ... :GLOBAL_PROC_TAG  (use goto)
Local Proc TAG  ... :local_goto_tag (use goto)
Function TAG    ... :CallFuncTag (use call)
Bat File Name   ... BatName.bat (use call)
Lib File Name   ... _LibName.bat (must start under score, avoid namespace problems)


## The remaining problem for the time being
Whether standard encoding is sjis or utf8.
