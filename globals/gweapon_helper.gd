extends Node

var BulletScene:PackedScene = preload(GConstants.ScenePaths.Bullet)

var m_firers = {}

func p_get_firer(weaponKind: Enums.WeaponKinds) -> IWeaponFire:
	if m_firers.has(weaponKind) :
		return m_firers.get(weaponKind)
	
	var iweapon_fire:IWeaponFire
	match weaponKind:
		Enums.WeaponKinds.Straight:
			iweapon_fire = StraightWeaponFire.new()
		Enums.WeaponKinds.Circle:
			iweapon_fire = CircleWeaponFire.new()
		Enums.WeaponKinds.Sector:
			iweapon_fire = SectorWeaponFire.new()
	
	m_firers[weaponKind] = iweapon_fire
	return iweapon_fire
	

func p_get_random_weapon() -> IWeapon:
	var weaponKind:Enums.WeaponKinds = randi_range(0, 2)
	var iweapon:IWeapon = new_weapon(weaponKind)
	iweapon.p_init_random(BulletScene)
	return iweapon

func new_weapon(weaponKind:Enums.WeaponKinds) -> IWeapon:
	var iweapon:IWeapon
	match weaponKind:
		Enums.WeaponKinds.Straight:
			iweapon = StraightWeapon.new()
		Enums.WeaponKinds.Circle:
			iweapon = CircleWeapon.new()
		Enums.WeaponKinds.Sector:
			iweapon = SectorWeapon.new()
	return iweapon
