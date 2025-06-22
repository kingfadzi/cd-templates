#!/bin/bash
set -e

RELEASE_TIMESTAMP=$(date +%Y%m%d_%H%M%S)
echo "$RELEASE_TIMESTAMP" > release_timestamp.txt
RELEASE_PATH="${RELEASES_DIR}/${RELEASE_TIMESTAMP}"
echo "Creating release directory: $RELEASE_PATH"

sshpass -e ssh ${SSH_OPTS} ${DEPLOY_USER}@${DEPLOY_SERVER} "mkdir -p ${RELEASE_PATH} ${RELEASES_DIR}"