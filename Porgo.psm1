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
function group-withDate
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # source folder path
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $source
    )

$test=test-path $source
If ($test -eq  $false)
{
write-output "The folder does not exist"
 
 }
 
 else
{
$files = Get-ChildItem $source

foreach ($x in $files) {
 


$datestr= $x.lastwritetime.toshortdatestring().replace("/","-")
$folder=$source +"\"+ $datestr 
$fullpath=$source +"\"+ $datestr +"\"+ $X.name

$fullpath
if(test-path ($folder) -pathtype container)
{
$x.moveto($fullpath)
}
else
{
New-Item $folder -type directory
$x.moveto($fullpath)

}

 }
 
 }

    }


# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*