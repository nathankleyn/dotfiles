-- Imports.
import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Loggers

-- The main function.
main = xmonad =<< (statusBar barCommand barPrettyPrint toggleStrutsKey myConfig)

-- The xmobar colours
highlightColour = "#FF9"
hiddenColour = "#CCC"
disabledColour = "#888"
backgroundColour = "#000"

barCommand = "xmobar"
barPrettyPrint = xmobarPP {
        ppTitle = xmobarColor highlightColour "" . shorten 100,
        ppCurrent = xmobarColor highlightColour "",
        ppVisible = xmobarColor hiddenColour "",
        ppHidden = xmobarColor hiddenColour "",
        ppHiddenNoWindows = xmobarColor disabledColour ""
       }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = gnomeConfig {
              modMask = mod4Mask,
              normalBorderColor = "#FFF",
              focusedBorderColor = "#000",
              borderWidth = 1,
              handleEventHook = fullscreenEventHook,
              terminal = "terminator"
            }
            `additionalKeysP`
             [
               -- XF86AudioMute
                 ("<XF86AudioMute>", spawn "amixer -q set PCM toggle")
               -- XF86AudioLowerVolume
               , ("<XF86AudioLowerVolume>", spawn "amixer -q set PCM 1+ unmute")
               -- XF86AudioRaiseVolume
               , ("<XF86AudioLowerVolume>", spawn "amixer -q set PCM 1- unmute")
             ]
