#!/bin/sh

# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$ANDROID_KEYS_SECRET_PASSPHRASE" \
--output android/android_secrets.zip android/android_secrets.zip.gpg && cd android && jar xvf android_secrets.zip && cd - || exit