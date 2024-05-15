if [ "$(acpi | awk '{print $3}' | tr -d ',')" != "Discharging" ]; then

        echo "%{F#27FF00}%{F#FFFFFF}"
else
        echo "%{F#FF0000} %{F#FFFFFF}$(acpi | awk '{print $4}' | tr -d ',')%{u-}"
fi
