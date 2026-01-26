targetScope = 'resourceGroup'

@description('Location for all resources')
param location string = resourceGroup().location

@description('Prefix for naming (keep consistent with your platform deployment)')
param namePrefix string

@description('Tags applied to resources')
param tags object = {}

@description('Name of the hub VNet to deploy the VM into')
param vnetName string

@description('Subnet name to place the VM NIC into (recommend: snet-powerplatform)')
param subnetName string = 'snet-powerplatform'

@description('Virtual machine name')
param vmName string = '${namePrefix}-testvm'

@description('VM size')
param vmSize string = 'Standard_B2s'

@description('Admin username')
param adminUsername string = 'azureuser'

@description('SSH public key (one-line OpenSSH format)')
param sshPublicKey string

var subnetId = resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)

resource nic 'Microsoft.Network/networkInterfaces@2023-11-01' = {
  name: '${vmName}-nic'
  location: location
  tags: tags
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          privateIPAllocationMethod: 'Dynamic'
          // No public IP: validate private DNS/Private Link from inside Azure.
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2024-03-01' = {
  name: vmName
  location: location
  tags: tags
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: sshPublicKey
            }
          ]
        }
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

output subnetResourceId string = subnetId
output vmResourceId string = vm.id
output vmName string = vm.name
