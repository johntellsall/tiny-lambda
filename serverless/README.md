# PING: minimal Serverless example, for testing

1) edit handler.ts
2) "make local" to run locally.

# Deploy

To update & run on Development environment:

	AWS_PROFILE=development make test

# Simple Tasks

quickly find library issues w/o using AWS

	make package

rebuild and run locally

	make local

# AWS Tasks

The following tasks require AWS_PROFILE to be set.

Example, to rebuild, deploy, and run a Lambda:

	AWS_PROFILE=myprofile make test

Deploy

	AWS_PROFILE=myprofile make deploy

Deploy single function (faster)

	AWS_PROFILE=myprofile make deployf

Run already-deployed function

	AWS_PROFILE=myprofile make invoke:


# Utility tasks

Clean up

	make clean

Show info about compiled function

	make info
