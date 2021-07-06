; My Ender 3 Pro Bed Leveling Gcode
; Author: rairaiken
; Last Updated: 6 July 2021


; Preheat Bed
G90 ; use absolute coordinates
M83 ; extruder relative mode
M117 Setting temps
M140 S60 ; starting by heating the bed for nominal mesh accuracy
M104 S150 ; preheat nozzle
M117 Homing all axes ; send message to printer display
G28      ; home all axes
M190 S60 ; wait for bed temp
M109 S150 ; wait for nozzle temp


; CHEP's Bed Leveling Code
G28
M25
G1 Z5
G1 X32 Y36 F3000
G1 Z0
M25
G1 Z10
G1 X32 Y206 F3000
G1 Z0
M25
G1 Z5
G1 X202 Y206 F3000
G1 Z0
M25
G1 Z5
G1 X202 Y36 F3000
G1 Z0
M25
G1 Z5
G1 X117 Y121 F3000
G1 Z0
M25
G1 Z5
G1 X32 Y206 F3000
G1 Z0
M25
G1 Z5
G1 X202 Y206 F3000
G1 Z0
M25
G1 Z5
G1 X202 Y36 F3000
G1 Z0
M25
G1 Z5
G1 X32 Y36 F3000
G1 Z0
M25


; BL Touch Probing
G90
M83
M117 Homing all axes
G28
M117 Creating the bed mesh levels ; send message to printer display
M155 S30 ; reduce temperature reporting rate to reduce output pollution
@BEDLEVELVISUALIZER	; tell the bed visualizer plugin to watch for reported mesh
G29 T	   ; run bilinear probing
M155 S3  ; reset temperature reporting
M117 Saving bed mesh to EEPROM ; send message to printer display
M500
G1 Z50 F240
G1 X2 Y10 F3000
M117 Bed mesh levels completed
M300 S440 P200 ; make calibration completed tones
M300 S660 P250
M300 S880 P300
G28      ; home all axes

; End
