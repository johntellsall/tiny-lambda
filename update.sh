#!/bin/sh

EXEC_ROLE='arn:aws:iam::591128001215:role/tuitionio-production-us-east-1-lambdaRole'
QUEUE_URL='https://sqs.us-east-1.amazonaws.com/591128001215/ELIGIBILITY_REACTIVATE'

set -euo pipefail # strict mode
set -o xtrace # verbose

CMD=${1:-}

if [ ${CMD} = "create" ] ; then
  exec aws lambda create-function \
  --function-name=sendsqs \
  --runtime nodejs6.10 --role ${EXEC_ROLE}  --handler sendsqs.handler \
  --zip-file fileb://sendsqs.zip

elif [ ${CMD} = "invoke" ] ; then
  exec aws lambda invoke --function-name=sendsqs /dev/stdout

elif [ ${CMD} = "update" ] ; then
  zip sendsqs.zip sendsqs.js

  aws lambda update-function-configuration \
  --function-name  sendsqs \
  --environment "Variables={QUEUE_URL='$QUEUE_URL'}"

  exec aws lambda update-function-code \
    --function-name sendsqs \
    --zip-file fileb://sendsqs.zip

else
  echo "uhoh: usage"
  exit 1
fi

