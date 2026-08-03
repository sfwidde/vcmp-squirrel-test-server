/*
 * https://github.com/sfwidde/vcmp-squirrel-test-server
 * Author: sfwidde ([SS]Kelvin)
 * 2025-02-14
 */

spawnWeapons <-
[
	WEP_BRASSKNUCKLES,
	WEP_KATANA,
	WEP_GRENADE,
	WEP_COLT45,
	WEP_STUBBY,
	WEP_M4,
	WEP_LASERSCOPE,
	WEP_M60,
	WEP_MP5
];

function onServerStart()
{
	local spawnPos = Vector(-657.743, 762.015, 11.6);

	SetSpawnPlayerPos(spawnPos);
	SetSpawnCameraPos(spawnPos - Vector(0.0, 2.5, 0.6));
	SetSpawnCameraLook(spawnPos);

	AddClass(255, RGB(255, 255, 255), 0, spawnPos, 2.3569, WEP_FIST, 0, WEP_FIST, 0, WEP_FIST, 0);
	AddClass(0, RGB(238, 130, 238), 165, spawnPos, 2.3569, WEP_FIST, 0, WEP_FIST, 0, WEP_FIST, 0);
	AddClass(1, RGB(119, 136, 153), 6, spawnPos, 2.3569, WEP_FIST, 0, WEP_FIST, 0, WEP_FIST, 0);

	spawnPos -= Vector(15.0, 13.65, 0.5);
	CreateVehicle(VEH_LANDSTALKER, spawnPos + Vector(5.0, 0.0, 0.0), 0.0, -1, -1);
	CreateVehicle(VEH_MAVERICK, spawnPos - Vector(5.0, 0.0, 0.0), 0.0, -1, -1);
	CreateVehicle(VEH_PCJ600, spawnPos, 0.0, -1, -1);
}

function onPlayerRequestClass(player, classId, teamId, skinId)
{
	player.Angle = 2.3569;
	return 1;
}

function onPlayerSpawn(player)
{
	foreach (weaponId in spawnWeapons)
	{
		player.SetWeapon(weaponId, 1000);
	}
}

function onPlayerChat(player, message)
{
	switch (message[0])
	{
	case ' ':
		try
		{
			compilestring(message.slice(1))();
		}
		catch (error)
		{
			ClientMessage("** pm >> " + error + ".", player, 255, 0, 0);
			return 0;
		}
	default:
		return 1;
	}
}
