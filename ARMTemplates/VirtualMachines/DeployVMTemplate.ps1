Connect-AzureRmAccount

Get-AzureRmSubscription
Select-AzureRmSubscription -SubscriptionName "Visual Studio Premium with MSDN"

New-AzureRmResourceGroupDeployment -Name VmDeploy -ResourceGroupName TestRG -TemplateFile vm.json -TemplateParameterFile vm.parameters.json