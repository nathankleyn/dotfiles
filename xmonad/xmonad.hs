-- Imports.
import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig
import XMonad.Util.Loggers

---
-- The main function.
main = xmonad =<< xmobarFn

---
-- Xmobar
-- This is the toolbar that sits at the top of the main X screen.
xmobarFn = (statusBar "xmobar" xmobarPretty xmobarToggleKey xmonadConfig)

xmobarHighlight = "#eee8d5"
xmobarHidden = "#839496"
xmobarDisabled = "#073642"

-- These are options that are passed to Xmobar when it's started up. We define
-- nice colours here.
xmobarPretty = xmobarPP {
        ppTitle = xmobarColor xmobarHidden "" . shorten 100,
        ppCurrent = xmobarColor xmobarHighlight "",
        ppVisible = xmobarColor xmobarHidden "",
        ppHidden = xmobarColor xmobarHidden "",
        ppHiddenNoWindows = xmobarColor xmobarDisabled ""
       }

-- This is the key that can be used to toggle the visibility of the Xmobar
-- at the top of the screen. In this case, it's <Mod>+b
xmobarToggleKey XConfig {
                  XMonad.modMask = modMask
                } = (modMask, xK_b)

---
-- The XMonad configuration.
-- This is an object setup using record syntax that contains a boat load of
-- things you can customise. Each of them are detailed below.
gConfig = gnomeConfig {
            -- Use the Windows key as the modifier for shortcuts.
            modMask = mod4Mask,
            -- Set the border colour for unfocused windows.
            normalBorderColor = "#FFF",
            -- And the border colour for focused windos.
            focusedBorderColor = "#000",
            -- The width of the borders around windows.
            borderWidth = 0,
            -- When an event takes place, we can define a callback to be
            -- triggered on receipt of this. In our case, we want to handle
            -- full screening things like Chromium and Flash properly.
            handleEventHook = fullscreenEventHook,
            -- Set the terminal that is opened when the <Mod>+<Enter> shortcut
            -- is pressed.
            terminal = "xterm -u8"
          }

xmonadKeyMap = [
           -- Mute key
           -- Either the correct Fn key, or <Mod>+<Backspace>
             ("<XF86AudioMute>", spawn "amixer -q set Master toggle")
           , ("M-<Backspace>", spawn "amixer -q set Master toggle")
           -- Volume up key
           -- Either the correct Fn key, or <Mod>+<Up>
           , ("<XF86AudioRaiseVolume>", spawn "amixer -q set Master 1%+ unmute")
           , ("M-<Up>", spawn "amixer -q set Master 1%+ unmute")
           -- Volume lower key
           -- Either the correct Fn key, or <Mod>+<Down>
           , ("<XF86AudioLowerVolume>", spawn "amixer -q set Master 1%- unmute")
           , ("M-<Down>", spawn "amixer -q set Master 1%- unmute")
         ]

-- Define the configuration.
xmonadConfig = gConfig `additionalKeysP` xmonadKeyMap
