# Connect to the Intune Graph API
Connect-MSGraph

# Import the CSV file
$devices = Import-Csv -Path "C:\devices.csv"

foreach ($device in $devices) {
    # Create the device object
    $intuneDevice = New-Object -TypeName Microsoft.Graph.Device
    $intuneDevice.SerialNumber = $device.SerialNumber
    $intuneDevice.EnrollmentType = "CompanyOwnedNoUserAffinity"

    # Enroll the device in Intune
    $enrollmentResult = Invoke-MSGraphRequest -HttpMethod POST -Url "/devices" -Body $intuneDevice

    # Check the enrollment status
    if ($enrollmentResult.Status -eq "success") {
        Write-Output "Device enrolled successfully"
    } else {
        Write-Output "Error enrolling device: $($enrollmentResult.ErrorCode) - $($enrollmentResult.Message)"
    }
}
