netsh wlan export profile key=clear
echo "" >> claves.txt
dir *.xml |% {
$cittz=[xml] (get-content $_)
$z= "______________________________________________________________________ `r`r`n Nombre de la red WiFi: "+$cittz.WLANProfile.SSIDConfig.SSID.name + "`r`n Contenido de la clave: " +$cittz.WLANProfile.MSM.Security.sharedKey.keymaterial + "`n______________________________________________________________________`n"
Out-File claves.txt -Append -InputObject $z

}

rm *.xml -Force