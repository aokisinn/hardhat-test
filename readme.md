このプロジェクトはhardhatを勉強するために作成したプロジェクトです。

# プロジェクトの作成

1. パッケージのインストール
```
npm install --save-dev hardhat
```

2. プロジェクト作成

```
npx hardhat
```

この中から選択する
今回は `Create an empty hardhat.config.js` を選択
```
? What do you want to do? …
❯ Create a JavaScript project
  Create a TypeScript project
  Create an empty hardhat.config.js
  Quit
```
# 導入しているパッケージ
- @nomiclabs/hardhat-ethers
- @nomiclabs/hardhat-waffle
- ethereum-waffle
- chai
- @nomiclabs/hardhat-etherscan
- @openzeppelin/contracts

# hardhatコマンド
## コンパイル
ビルド後は、`artifacts`フォルダに吐き出される
```
npx hardhat compile
```

## テスト
全件
```
npx hardhat test
```

特定のファイルを指定する場合は`npx hardhat test {{ filePath }}`で実行できる
例
```
npx hardhat test test/MemberNFT.js
```

# 学習に使ったコンテンツ
https://www.udemy.com/course/dappnft2/