# The MIT License (MIT)

# Copyright (c) 2021-2023 Krux contributors

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#!/bin/bash

device=$1
locale=$2

# Create screenshots directory
rm -rf screenshots && mkdir -p screenshots

# Create a sd folder and a fresh settings.json file
mkdir -p sd && rm -f sd/settings.json
echo "{\"settings\": {\"i18n\": {\"locale\": \"$locale\"}}}" > sd/settings.json

# Create an encrypted mnemonic file to generate "Load -> From Storage" screenshots
encrypted_mnemonics="{\"d668b8b7\": {\"version\": 0, \"key_iterations\": 100000, \"data\": \"haAyMxF\
mOVkBE5QixIeJl7P0dYKVeOiuhNodO+qyI2lA+veFUxcXben1OZvKOqTbWNI2Oj8SROTpooiS/4WJdA==\"}, \"a56dfd6c\": \
{\"version\": 0, \"key_iterations\": 100000, \"data\": \"PY9fBDrqtv2ZyZF47CsZ5QucxzXmOxaJJtjkngEQTfH\
LyLgHTQ3oX8AbZR6+UXBXZUB+eSOHwJZm1jCO8AaBxQ==\"}}"
echo "$encrypted_mnemonics" > sd/seeds.json

# Execute sequences in the order they appear in the application

# Login
# poetry run python simulator.py --sequence sequences/logo.txt  --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-options.txt --sd --device $device
# poetry run python simulator.py --sequence sequences/new-mnemonic-options.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-sequence.txt  --sd --device $device

# Home
# poetry run python simulator.py --sequence sequences/home-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/encrypt-mnemonic.txt --sd --device $device
# poetry run python simulator.py --sequence sequences/extended-public-key-wpkh.txt  --device $device
# poetry run python simulator.py --sequence sequences/extended-public-key-wsh.txt  --device $device
# poetry run python simulator.py --sequence sequences/wallet-wsh.txt  --device $device
# poetry run python simulator.py --sequence sequences/scan-address.txt --device $device
# poetry run python simulator.py --sequence sequences/list-address.txt --device $device
# poetry run python simulator.py --sequence sequences/sign-psbt.txt  --sd --device $device
poetry run python simulator.py --sequence sequences/sign-message.txt  --device $device


# TODO: Fix remainng sequences
# poetry run python simulator.py --sequence sequences/bitcoin-options.txt  --device $device

# poetry run python simulator.py --sequence sequences/load-mnemonic-options.txt --sd --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-via-numbers.txt  --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-via-qr.txt  --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-via-stackbit.txt  --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-via-text.txt  --device $device
# poetry run python simulator.py --sequence sequences/load-mnemonic-via-tinyseed.txt  --device $device
# poetry run python simulator.py --sequence sequences/language-options.txt  --device $device

# poetry run python simulator.py --sequence sequences/new-mnemonic-via-d6.txt  --device $device
# poetry run python simulator.py --sequence sequences/new-mnemonic-via-d20.txt  --device $device
# poetry run python simulator.py --sequence sequences/new-mnemonic-via-snapshot.txt  --device $device
# poetry run python simulator.py --sequence sequences/persist-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/print-qr.txt --sd --printer --device $device
# poetry run python simulator.py --sequence sequences/printer-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/qr-transcript.txt  --device $device

# poetry run python simulator.py --sequence sequences/settings-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/shutdown.txt  --device $device
# poetry run python simulator.py --sequence sequences/themes.txt  --device $device
# poetry run python simulator.py --sequence sequences/thermal-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/tools-check-sd.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/tools-create-QR.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/tools-mnemonic.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/tools-print-test-qr.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/tools-wipe-device.txt  --sd --device $device
# poetry run python simulator.py --sequence sequences/wallet-type-options.txt  --device $device
# poetry run python simulator.py --sequence sequences/wallet-wpkh.txt  --device $device

