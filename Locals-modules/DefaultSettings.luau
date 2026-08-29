-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMRB0RhbXBpbmcJU3RpZmZuZXNzB0luZXJ0aWEKRWxhc3RpY2l0eQtCbGVuZFdlaWdodAZSYWRpdXMLQW5jaG9yRGVwdGgFRm9yY2UHR3Jhdml0eQ1XaW5kRGlyZWN0aW9uCVdpbmRTcGVlZAxXaW5kU3RyZW5ndGgNV2luZEluZmx1ZW5jZQ1BbmNob3JzUm90YXRlClVwZGF0ZVJhdGUSQWN0aXZhdGlvbkRpc3RhbmNlEFRocm90dGxlRGlzdGFuY2UAAQEAAAECAAOjAAAA4gAeAIIAAgAfAwECmpmZmZmZuT8DAgKamZmZmZnJPwMDAgAAAAAAAAAAAwQCAAAAAAAA4D8DBQIAAAAAAADwPwMGAwcDCAcAAAAAzcxMPgAAAAAAAAAAAwkHAAAAgAAAgL8AAACAAAAAgAMKBwAAgL8AAACAAAAAgAAAAIADCwIAAAAAAAAgQAMMAw0DDgEAAw8CAAAAAAAATkADEAIAAAAAAIBGQAMRAgAAAAAAAC5ACBEAAQAAAAIDAAAABAUAAAAGBwAAAAgJAAAACgMAAAALBQAAAAwNAAAADg8AAAAQEQAAABITAAAAFAkAAAAVCQAAABYXAAAAGBkAAAAaGwAAABwdAAAAAAEAARgAAgABAAAAAADnzIYhgOxXPIawtqjb3GL7l9SRVdUI7CA=

-- https://lua.expert/
return {
	Damping = 0.1,
	Stiffness = 0.2,
	Inertia = 0,
	Elasticity = 0.5,
	BlendWeight = 1,
	Radius = 0.2,
	AnchorDepth = 0,
	Force = Vector3.new(0, 0.2, 0),
	Gravity = Vector3.new(-0, -1, -0),
	WindDirection = Vector3.new(-1, -0, -0),
	WindSpeed = 8,
	WindStrength = 1,
	WindInfluence = 1,
	AnchorsRotate = false,
	UpdateRate = 60,
	ActivationDistance = 45,
	ThrottleDistance = 15
}