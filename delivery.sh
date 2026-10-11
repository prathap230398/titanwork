#!/bin/bash

# Amazon Sony Home Theatre product endpoint
URL="https://www.amazon.in/Sony-HT-S40R-Subwoofer-Connectivity-Connectitvity/dp/B0961X3R2H/"

echo "Checking Sony HT-S40R product endpoint..."

HTTP_CODE=$(curl -L -sS \
  --connect-timeout 10 \
  --max-time 30 \
  -o /tmp/amazon_product.html \
  -w "%{http_code}" \
  "$URL")

if [ $? -eq 0 ]; then
    echo "HTTP Status Code: $HTTP_CODE"

    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Endpoint responded successfully."
        echo "Response saved to /tmp/amazon_product.html"
    else
        echo "Endpoint returned a non-200 response."
        echo "Amazon may require additional verification."
    fi
else
    echo "Request failed. Check your network connection."
fi

