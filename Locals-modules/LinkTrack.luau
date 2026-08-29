-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMbBExpbmsGUGFyZW50DV9sb2NhbFdvcmxkQ0YKVmlzdWFsUGFydARUeXBlBFBhcnQFTW9kZWwKQXR0YWNobWVudAhMaW5rTW9kZQpSaWdpZExvY2FsE19yaWdpZExvY2FsUGFyZW50Q0YGQ0ZyYW1lA25ldxFyZXNvbHZlTGlua0NGcmFtZQhCYXNlUGFydANJc0ENVG9PYmplY3RTcGFjZQZGb2xsb3cFUGl2b3QIUG9zaXRpb24TV2VsZFdpdGhvdXRSb3RhdGlvbhJWZWN0b3JUb1dvcmxkU3BhY2UHUGl2b3RUbwtSZWFwcGx5TGluawdyZXF1aXJlBnNjcmlwdA1QYXJ0Q29uc3RhbnRzAAMNAgEAAACdAU0CAdMAAAAAKwIBAIIAAQBNAwIkAQAAACsDBADGAwAAMAMB0wAAAACCAAEATQMBrwIAAAArAwEAggABAE0EAa4DAAAADgQFAE0EAa4DAAAATQQEJAEAAAArBAEAggABAE0EAREEAAAA8AQGAAUAAADwBAQABgAAAPAEAgAHAAAAggABAPAEPQAHAACATQUBrgMAAABNBQUkAQAAACsFAQCCAAEATQcBEQgAAADwBwgACQAAgE0GAUsKAAAAKwYJAKQGDQAAMLCAnwYBAisGBQD7BgAATQYGWQ4AAABSBwIAnwYCAm8KDwC8CAX+EAAAAJ8IAwIOCAMATQcFhQsAAAArBwMApAcNAAAwsICfBwECUgoGALwIB0YRAAAAnwgDAsYJAABNCgERCAAAAPAKBQASAAAATQoBEQgAAADwCggAEwAAgKQKDQAAMLCATQsIOxQAAACfCgICUgkKAGUAAQBSCQgATQoBrgMAAAAJCwkDMAsKhQsAAACCAAEATQYBEQgAAADwBggACQAAgE0FAUsKAAAAKwUJAKQFDQAAMLCAnwUBAisFBQD7BQAATQUFWQ4AAABSBgIAnwUCAk0GBTsUAAAATQcBEQgAAADGCAAA8AcPABUAAIBNCwM7FAAAALwJBa4WAAAAnwkDAk0LAzsUAAAAJgoDC6QLDQAAMLCAQwwGCZ8LAgIJCAsKZQALAPAHAwASAAAA8AcHABMAAICkCQ0AADCwgFIKBgCfCQICCQgJA2UAAQAJCAUD8AQIAAYAAIBNCQGuAwAAAFILCAC8CQnCFwAAAJ8JAwGCAAEATQkBrgMAAAAwCAmFCwAAAIIAAQAYAwEDAgMDAwQDBQMGAwcDCAMJAwoDCwMMAw0EADCwgAMOAw8DEAMRAxIDEwMUAxUDFgMXAA8YARgAAAEABQAAAQAAAQIAAQABAAAAAAAAAAABAAEAAAAAAAACAAEAAAABAAMAAAABAAAAAAAAAQAAAAABAAAAAAAAAAAAAAEAAAABAQAAAAAAAAABAAAAAAAAAgIAAAAAAQUAAAABAAAAAAAAAQAAAAABAAIAAQEAAgAAAAABAAABAAAAAAABAAAAAQAAAAAAAgMAAQAAAAAAAAIAAAACEAAAAAACAQEAAAAFwAEAABICAAAwAQBqAQAAAIIAAQACBgADGAEACgABGAAAAABADwAAAAACAAABAgANowAAAKQAAQAAAABApAEDAAAAIEBNAQEkBAAAAE0BAUoFAAAAnwACAsABBgASAAAAggECAAcDGQQAAABAAxoEAAAgQAMCAxsGAQEBAQABGAAHAAAAAAAAAAACAAABAAAAAAJ6XVTjruLdeaXJn2UK9iDaCkVDl0iZPuI=

-- https://lua.expert/
local PartConstants = require(script.Parent.PartConstants)

return function(p1) --[[ Line: 10 | Upvalues: PartConstants (copy) ]]
	function p1.ReapplyLink(p1, p2) --[[ ReapplyLink | Line: 15 | Upvalues: PartConstants (ref) ]]
		local Link = p2.Link

		if not Link then
			return
		end

		if not Link.Parent then
			p2.Link = nil

			return
		end

		local _localWorldCF = p2._localWorldCF

		if not _localWorldCF then
			return
		end

		if not (p2.VisualPart and p2.VisualPart.Parent) then
			return
		end

		local Type = p2.Type

		if Type ~= "Part" and (Type ~= "Model" and Type ~= "Attachment") then
			return
		end

		if Type == "Attachment" then
			local v1 = p2.VisualPart.Parent

			if not v1 then
				return
			end

			local v2 = p2.LinkMode == "RigidLocal" and (p2._rigidLocalParentCF or CFrame.new()) or PartConstants.resolveLinkCFrame(Link)
			local v4 = (v1:IsA("BasePart") and v1.CFrame or CFrame.new()):ToObjectSpace(v2)

			p2.VisualPart.CFrame = (if p2.LinkMode == "Follow" or p2.LinkMode == "Pivot" then CFrame.new(v4.Position) else v4) * _localWorldCF
		else
			local v7 = p2.LinkMode == "RigidLocal" and (p2._rigidLocalParentCF or CFrame.new()) or PartConstants.resolveLinkCFrame(Link)
			local Position = v7.Position
			local LinkMode = p2.LinkMode
			local v8

			if LinkMode == "WeldWithoutRotation" then
				local v9 = v7:VectorToWorldSpace(_localWorldCF.Position)

				v8 = CFrame.new(Position + v9) * (_localWorldCF - _localWorldCF.Position)
			else
				v8 = if LinkMode == "Follow" or LinkMode == "Pivot" then CFrame.new(Position) * _localWorldCF else v7 * _localWorldCF
			end

			if Type == "Model" then
				p2.VisualPart:PivotTo(v8)
			else
				p2.VisualPart.CFrame = v8
			end
		end
	end
end