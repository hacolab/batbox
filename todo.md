# Meaning of Mark
- [A] ちゃんとテストケース考えてテストした
- [B] とりあえずテストスクリプト用意した
- [C] 実装してなんとなく動いてそう
- [D] とりあず実装した
- [Z] 実装したが課題あり
- [-] 未実装


# Libraries
[String]
- [B] _StrLen
- [B] _StrSub
- [Z] _StrIndex TODO:文字列検索への対応(今は１文字のみ検索)
- [Z] _StrLastIndex TODO:文字列検索への対応(今は１文字のみ検索)
- [-] _StrCount
- [C] _StrRepeate
- [C] _StrUpper
- [C] _StrLower
- [-] _StrReplace
- [-] _StrSplit
- [B] _StrSplitL
- [B] _StrSplitR
- [B] _StrTrim
- [B] _StrTrimL
- [B] _StrTrimR

[Array]
- [B] _AryNew
- [C] _AryDel
- [B] _AryPush
- [B] _AryPop
- [B] _AryEcho
- [C] _AryEach
- [-] _AryMap
- [-] _AryFilter

[Path]
- [C] _PathGetParent
- [C] _PathIsFile
- [C] _PathIsDir
- [C] _PathWalk
- [C] _PathWalkFile
- [C] _PathWalkDir

[Useful]
- [C] _AcceptKey
- [C] _AcceptStr
- [C] _AcceptAlpha
- [C] _AcceptDec
- [Z] _CEcho  TODO:色付きの部分文字列の大文字小文字区別
- [D] _EachStdout
- [-] _GetCmdOut
- [C] _GetParams
- [C] _GetDate
- [C] _GetTime
- [C] _NotifyBell
- [C] _IsAdmin
- [C] _RestartByAdmin
- [-] _ReadConfigs

[Test]
- [Z] _TestAssert
- [-] _TestAssertAry
- [C] _TestProcTime

[Debug]
- [D] _TrapMode
- [C] _TrapMsg
- [C] _TrapVal
- [C] _TrapAssertEq
- [C] _TrapAssertNeq


# BatBox Management Tools
- [-] MakeNewCmd
- [-] RunTestScript
