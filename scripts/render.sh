#!/bin/sh
set -o pipefail

cat > /run/secrets/output<<EOF
secrets: "user": {
  data: {
    username: "${DB_USER}"
    password: "${DB_PASS}"
  }
}
EOF