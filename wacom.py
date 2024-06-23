#!/usr/bin/env python3

import subprocess

def get_output(command, split=False):
    out = subprocess.check_output(command, shell=True, text=True).strip()
    if split:
      out = out.split('\n')
    return out
      

# Get monitor names
monitor_names_command = "xrandr | grep ' connected' | awk '{print $1}'"
monitor_names = get_output(monitor_names_command, split=True)

# Get monitor codes (sizes) using grep -o
monitor_codes_command = "xrandr | grep '\\bconnected' | grep -Po '\\d+x\\d+\\+\\d+\\+\\d+'"
monitor_codes = get_output(monitor_codes_command, split=True)

monitor_to_code = dict()
for i in range(len(monitor_names)):
  monitor_to_code[monitor_names[i]] = monitor_codes[i]

# Get monitor selected by user with rofi
selected_monitor_command = f'echo \"{"\\n".join(monitor_names)}\" | rofi -dmenu \'hack 15\''
selected_monitor = get_output(selected_monitor_command)
print(f"monitor: {selected_monitor}")

code = monitor_to_code[selected_monitor]

get_tablet_id_command = "xsetwacom --list | awk '{print $8}'"
tablet_ids = get_output(get_tablet_id_command, split=True)
for tablet_id in tablet_ids:
  map_pen_to_monitor_command = f'xsetwacom --set \"{tablet_id}\" MapToOutput \"{code}\"'
  get_output(map_pen_to_monitor_command)
  
  
# Print results
print("Monitor Names:\n" + "\n".join(monitor_names))
print("\nMonitor Codes:\n" + "\n".join(monitor_codes))
