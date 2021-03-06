INSERT INTO Language_xx_XX
			(Tag,													Text)
SELECT		'TXT_KEY_PROMOTION_ARMY_SUPPORT',						'Pirate Ship' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_SUPPORT_HELP',					'Before engaging in naval melee combat, this unit has an extra attack' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_ON_SHIP',						'Military Unit on Ship' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_ON_SHIP_HELP',					'This unit is cargo and can unload from Ship to Land only.' UNION ALL
SELECT		'TXT_KEY_SPECIALUNIT_CARGO_ARMY',						'Army Cargo Unit' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_RANGE_PENALTY',					'Ranged Naval Penalty' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_RANGE_PENALTY_HELP',			'-25% [ICON_STRENGTH] Ranged Strength and -1 Range when using Ranged Attacks' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_SCOUT_SHIP',					'Recon Unit on Ship' UNION ALL
SELECT		'TXT_KEY_PROMOTION_ARMY_SCOUT_SHIP_HELP',				'+2 Visibility Range' UNION ALL
SELECT		'TXT_KEY_PROMOTION_POLYNESIA_CARGO',					'Polynesia Cargo Ship Movement' UNION ALL
SELECT		'TXT_KEY_PROMOTION_POLYNESIA_CARGO_HELP',				'+1 Extra Movement for Naval Units with Land Cargo' UNION ALL
SELECT		'TXT_KEY_ARMY_CARGO_UNIT_1',							'[NEWLINE]Can carry 1 Land Unit.' UNION ALL
SELECT		'TXT_KEY_ARMY_CARGO_UNIT_2',							'[NEWLINE]Can carry 2 Land Units.' UNION ALL
SELECT		'TXT_KEY_ARMY_CARGO_UNIT_3',							'[NEWLINE]Can carry 3 Land Units.' UNION ALL
SELECT		'TXT_KEY_ARMY_CARGO_UNIT_4',							'[NEWLINE]Can carry 4 Land Units.'
WHERE EXISTS (SELECT * FROM CustomModOptions WHERE Name='CARGO_SHIPS' AND Value= 1 );

UPDATE Language_xx_XX 
SET Text = Text||(SELECT ' '||Text FROM Language_xx_XX WHERE Tag = 'TXT_KEY_ARMY_CARGO_UNIT_1')
WHERE Tag IN (SELECT Help FROM Units WHERE SpecialCargo = 'SPECIALUNIT_CARGO_ARMY' AND Type IN (SELECT UnitType FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_CARGO_I')) AND EXISTS (SELECT * FROM CustomModOptions WHERE Name='CARGO_SHIPS' AND Value= 1 );

UPDATE Language_xx_XX 
SET Text = Text||(SELECT ' '||Text FROM Language_xx_XX WHERE Tag = 'TXT_KEY_ARMY_CARGO_UNIT_2')
WHERE Tag IN (SELECT Help FROM Units WHERE SpecialCargo = 'SPECIALUNIT_CARGO_ARMY' AND Type IN (SELECT UnitType FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_CARGO_II')) AND EXISTS (SELECT * FROM CustomModOptions WHERE Name='CARGO_SHIPS' AND Value= 1 );

UPDATE Language_xx_XX 
SET Text = Text||(SELECT ' '||Text FROM Language_xx_XX WHERE Tag = 'TXT_KEY_ARMY_CARGO_UNIT_3')
WHERE Tag IN (SELECT Help FROM Units WHERE SpecialCargo = 'SPECIALUNIT_CARGO_ARMY' AND Type IN (SELECT UnitType FROM Unit_FreePromotions WHERE PromotionType = 'PROMOTION_CARGO_III')) AND EXISTS (SELECT * FROM CustomModOptions WHERE Name='CARGO_SHIPS' AND Value= 1 );