#!/bin/bash

# Credentials to try, in order. Format: "username|password"
CREDENTIALS=(
    "faaaabbbb|Bits@cccccccc"
    "fxxxxyyyy|Bits@zzzzzzzz"
)

for credential in "${CREDENTIALS[@]}"; do
    IFS='|' read -r USERNAME PASSWORD <<< "$credential"

    RESPONSE=$(curl --silent --location --max-time 15 "http://172.16.0.30:8090/login.xml" \
        --data-urlencode 'mode=191' \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}")

    # Server reports <status><![CDATA[LIVE]]></status> when signed in,
    # <status><![CDATA[LOGIN]]></status> on auth failure
    if echo "$RESPONSE" | grep -q '<status><!\[CDATA\[LIVE\]\]></status>'; then
        echo "Logged in as ${USERNAME}"
        exit 0
    fi

    MESSAGE=$(echo "$RESPONSE" | sed -n 's/.*<message><!\[CDATA\[\(.*\)\]\]><\/message>.*/\1/p')
    echo "Login failed for ${USERNAME}: ${MESSAGE:-no response from server}"
done

echo "All credentials failed"
exit 1
