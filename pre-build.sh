#!/bin/bash
# Меняем версию на 72.13
sed -i 's/71\.4/72.13/g' padavan-ng/trunk/user/nfqws/Makefile

# Выводим в лог содержимое старого патча, чтобы видеть, что именно он менял
cat padavan-ng/trunk/user/nfqws/patches/firmware-specific.patch

# Удаляем конфликтующий старый патч и добавляем правку Makefile прямо в процесс распаковки
rm -f padavan-ng/trunk/user/nfqws/patches/firmware-specific.patch
sed -i 's|tar zxf \$(SRC_ARCHIVE);|tar zxf $(SRC_ARCHIVE); sed -i "/^CC[[:space:]]*=/d" zapret-72.13/*/Makefile;|g' padavan-ng/trunk/user/nfqws/Makefile
