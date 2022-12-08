# Simple code snippet to generate random user account Ids for lab testing.
$count = 10 # Number of account IDs to generate
$min = 111111 # Starting number
$max = 999999 # Ending number

$arr = @('a','c','m','x') # Array of First letter for ID

# Run
for ($i =0; $i -lt $count; $i++)
{
    (($arr) | Get-Random -Count 1 | % {[char]$_}) + (Get-random -Min $min -Maximum $max)
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
