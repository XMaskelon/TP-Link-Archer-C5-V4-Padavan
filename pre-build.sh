#!/bin/bash
sed -i 's/71\.4/72.13/g' padavan-ng/trunk/user/nfqws/Makefile

P=padavan-ng/trunk/user/nfqws/patches/firmware-specific.patch
echo "=== ORIGINAL PATCH ==="; cat "$P"
awk '/^(diff |--- )/{skip = ($0 ~ /(nfq|tpws)\/Makefile/)} !skip' "$P" > "$P.new" && mv "$P.new" "$P"
echo "=== FILTERED PATCH ==="; cat "$P"
echo "=== NFQWS MAKEFILE ==="; cat padavan-ng/trunk/user/nfqws/Makefile
