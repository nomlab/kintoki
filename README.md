# kintoki
## カーネル開発の環境構築
 + VirtualBox と VirtualBox Extension Pack のインストール
   + 下記サイトから VirtualBox(Windows用) と VirtualBox Extension Pack をダウンロードしてインストールする．
    ```sh
    https://www.virtualbox.org/
    ```
+ Vagrantのインストール
  + 下記サイトからVagrantをダウンロードしてインストールする．
   インストール後，再起動を行う．起動前にF10を押下し，BIOSの設定画面へ遷移しておくと次の手順がスムーズに行える．
   ```sh
   https://www.vagrantup.com/
   ```
+ BIOSのハードウェア仮想化(VT-x)のサポートを有効にする．
  + 文書用計算機をシャットダウンする．
  + 電源を投入し，F10キーを押下し，BIOSの設定画面へ遷移する．
  + Security -> System Security を選択し，Virtualization technology (Vtx) を Enable に変更する．
  + F10キーを押下する．こうすると，上記の設定が反映される．
  + File -> Save changes and Exit を選択する．
  + Yes を選択する．
+ Vagrantの設定
  + コマンドプロンプト起動する．Winキー押下後，"cmd"と入力し，Enterキーを押下する．
  + Vagrantfileを生成する．コマンドプロンプトに下記のコマンドを入力する．
   ```sh
   $ mkdir DebianVagrant
   $ cd DebianVagrant
   $ vagrant init
   $ vagrant plugin install vagrant-vbguest
   ```
  + 本リポジトリ内の Vagrantfile を，C:\Users\(ユーザ名)\DebianVagrant 下に配置する．(元からあったVagrantfileに上書きする)．

  + Vagrantfile の以下の部分を自身の情報に編集する．以下にユーザが杉の一例を載せる．
   ```sh
   88 git config --global user.name "Keisuke Sugi"
   89 git config --global user.email "sugi@swlab.cs.okayama-u.ac.jp"
   ```
  + キーボードの設定を行う場合，以下の部分を変更する．
   ```sh
   81 sudo localectl set-keymap jp106
   82 setxkbmap jp
   ```

+ 仮想マシンの起動
  + 仮想マシンの初期設定をする．コマンドプロンプトに以下のコマンドを入力する．
   ```sh
   $ vagrant up
   $ vagrant vbguest --do install
   $ vagrant vbguest --do start
   ```
  + 仮想マシンに接続する．コマンドプロンプトに以下のコマンドを入力する．
   ```sh
   $ vagrant ssh
   ```
