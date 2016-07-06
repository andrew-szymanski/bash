#!/bin/bash

#

echo "$0 starting..."

log() {
   date "+%m-%d:%H:%M:%S $*"
}

AUDIT_USERS="root hdfs tstrecen"
AUDIT_DIR_ROOT="${HOME}/.audit_history"
TODAY_STRING=$(date +"%m-%d")

if [ ! -d ${AUDIT_DIR_ROOT} ]; then
   mkdir ${AUDIT_DIR_ROOT}
fi


for USER_ID in ${AUDIT_USERS}
do
   log "[${USER_ID}] starting..."
   USER_DIR=${AUDIT_DIR_ROOT}/${USER_ID}
   if [ ! -d ${USER_DIR} ]; then
      mkdir ${USER_DIR}
   fi
   # copy history file, appending date
   HISTORY_AUDIT_FILE="${USER_DIR}/history.${TODAY_STRING}.txt"
   USER_HOME_DIR=$(eval echo ~${USER_ID})
   cat ${USER_HOME_DIR}/.bash_history >> ${HISTORY_AUDIT_FILE}
done

chmod -R go-rwx ${AUDIT_DIR_ROOT}
