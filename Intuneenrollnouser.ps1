# Connect to the Intune Graph API
using System.ComponentModel;
using System;

Connect - MSGraph

# Get the device serial number
$serialNumber = Read - Host - Prompt "Enter the device serial number"

# Create the device object
$device = New - Object - TypeName Microsoft.Graph.Device
$device.SerialNumber = $serialNumber
$device.EnrollmentType = "CompanyOwnedNoUserAffinity"

# Enroll the device in Intune
$enrollmentResult = Invoke - MSGraphRequest - HttpMethod POST - Url "/devices" - Body $device

# Check the enrollment status
if ($enrollmentResult.Status - eq "success") {
    Write - Output "Device enrolled successfully"
} else
{
    Write - Output "Error enrolling device: $($enrollmentResult.ErrorCode) - $($enrollmentResult.Message)"
}
