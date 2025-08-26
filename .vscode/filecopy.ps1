[CmdletBinding()]
param (
	# Specifies a path to one or more locations.
	[Parameter(Mandatory=$true,
						 Position=0,
						 ParameterSetName="ParameterSetName",
						 ValueFromPipeline=$true,
						 ValueFromPipelineByPropertyName=$true,
						 HelpMessage="Path to one or more locations.")]
	[Alias("PSPath")]
	[ValidateNotNullOrEmpty()]
	[string[]]
	$PathToCopy
)

& .vscode/rclone.exe copy "$PathToCopy" "../FactorioSpaceAge/mods" --exclude ".**" --exclude "/py**" --exclude "/stdlib**" -v