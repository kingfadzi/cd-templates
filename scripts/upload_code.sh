#!/bin/bash
set -e

RELEASE_TIMESTAMP=$(cat release_timestamp.txt)
RELEASE_PATH="${RELEASES_DIR}/${RELEASE_TIMESTAMP}"
git archive --format=tar.gz ${CI_COMMIT_SHA} -o code.tar.gz

sshpass -e scp ${SSH_OPTS} code.tar.gz ${DEPLOY_USER}@${DEPLOY_SERVER}:${RELEASE_PATH}/