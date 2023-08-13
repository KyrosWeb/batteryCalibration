# Battery Calibration Tool
With this tool you'll be able to calibrate your battery using the actuallymentor/battery tool that you can easily download at https://github.com/actuallymentor/battery

# How it works
First of all, this tool will discharge your battery until it reaches 15%.
When the 15% is reached, it will fully recharge the battery and keep it at 100% for 1 hour.Finally the battery will be discharged until it reaches 80% and will be kept on this percentage.

# How to use it
Download the script, move it in your favourite folder giving it the needed permissions.

```bash
chmod a+x /folder/to/calibration.sh
```
and execute it like a normal script

```bash
./calibration.sh
```

# When to run this script
If you use your Mac always plugged in a wall socket and you have the maintainment set to 80%, I advise you to use this tool every three months.
