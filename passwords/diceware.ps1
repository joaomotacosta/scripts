# Define the path to your diceware word list file
$dicewareFile = "diceware.txt"

# Read the diceware word list from the file, splitting on tabs and selecting words
$dicewareWords = @{}
Get-Content -Path $dicewareFile | ForEach-Object {
    $parts = ($_ -split "`t")
    $diceResult = $parts[0]
    $word = $parts[1].Trim()
    $dicewareWords[$diceResult] = $word
}

# Set the number of words in the passphrase
$wordCount = 6

# Initialize the passphrase variable
$passphrase = ""

# Function to simulate rolling a single die
function Get-RandomDieResult {
    Get-Random -Minimum 1 -Maximum 7
}

# Generate a passphrase with 6 words based on rolling "5 dice" for each word
for ($i = 1; $i -le $wordCount; $i++) {
    $diceResult = ""
    for ($j = 1; $j -le 5; $j++) {
        $diceResult += Get-RandomDieResult
    }
    
    $word = $dicewareWords[$diceResult]
    $word = $word.Substring(0,1).ToUpper() + $word.Substring(1)  # Capitalize the first letter
    $passphrase += "$word"

    # Add random numbers between words (except for the last word)
    if ($i -ne $wordCount) {
        $passphrase += (Get-Random -Minimum 0 -Maximum 10).ToString()
        $passphrase += " "
    }
}

# Copy the generated passphrase to the clipboard
$passphrase | Set-Clipboard

# Display the generated passphrase
Write-Host "Generated Passphrase: $passphrase"
Write-Host "Passphrase copied to clipboard."