#!/bin/bash
M=padavan-ng/trunk/user/nfqws/Makefile
P=padavan-ng/trunk/user/nfqws/patches/firmware-specific.patch

# версия zapret
sed -i 's/71\.4/72.13/g' "$M"

# убираем из патча все разделы Makefile (LTO уберём через sed)
awk '/^(diff |--- )/{skip = ($0 ~ /Makefile/)} !skip' "$P" > "$P.new" && mv "$P.new" "$P"

# перед сборкой удаляем -flto из всех Makefile zapret
awk 'index($0,"$(MAKE) -j$(HOST_NCPU) -C $(SRC_NAME)"){print "\tsed -i -E \"s/ -flto(=[a-z0-9]+)?//g\" $(SRC_NAME)/Makefile $(SRC_NAME)/*/Makefile"} {print}' "$M" > "$M.new" && mv "$M.new" "$M"

# для контроля в логе
sed -n '/^all:/,/^$/p' "$M"
