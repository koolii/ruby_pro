## 環境構築

```bash
$ brew install ruby-build rbenv
$ rbenv 2.5.0
$ rbenv global 2.5.0
$ ruby -v
ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin16]
```

* Rubyは関数定義の際にreturnが必要ない(最後に処理された式が戻り値になる)

* シングルクオートは式が展開されない
* ダブルクォートは`#{}`を使って展開する(暗黙的に`to_s`が呼ばれる)

* 4.8章の配列オブジェクトの説明は面白かった(No.3394)

## Symbol class

### disposition
* シンボルはコロンの後に任意の文字列を付加させて作成する(Stringとかなり似ているが、シンボルはSymbolクラスだし、中身は全然違う)
* シンボルは同じシンボルであれば必ず同一のオブジェクトになる
* 内部的にはただの整数値らしい
* シンボルは値が書き換えられることが決してない

### frequent practice
* hash key(you can get a value by using symbol)