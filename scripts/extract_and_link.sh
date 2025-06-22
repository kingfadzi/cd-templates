#!/bin/bash
set -e

RELEASE_TIMESTAMP=$(cat release_timestamp.txt)
RELEASE_PATH="${RELEASES_DIR}/${RELEASE_TIMESTAMP}"

sshpass -e ssh ${SSH_OPTS} ${DEPLOY_USER}@${DEPLOY_SERVER} \
  "cd ${RELEASE_PATH} && tar xzf code.tar.gz && rm code.tar.gz && ln -sfn ${RELEASE_PATH} ${CURRENT_LINK}"