「Pythonで学ぶ音声合成」をやってみるリポジトリです。  
https://github.com/r9y9/ttslearn

## 環境
当リポジトリ内のDockerfileを利用して作成することができます。
そのまま利用する場合は以下のコマンドを実行してから`DevContainer`を起動してください。

```bash
docker build . -t tts-learn:0.0.0
```

そうでない場合は、`compose.yaml`をよしなに書き換えることで使用できると思います。