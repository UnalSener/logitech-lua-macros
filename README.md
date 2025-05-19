# logitech-lua-macros

Calibration & Custom Tuning
This macro is calibrated for a 1600 DPI mouse and an in-game sensitivity of 12 × 12.
If you use different values, you must adjust the horizontal and vertical compensation numbers yourself.
For example:

["Ash"] = {-1.00, 17.00}

-1.00 (left value) compensates horizontal recoil.
17.00 (right value) compensates vertical recoil.

These are the only numbers you need to tweak.

Step-by-step guide

1.Verify current settings
Make sure your mouse is at 1600 DPI and Rainbow Six Siege sensitivity is 12 H / 12 V.

2.Open the script
Locate the guns table that lists each operator’s weapon values.

3.Identify your weapon
Find the line that matches the operator or weapon you want to recalibrate.

4.Adjust the numbers

-First number → horizontal recoil compensation.

-Second number → vertical recoil compensation.
Increase or decrease each until the weapon stays on target in your setup.

5.Save & test in-game
Reload the script, jump into a custom match or the shooting range, and fine-tune as needed.

6.Document your changes
Add a brief comment next to the line (e.g., -- 3200 DPI @ 8/8 sens) so you remember why you changed it.