# Implement your module commands in this script.

<#
.Synopsis
   Organize the files as per the last modified time
.DESCRIPTION
   Organize the files as per the last modified time
.EXAMPLE
   organize-withDate -source 'C:\Users\Manana\Desktop\dump'
.EXAMPLE
   Another example of how to use this cmdlet
#>
function group-FileDate
{
    [CmdletBinding()]
    Param
    (
        # source folder path
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $source,
        # destination folder path
        [Parameter(Position=1)]
        $destination
    )


If (-not (test-path $source -PathType Container))
{
write-output "Check whether the source path is a valid directory"
 
 }
 
 else
{
    if(!$destination){
        $destination = $source
    }else{
        if(-not (test-path $destination)){
            New-Item -Path $destination -Type Directory
        }
    }
$files = Get-ChildItem $source

foreach ($file in $files) {
 


$datestr= $file.lastwritetime.toshortdatestring().replace("/","-")
$folder=join-path -path $destination -ChildPath $datestr 
$fullpath=$folder +"\"+ $file.name

$fullpath
if(-not (test-path ($folder) -pathtype container))
{
New-Item $folder -type directory
}
$file.moveto($fullpath)
 }
 
 }

    }






# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*