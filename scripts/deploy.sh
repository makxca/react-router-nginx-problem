set +ex
echo "Type username..."
read USER_NAME
echo "Type server IP-address or domain..."
read SERVER_IP
SSH_STRING=$USER_NAME@$SERVER_IP

echo "packing the app"
pnpm pack:dist

echo "installing nginx on the server"
ssh $SSH_STRING sudo apt update
ssh $SSH_STRING sudo apt install nginx -y

echo "uploading the app"
scp ./nginx.conf $SSH_STRING:/home/$USER_NAME/nginx.conf
rm -rf app
cp -r dist app
scp -r $(pwd)/app $SSH_STRING:/home/$USER_NAME/app
rm -rf app
ssh $SSH_STRING sudo mv /home/$USER_NAME/nginx.conf /etc/nginx/nginx.conf
ssh $SSH_STRING sudo rm -rf /app
ssh $SSH_STRING sudo mv /home/$USER_NAME/app /
echo "restarting nginx..."
ssh $SSH_STRING sudo systemctl stop nginx
ssh $SSH_STRING sudo systemctl start nginx
echo "successful!"
