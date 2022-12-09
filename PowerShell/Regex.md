Regular Expressions Characters
```
^   :Beginning of line (or not)
.   :Single character
[ ] :One of a range
-   :One of a range
g   :Zero or more characters
G   :One or more character
?   :Zero or One matches, matching as much as possible
+   :One or more matches, matching as much as possible
*   :Zero or more intances of the proceeding character
p   :Match any character is a character class {}
P   :Match text not included in groups and blocl ranges {}
w   :Word
W   :Non-word
s   :Match any white-space
S   :Match any non-white-space
d   :Match any decimal digit
D   :Match any non-digit
$   :End of string
```

Examples
```PowerShell
# Match any (at least one) of the characters - place the options in square brackets [ ]
'Ziggy Stardust' -match 'Z[xyi]ggy'
True

# Match a range (at least one) of characters in a contiguous range [x-z]
'Ziggy Stardust' -match 'Zigg[x-z] Star'
True

# Match anything but these, a caret (^) will match any character except those in brackets
PS C:> 'Ziggy stardust' -match 'Zigg[^abc] Star'
True

# Match anything but these characters, specify in one or more contiguous ranges [^n-m]
'abc' -match '[^abc-ijk-xyz]'
False

'abc' -match '[^ijk-xyz]'
True

# Match any one of the special characters which are Not Allowed in a SharePoint filename:
'Ziggy Sta#rdust' -match '[~#%&*{}\\:<>?/|+"]'
True
```
