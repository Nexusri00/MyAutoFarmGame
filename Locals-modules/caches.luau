-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- CQMgBXZhbHVlDFRyYW5zcGFyZW5jeQhBbmNob3JlZAhDYW5RdWVyeQpDYW5Db2xsaWRlEEZvcmdlTW91c2VJZ25vcmUOQ29sbGlzaW9uR3JvdXAWQXNzZW1ibHlMaW5lYXJWZWxvY2l0eRdBc3NlbWJseUFuZ3VsYXJWZWxvY2l0eQZQYXJlbnQQQ2xlYXJBbGxDaGlsZHJlbgdvbl9mcmVlB2Rlc3Ryb3kISW5zdGFuY2UDbmV3BFBhcnQGTG9ja2VkBkZvbGRlciJET19OT1RfUkVNT1ZFX0ZvcmdlU2hhcmVkUGFydENhY2hlBE5hbWUKQXJjaGl2YWJsZQl3b3Jrc3BhY2UHVGVycmFpbg1wcm90ZWN0UGFyZW50BHNpemULc2hhcmVkX3BhcnQFdGFibGUGaW5zZXJ0BGluaXQHcmVxdWlyZRIuLi9vYmovT2JqZWN0Q2FjaGUOLi4vbW9kL3V0aWxpdHkABAQBAQAAAB5NAQDMAAAAAIwCAQAwAgHZAQAAAKkCAQAwAgFFAgAAAKkCAAAwAgFiAwAAAKkCAAAwAgHTBAAAAG8CBQAwAgEUBgAAAG8CBwAwAgEXCAAAAG8CBwAwAgFQCQAAAPsCAAAwAgEkCgAAALwCAaELAAAAnwICAYIAAQAMAwEDAgMDAwQDBQMGAwcHAAAAAAAAAAAAAAAAAAAAAAMIAwkDCgMLABsMARgAAAIAAAIAAAEAAAEAAAIAAAIAAAEAAAIAAAUAAAEcAAAAAAIAAQAAAAX7AAAAvAAAMAAAAACfAAIBggABAAEDDQA3AAEYAAAAAAE4AAAAAAkBAgAABgMAAAUBBEPGAQAApAICAAAEAIBvAwMAnwICAowDAQAwAwLZBAAAAKkDAQAwAwJFBQAAAKkDAAAwAwLTBgAAAKkDAAAwAwJiBwAAAKkDAQAwAwKsCAAAAKQDAgAABACAbwQJAJ8DAgJvBAoAMAQDugsAAACpBAAAMAQDbgwAAACkBA4AAADQQE0EBFQPAAAAMAQDJBAAAAD7BAAATQQEjhEAAABSBQAAUgYDAJ8EAwH7BAEATQQE7wEAAABSBQIAUgYDAOIHFQDZCAAAEgADADAIB9EUAAAAnwQEAlIBBADiAhcAMAEClRYAAADZBQEAEgEB/540AAQFAAAAUgQAAKQDGgAAZICBnwMDAcEBAACCAgIAGwMOAw8EAAQAgAMQAwIDAwMFAwQDEQMSAxMDFAMVAxYEAADQQAMXAwoDGAMZAgAAAAAAwGJAAwwIAhITAAAAFP////8DGgUBFgMbAxwEAGSAgQIAAQcdARgAAwAAAAEAAAEAAAEAAAEAAAEAAAIAAAABAAABAAABAAAAAAACAAAAAAACAAAAAAACAAAA/gAaAQADAAAAAAAAAAQACAAAAAAEAAABAgARowAAAKQAAQAAAABAbwECAJ8AAgKkAQEAAAAAQG8CAwCfAQIC/wIBAAAAAADAAwQAEgABABIAAAAwAwITBQAAAIICAgAGAx4EAAAAQAMfAyAGAgMdAQIBAAEYAAAAAAACAAAAAgACAAAAADcBAAAAAAPpg5TG+byx5+d70zcTeCJ9mZuDsttH/sc=

-- https://lua.expert/
local v1 = require("../obj/ObjectCache")
local v2 = require("../mod/utility")

return {
	init = function(p1) --[[ init | Line: 7 | Upvalues: v2 (copy), v1 (copy) ]]
		local Part = Instance.new("Part")

		Part.Transparency = 1
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.Locked = true

		local DO_NOT_REMOVE_ForgeSharedPartCache = Instance.new("Folder")

		DO_NOT_REMOVE_ForgeSharedPartCache.Name = "DO_NOT_REMOVE_ForgeSharedPartCache"
		DO_NOT_REMOVE_ForgeSharedPartCache.Archivable = false
		DO_NOT_REMOVE_ForgeSharedPartCache.Parent = workspace.Terrain
		v2.protectParent(p1, DO_NOT_REMOVE_ForgeSharedPartCache)

		local v12 = v1.new(Part, DO_NOT_REMOVE_ForgeSharedPartCache, {
			size = 150,
			on_free = function(p1) --[[ on_free | Line: 27 | Upvalues: DO_NOT_REMOVE_ForgeSharedPartCache (copy) ]]
				local value = p1.value

				value.Transparency = 1
				value.Anchored = true
				value.CanQuery = false
				value.CanCollide = false
				value.CollisionGroup = "ForgeMouseIgnore"
				value.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				value.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
				value.Parent = DO_NOT_REMOVE_ForgeSharedPartCache
				value:ClearAllChildren()
			end
		})
		local t = {
			shared_part = v12
		}

		local function f2() --[[ Line: 55 | Upvalues: v12 (ref) ]]
			v12:destroy()
		end

		table.insert(p1, f2)

		return t
	end
}