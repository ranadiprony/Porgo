$ModuleManifestName = 'Porgo.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

Describe 'Module Tests' {
    It 'check module import' {
        Import-Module $ModuleManifestPath
        Get-Module Porgo | Should not BeNullOrEmpty
    }
    It 'check organize with date' {
        Import-Module $ModuleManifestPath
        group-withdate -source 'C:\Users\Manana\Desktop\dump'
        ls | Should not BeNullOrEmpty
    }
}

