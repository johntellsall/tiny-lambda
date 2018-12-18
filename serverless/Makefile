
all:

init:
	yarn install --frozen-lockfile

# package -- quickly find library issues w/o using AWS
package:
	serverless package

# local -- rebuild and run locally
local:
	serverless invoke local --function hello

# The following tasks require AWS_PROFILE to be set.
# Example, to rebuild, deploy, and run a Lambda:
#	AWS_PROFILE=development make test
#
deploy:
	serverless deploy -v --aws-s3-accelerate
deployf:
	serverless deploy function --function hello --aws-s3-accelerate
invoke:
	serverless invoke --function hello -l

test: deploy invoke


# utility tasks
#
clean:
	-$(RM) -rf .serverless
	serverless remove

info:
	ls -l .serverless/*.zip
