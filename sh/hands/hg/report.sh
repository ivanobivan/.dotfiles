#!/bin/bash

#todo: should i use SMTP connect to send the report in letter?
START=$(date +'%Y-%m-01')
COUNT_DAYS_IN_MOUNTH=$(cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}')
FINISH=$(date +%Y-%m-${COUNT_DAYS_IN_MOUNTH})
NAME='Ivan Kolesov'
DEV="$HOME/workspace/develop"
LIST=$(tree ${DEV} -dfi -L 1 --noreport)
FILE="${HOME}/hg-reports/hg-${START}:${FINISH}-report.txt"
TEMPLATE='Дата изменения: {date|shortdate}\nОписание:{desc}\n\n'
NEED_PACK=(
    "core2",
    "dictionary"
    "re-tools",
    "rebudget",
    "regulatoryinfo",
    "nsi-resources",
    "common-utils"
)
echo "" > ${FILE}
for e in ${LIST}
    do  
        REPO_NAME="${e##*/}"
        if [[ ${NEED_PACK[@]} =~ ${REPO_NAME} ]]
            then
                cd ${e}
                LOG=$(hg log -d "${START} to ${FINISH}" -k "${NAME}" --template "${TEMPLATE}")
                if [[ ${#LOG} != "0" ]]
                    then
                        echo "create report from $(pwd)"
                        echo "-------------------------" >> ${FILE}
                        echo "Для репозитория ${REPO_NAME}:" >> ${FILE}
                        echo "-------------------------" >> ${FILE}
                        hg log -d "${START} to ${FINISH}" -k "${NAME}" --template "${TEMPLATE}" >> ${FILE}
                fi
        fi
done

