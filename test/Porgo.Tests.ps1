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
        It 'check Error handling of invalid path' {
        Import-Module $ModuleManifestPath
        group-filedate -source 'C:\Users\Manana\Desktop\dumpxxx' -destination 'C:\Users\Manana\Desktop\dumper' | 
        Should be 'Check whether the source path is a valid directory'
    }
    It 'check organize with date' {
        Import-Module $ModuleManifestPath
        group-filedate -source 'C:\Users\Manana\Desktop\dump' -destination 'C:\Users\Manana\Desktop\dumper'
        Get-ChildItem 'C:\Users\Manana\Desktop\dumper' | Should not BeNullOrEmpty
    }
}

