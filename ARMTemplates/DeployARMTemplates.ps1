Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "Visual Studio Premium with MSDN"

$rgName = "ifkhtestrg01"
New-AzureRmResourceGroup -Name $rgName -Location "West Europe"

#Storage Account
$storageAccountName = "ifkhtestdiagstorage01"
$storageAccountType = "Storage"
$StorageAccountSku = "Standard_LRS"
New-AzureRmResourceGroupDeployment -Name "StorageAccountdeployment" -ResourceGroupName $rgName -TemplateFile '.\Storage Account\StorageAccount.json' -StorageAccountName $storageAccountName -StorageAccountType $storageAccountType -StorageAccountSku $StorageAccountSku

#Virtual Network
$vnetName = "ifkhtestvnet01"
$vnetAddressSpace = "10.100.0.0/16"
$subnetName = "ifkhtestsubnet01"
$subnetAddressSpace = "10.100.0.0/24"
New-AzureRmResourceGroupDeployment -Name "vNetDeployment" -ResourceGroupName $rgName -TemplateFile '.\Virtual Network\VirtualNetwork.json' -vnetName $vnetName -vnetAddressSpace $vnetAddressSpace -subnetName $subnetName -subnetAddressSpace $subnetAddressSpace

#Log Analytics
$workspaceName = "ifkhtestla01"
$sku = "free"
New-AzureRmResourceGroupDeployment -Name "LogAnalyticsDeployment" -ResourceGroupName $rgName -TemplateFile '.\Log Analytics\LogAnalytics.json' -workspaceName $workspaceName -sku $sku

#Recovery Vault
$vaultName = "ifkhtestrv01"
$skuTier = "Standard"

#Virtual Machine
New-AzureRmResourceGroupDeployment -Name "VMdeployment" -ResourceGroupName $rgName -TemplateFile '.\Virtual Machine\VirtualMachine.json' -TemplateParameterFile '.\Virtual Machine\VirtualMachine.parameters.json'

