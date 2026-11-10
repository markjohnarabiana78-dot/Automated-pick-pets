
-- Garden System
-- Place this Script inside ServerScriptService

local garden = Instance.new("Part")
garden.Name = "MyGarden"
garden.Size = Vector3.new(12, 1, 12)
garden.Position = Vector3.new(0, 0, 0)
garden.Anchored = true
garden.Color = Color3.fromRGB(80, 170, 70)
garden.Parent = workspace

local petTypes = {"Dog", "Cat", "Bird"}
local random = Random.new()

local petsFolder = Instance.new("Folder")
petsFolder.Name = "GardenPets"
petsFolder.Parent = workspace

local function generatePet(petType)
    local pet = Instance.new("Part")
    pet.Name = "Pet_" .. petType
    pet.Size = Vector3.new(1, 1, 1)
    pet.Anchored = true
    pet.CanCollide = false
    pet.Color = Color3.fromRGB(50, 190, 100)

    local halfX = garden.Size.X / 2 - 1
    local halfZ = garden.Size.Z / 2 - 1

    pet.Position = Vector3.new(
        garden.Position.X + random:NextNumber(-halfX, halfX),
        garden.Position.Y + 1,
        garden.Position.Z + random:NextNumber(-halfZ, halfZ)
    )

    pet.Parent = petsFolder

    local clickDetector = Instance.new("ClickDetector")
    clickDetector.MaxActivationDistance = 20
    clickDetector.Parent = pet

    clickDetector.MouseClick:Connect(function(player)
        print(player.Name .. " picked up " .. petType)
        pet:Destroy()
    end)

    return pet
end

for _, petType in ipairs(petTypes) do
    generatePet(petType)
end

print("Garden initialized! 3 pets generated.")
