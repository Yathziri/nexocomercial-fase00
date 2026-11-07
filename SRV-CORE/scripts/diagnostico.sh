#!/bin/bash
echo "=== DIAGNOSTICO DE SRV-CORE ==="
echo "--- Servicios Locales (Samba, CUPS, SSH) ---"
for srv in smbd cups ssh; do
	if systemctl is-active --quiet "$srv"; then
		echo " [OK] $srv esta activo"
	else
		echo "[ALERTA] $srv est[a inactivo"
	fi
done
echo "--- Recursos de Hardware"
free -h
df -h /
