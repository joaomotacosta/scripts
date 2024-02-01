# Define the ASCII characters to include in the password
$characters = [char[]]([char]33..[char]126)

# Set the password length (30 characters in this case)
$length = 30

# Initialize the password variable
$password = ""

# Create a random password
for ($i = 1; $i -le $length; $i++) {
    $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
    $password += $characters[$randomIndex]
}

# Copy the generated password to the clipboard
$password | Set-Clipboard

# Display the generated password
Write-Host "Generated Password: $password"
Write-Host "Password copied to clipboard."