-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMOBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbsoBTWFyayB0aGUgdGFyZ2V0IGFzIGhhdmluZyBhbHJlYWR5IGpvaW5lZCBGaXJlIEZvcmNlIChDb21wYW55IDEpIC0tIHByb21vdGVzIHRvIHRoZSBmaXJzdCByYW5rLCBzZWVkcyB0aGUgcmFuay1xdWVzdCBib2FyZCwgZ3JhbnRzIHRoZSBqb2luIGJ1ZmYgKyB0aXRsZSwgZXhhY3RseSBhcyBjb21wbGV0aW5nIHRoZSB0cmlhbCB3b3VsZCAoZGV2LW9ubHkpLgVHcm91cAVBZG1pbgRBcmdzBnNjcmlwdAtmb3JjZWpvaW5mZgNqZmYEVHlwZQZwbGF5ZXIGdGFyZ2V0NVBsYXllciB0byBlbnJvbGwgaW4gRmlyZSBGb3JjZSBhcyBhbiBleGlzdGluZyBtZW1iZXIuAAEEAAABAgAYowAAAOIABwCkAQkAAACAQE0BAboAAAAAMAEAugAAAAD/AQAAAgAAAG8CCgBvAwsAxQECAwEAAAAwAQAnAQAAAP8BAAABAAAA4gIQAMUBAgIBAAAAMAEA2wYAAACCAAIAEQMBAwIDAwMEAwUDBgMHCAUA/////wH/////AgMAAAAEBQAAAAb/////AwgEAACAQAMJAwoDCwMMAw0DDggDDA0AAAAADgAAAAIPAAAAAAEAARgAAAEAAAAAAAEAAAAAAAAAAwABAAD/AAABAAAAAADNldKbcGtLgMG1kYRFJpzkvY3F7/9RuJo=

-- https://lua.expert/
return {
	Description = "Mark the target as having already joined Fire Force (Company 1) -- promotes to the first rank, seeds the rank-quest board, grants the join buff + title, exactly as completing the trial would (dev-only).",
	Group = "Admin",
	Name = script.Name,
	Aliases = { "forcejoinff", "jff" },
	Args = {
		{
			Type = "player",
			Name = "target",
			Description = "Player to enroll in Fire Force as an existing member."
		}
	}
}