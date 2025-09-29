/*
 *
 * Random Gen RWG Script
 * - by dcsobral (originally written by HarveyUK 2019/12/20)
*/

#SingleInstance Force
SetWorkingDir %A_ScriptDir%
;if not A_IsAdmin
;    Run *RunAs "%A_ScriptFullPath%"
#Include %A_ScriptDir%
#Include stdio.ahk

; Command line args
RWGSize := A_Args[1]
RWGSeed := A_Args[2]
RWGTowns := A_Args[3]
RWGWilderness := A_Args[4]
RWGRivers := A_Args[5]
RWGCraters := A_Args[6]
RWGCracks := A_Args[7]
RWGLakes := A_Args[8]
RWGPlains := A_Args[9]
RWGHills := A_Args[10]
RWGMountains := A_Args[11]
RWGRandom := A_Args[12]

/*
* Defined Co-ordinates
*
*/

Coordmode, Mouse, Screen

; World Seed Box

worldSeedX := 624
worldSeedY := 310

; Arrows horizontal location
leftArrowX := 511
rightArrowX := 740
rightArrowRow2X := 1275
leftArrowRow2X := 1030

wastelandY := 975
snowY := 920
desertY := 870
burntY := 810
pineY := 755

; World Size vertical arrows

sizeArrowY := 365

; Towns vertical arrows
townsArrowY := 476

; Wilderness vertical arrows
; wildernessArrowY := 566
wildernessArrowY := 533

; Rivers vertical arrows
; riversArrowY := 626
riversArrowY := 589

; Cracks vertical arrows
;cratersArrowY := 645
cratersArrowY := 645

; Lakes vertical arrows
; cracksArrowY := 702
cracksArrowY := 700

; Lakes vertical arrows
lakesArrowY := 756

; Plains Weight vertical arrows
plainsArrowY := 480

; Hills Weight vertical arrows
hillsArrowY := 531

; Mountains Weight vertical arrows
mountainsArrowY := 587

; World Generation Button

worldGenX := 1058
worldGenY := 1195

WinActivate, 7 Days To Die

Sleep, 5000

Send, {F1}

Sleep, 500

Send, xui open rwgeditor

Sleep, 500

Send, {Return}

Sleep, 500

Send, {F1}

Sleep, 500

Stdout("Seed: " . RWGSeed)
MouseClick, Left, worldSeedX, worldSeedY ; Location in the 7D2D Client where the World Seed Box is.

Sleep, 500

Send, %RWGSeed%

Sleep, 500

move := 10 ; Default to avoid errors
if RWGSize = 6144
{
    move := -1
}
else if RWGSize = 8192
{
    move := 0
}
else if RWGSize = 10240
{
    move := 1
}
else if RWGSize = Default
{
    move := 0
}

Stdout("Changing World Size Option")
changeOption("World Size", RWGSize, move, leftArrowX, rightArrowX, sizeArrowY)
Stdout("Changed World Size Option")
Sleep, 1000

changeNoneToManyOption("Gen Towns", RWGTowns, leftArrowX, rightArrowX, townsArrowY)
changeNoneToManyOption("Gen Wilderness", RWGWilderness, leftArrowX, rightArrowX, wildernessArrowY)

changeNoneToManyOption("Rivers", RWGRivers, leftArrowX, rightArrowX, riversArrowY)
changeNoneToManyOption("Craters", RWGCraters, leftArrowX, rightArrowX, cratersArrowY)
changeNoneToManyOption("Cracks", RWGCracks, leftArrowX, rightArrowX, cracksArrowY)
changeNoneToManyOption("Lakes", RWGLakes, leftArrowX, rightArrowX, lakesArrowY)


changeZeroToTenOption("Mountains Weight", 2, RWGMountains, leftArrowRow2X, rightArrowRow2X, mountainsArrowY)
Sleep, 2000
;Stdout("Unknown option '" . value . "' for " . name)

changeZeroToTenOption("Hills Weight", 4, RWGHills, leftArrowRow2X, rightArrowRow2X, hillsArrowY)
Sleep, 2000

changeZeroToTenOption("Plains Weight", 4, RWGPlains, leftArrowRow2X, rightArrowRow2X, plainsArrowY)
Sleep, 2000


MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY
Sleep, 300
MouseClick, Left, leftArrowRow2X, wastelandY


Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY
Sleep, 300
MouseClick, Left, leftArrowRow2X, snowY

MouseClick, Left, leftArrowRow2X, desertY
Sleep, 300
MouseClick, Left, leftArrowRow2X, desertY
Sleep, 300
MouseClick, Left, leftArrowRow2X, desertY
Sleep, 300
MouseClick, Left, leftArrowRow2X, desertY
Sleep, 300
MouseClick, Left, leftArrowRow2X, desertY
Sleep, 300
MouseClick, Left, leftArrowRow2X, desertY

Sleep, 300
MouseClick, Left, leftArrowRow2X, burntY
Sleep, 300
MouseClick, Left, leftArrowRow2X, burntY

MouseClick, Left, rightArrowRow2X, pineY
Sleep, 300
MouseClick, Left, rightArrowRow2X, pineY
Sleep, 300
MouseClick, Left, rightArrowRow2X, pineY
Sleep, 300



;;changeZeroToTenOption("Random Weight", 0, RWGRandom, leftArrowX, rightArrowX, randomArrowY)

; Start generation
Stdout("Generate World")
MouseClick, Left, worldGenX, worldGenY ; Location of the Generate World Button

changeYesNoOption(name, value, leftArrowX, rightArrowX, arrowY)
{
    move := 10 ; Default to avoid errors
    if value = No
    {
        move := -1
    }
    else if value = Yes
    {
        move := 0
    }
    else if value = Default
    {
        move := 0
    }
    else
    {
        Stdout("Unknown option '" . value . "' for " . name)
        return
    }

    changeOption(name, value, move, leftArrowX, rightArrowX, arrowY)
}

changeZeroToTenOption(name, default, value, leftArrowX, rightArrowX, arrowY)
{
    if value = Default
    {
        move := 0
    }
    else
    {
        move := value - default
    }

    changeOption(name, value, move, leftArrowX, rightArrowX, arrowY)
}
changeNoneToManyOption(name, value, leftArrowX, rightArrowX, arrowY)
{
    ; Default value to avoid errors
    move := 10

    if value = None
    {
        move := -2
    }
    else if value = Few
    {
        move := -1
    }
    else if value = Default
    {
        move := 0
    }
    else if value = Many
    {
        move := 1
    }
    else
    {
        Stdout("Unknown option '" . value . "' for " . name)
        return
    }

    changeOption(name, value, move, leftArrowX, rightArrowX, arrowY)
}

changeOption(name, value, move, leftArrowX, rightArrowX, arrowY)
{
    Stdout(name . ": " . value . " (" . move . ")")
    While move != 0
    {
        if move < 0
        {
            MouseClick, Left, leftArrowX, arrowY
            move := move + 1
        }
        else if move > 0
        {
        MouseClick, Left, rightArrowX, arrowY
            move := move - 1
        }
        Sleep, 250
    }
}

/* vim: set ts=4 sw=4 tw=100 et :*/
