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
ビルドファイル関連は、`artifacts`フォルダに生成
abiファイルは、`artifacts/contracts/`配下に生成
※ abiファイルは、外(フロント)から接続する際に使用する
```
npx hardhat compile
```

詳細を確認したい場合は公式を参照
https://hardhat.org/hardhat-runner/docs/guides/compile-contracts

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

# デプロイ
`scripts`フォルダを作成して、その中でデプロイに関する処理を記載する

## ローカル
呼び出しのコマンドは以下
一度終了するとネットワークは破棄される
```
npx hardhat run scripts/deploy.js
```

### ネットワークを維持しながらローカルで開発する方法
ローカルにNodeを立ち上げる
```
npx hardhat node
```

立ち上げたNodeに対してコントラクトをデプロイ
```
npx hardhat run scripts/deploy.js --network localhost
```

コマンドを入力しながらデバッグする方法
```
npx hardhat console --network localhost
```
## メインネット テストネット
1. alchemyでAppを作成
https://dashboard.alchemy.com/
2. 作成したAppのAPI KEYをコピー
3. .envを作成して ALCHEMYとプライベートキーをコピーする
例
.env
```
ALCHEMY_API_KEY="hogehoge"
PRIVATE_KEY = "matamask key"
```
4. hardhat.config.js に設定を追加
```
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `https://eth-goerli,g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
```

5. NFTの場合は
NFT Storageにmatadataと画像をuploadeする
https://nft.storage/

6. デプロイ処理を追加
```
npx hardhat console --network {{ networkName　}}
```

7. Ether Scan
https://www.udemy.com/course/dappnft2/learn/lecture/33057468#overview

# 学習に使ったコンテンツ
https://www.udemy.com/course/dappnft2/