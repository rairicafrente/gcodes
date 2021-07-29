; My Ender 3 Pro Bed Leveling Gcode
; Author: rairaiken
; Last Updated: 25 July 2021


; Define probe Z offset. Change this to your own probe offset value
M851 Z-1.4
M500 ; Store end stop value

; Preheat Bed
G90 ; use absolute coordinates
M83 ; extruder relative mode
M140 S60 ; starting by heating the bed for nominal mesh accuracy
M104 S150 ; preheat nozzle
M117 Setting temps ; send message
G28      ; home all axes
M190 S60 ; wait for bed temp
M109 S150 ; wait for nozzle temp


; Start Manual Bed Leveling
G1 Z5
G1 X32 Y206 F3000
G1 Z0.2
M25
G1 Z10
G1 X202 Y206 F3000
G1 Z0.2
M25
G1 Z5
G1 X202 Y36 F3000
G1 Z0.2
M25
G1 Z5
G1 X32 Y36 F3000
G1 Z0.2
M25
G1 Z5
G1 X32 Y206 F3000
G1 Z0.2
M25
G1 Z10
G1 X202 Y206 F3000
G1 Z0.2
M25
G1 Z5
G1 X202 Y36 F3000
G1 Z0.2
M25
G1 Z5
G1 X32 Y36 F3000
G1 Z0.2
M25
; End Manual Bed Leveling

; BL Touch Probing
G28      ; home all axes
M117 Creating the bed mesh levels ; send message to printer display
M155 S30 ; reduce temperature reporting rate to reduce output pollution
@BEDLEVELVISUALIZER	; tell the bed visualizer plugin to watch for reported mesh
G29 T	   ; run bilinear probing
M155 S3  ; reset temperature reporting
M117 Saving bed mesh to EEPROM ; send message to printer display
M500
M117 Bed mesh levels completed; send message to printer display

; Measure center bed 0.2 Z distance
M117 Measure Z distance at center; send message to printer display
G1 X110 Y110 F3000
G1 Z0.2
M25

; Bed Level completed
G1 Z5
G1 X20 Y20 F3000 ; return to home


; End
