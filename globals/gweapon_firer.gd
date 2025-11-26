class_name GWeaponFirer
extends Node

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
