# nixal_reprap4040 #

A scale-able open-hardware Reprap 3D printer based on aluminium profile 4040.  
All plastic parts and the assembly are designed in Fusion360 CAD.


![nixal i3](nixal_reprap4040_asm.jpg "nixal_reprap4040 3D printer")


## Overview
This build started at Feb 2015 with printed parts and acrylic frame from [fixers.gr](https://www.fixers.gr/)  
After a year of printing and having built a new mini-Kossel, I went for updates/reconstruction:

*	**Aluminium Y-corners: ** Replaced the 4 Y-corners with aluminium ones from Aliexress to avoid frame misalignnent and Y-corner(s) deformation from heavily-tighten nuts  [aliexpress](http://www.aliexpress.com/item/Reprap-Prusa-Mendel-CNC-metal-corner-holder-kit-Sturdier-RepRap-Prusa-i3-Aluminium-corner-pieces-set/32596725719.html )
*	**Adapter cylinders: **To use the aluminium corners with existing front/back M8 treaded rods I designed/printed adapter cylinders [thing:.......]. This workaround finally gives better alignment of the the rod inside the y_corner hole! It is prefered to 10mm front/back rods.
*	**Z TR8: **Replaced M5x0.75 Z threaded rods with TR8x8 to avoid wear and use high speed for Z movements [aliexpress](http://www.aliexpress.com/item/3D-Printer-Z-Axis-T8-Lead-Screw-Diameter-8mm-pitch-8mm-lead-of-thread-8mm-Length/2029409740.html). Having the Z axis moving equally fast as X,Y gives much better User_Experience (fast Park after printout-Kill, fast Z homing, fast manual Z move)
*	**New X,Z plastic parts: **To use TR8 for z, I had to replace all the x and z plastic parts [thing:1140783]. Top Z threaded-rod is in ball bearing resulting in enhanced User Experience: The top of the rod(s) is not moving during rotation 
*	**Y bearing mount: **To keep the bed horizontal and parallel with Y-Smooth-Rods (original I3 design Y bearings mount did not work well for me...) added x4 Y axis bearing mount [thing:710913]
*  **Higher Y motor mount: **To compensate  the increased hight of the bed I used higher mount for the Y-motor so the belt stays in close distance from the bed [thing:1336532] having the additional benefit the Y-Frame doesn't need to be dismounted to use it, and...
*	**New Y-EndStop: **Designed/printed a new Y-EndStop [thing:.......]
*	**Fun Bracket: ** Using [Extruder_body_JAM]  (downloaded from fixers.gr) combined with Jhead, I had to design/print a new FunBracket [thing:.....]

## Parts 

Count|Part          | Source        | QTY |Price/pc|Cost   | Notes                             |
-----|--------------|---------------|-----|--------|-------| ----------------------------------|
  01 |`Content Ce`  | **Content **  | Cont|Content | Conten| Content Cell                      |
  02 |`Content Cell`| **Content Cl**| Cont|Content | Conten| Content Cell                      |
  03 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  04 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  05 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  06 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  07 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  08 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  09 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  10 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  11 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  12 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  13 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  14 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  15 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  16 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  17 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  18 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  19 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  20 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  21 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  22 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |
  23 |Content Cell  | Content Cell  | Cont|Content | Conten| Content Cell                      |