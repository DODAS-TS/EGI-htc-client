echo "eval \`oidc-keychain\`" >> ~/.bashrc
eval `OIDC_CONFIG_DIR=$HOME/.config/oidc-agent oidc-keychain`
oidc-gen --flow device \
    --dae https://dodas-iam.cloud.cnaf.infn.it/devicecode \
    --issuer https://dodas-iam.cloud.cnaf.infn.it/ \
    --scope "openid profile email offline_access wlcg wlcg.groups" \
    --client-id egi-public --client-secret LXwUeinGVxEiBdhfYuczHTbVfOt0JQ7eequdDcVfH7-RLnfq8I_VVjr9oP4cLXaTlGN1X1nYuIzBf1p9kEXAFw \
    --redirect-uri http://localhost:8080 \
    htc-auth

while true; do
    oidc-token htc-auth --time 1200 >/tmp/token
    sleep 600
done &