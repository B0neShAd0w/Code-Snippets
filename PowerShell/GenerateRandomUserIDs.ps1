# Simple code snippet to generate random AD user account IDs for lab testing.
$count = 10 # Number of IDs to generate
$letterLength = 1 # Number of letters
$numberLength = 6 # Number of numbers after letter

$arr = @('a','c','m','x') # Array of First letter for ID

# Run
for ($i =0; $i -lt $count; $i++)
{
    -join ((($arr) | Get-Random -Count $letterLength | % {[char]$_})) + -join ((48..57)| Get-Random -Count $numberLength | % {[char]$_})
}

# Example output
x669570
a351037
c272756
x984260
c431694
a597596
c663235
x606942
m346915
c608987
