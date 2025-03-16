echo "Type YC OAuth token. You can get it here\nhttps://oauth.yandex.ru/authorize?response_type=token&client_id=1a6990aa636648e9b2ef855fa7bec2fb"
read TOKEN
echo "Type YC Bucket name..."
read BUCKET
echo "packing the app"
pnpm pack:dist
echo "uploading the app"

cd dist
for app in *; do
  cd $app
  for fileOrDir in *; do
    if [ -d "$fileOrDir" ]; then
      cd $fileOrDir
      for file in *; do
        echo "uploading $app/$fileOrDir/$file"
        yc storage s3api put-object --bucket $BUCKET --key "$app/$fileOrDir/$file" --body $file --token $TOKEN
      done
      cd ..
    fi
    if [ -f "$fileOrDir" ]; then
      echo "uploading $app/$fileOrDir"
      yc storage s3api put-object --bucket $BUCKET --key "$app/$fileOrDir" --body $fileOrDir --token $TOKEN
    fi
  done
  cd ..
done
