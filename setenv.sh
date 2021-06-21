JAVA_OPTS="$JAVA_OPTS -Denv.name=${ENV}"

JAVA_OPTS="$JAVA_OPTS -Doidc.discovery.url=${OIDC_DISCOVERY_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.id=${OIDC_CLIENT_ID}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.secret=${OIDC_CLIENT_SECRET}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.return_url=${OIDC_CLIENT_RETURN_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.logout_url=${OIDC_CLIENT_LOGOUT_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.scope=openid,profile,email"

export JAVA_OPTS
