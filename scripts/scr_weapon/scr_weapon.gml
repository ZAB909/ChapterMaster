global.weapons={
    "Ranger Long Rifle":{
        "abbreviation": "RangeLoRife",
        "description":"Advanced and accurate rifles from mars given to skitarii sharpshooters",
        "attack": {
          "standard": 60,
          "master_crafted": 70,
          "artifact": 90
        },
        "ranged_hands": 2,
        "range": 25,
        "tags":["las", "rifle", "precision"],
    },
  "Choppa": {
    "abbreviation": "Chop",
    "attack": {
      "standard": 28,
      "master_crafted": 32,
      "artifact": 36
    },
    "melee_hands": 1,
    "range": 1,
    "spli": 1, 
    "tags":["axe"]
  },
  "Snazzgun": {
    "abbreviation": "Snazz",
    "attack": {
      "standard": 80,
      "master_crafted": 92,
      "artifact": 104
    },
    "ranged_hands": 2,
    "ammo": 20,
    "range": 3.1,
    "spli": 1,
    "arp": 0,
    "tags":["rifle"]
  },
  "Shuriken Pistol": {
    "abbreviation": "ShurikP",
    "attack": {
      "standard": 25,
      "master_crafted": 28,
      "artifact": 31
    },
    "melee_hands": 1,
    "ranged_hands": 0,
    "ammo": 6,
    "range": 2.1,
    "spli": 1,
    "arp": 0,
    "tags":["pistol"]
  },
  "Storm Shield": {
    "description":"Protects twice as well when boarding. A powered shield that must be held with a hand.  While powered by the marines armour it shimmers with blue energy.",
    "abbreviation": "StrmShld",
    "attack": {
      "standard": 5,
      "master_crafted": 5,
      "artifact": 10
    },
    "armour_value": {
        "standard": 8,
        "master_crafted": 10,
        "artifact": 12
    } ,
    "melee_hands": 0.9,
    "ranged_hands":1,
    "tags":["shield"],
    "hp_mod":{
      "standard": 30,
      "master_crafted": 35,
      "artifact": 40
    },
  },
  "Boarding Shield": {
    "description":"Protects twice as well when boarding. Used in siege or boarding operations, this shield offers additional protection.  It may be used with a 2-handed ranged weapon.",    
    "abbreviation": "BrdShld",
    "armour_value": {
        "standard": 4,
        "master_crafted": 5,
        "artifact": 6
    } ,
    "melee_hands": 0.9,
     "tags":["shield"],
    "hp_mod":{
      "standard": 15,
      "master_crafted": 17.5,
      "artifact": 20
    },        
  },
  "Hellgun": {
    "abbreviation": "HllGun",
    "attack": {
      "standard": 30,
      "master_crafted": 34,
      "artifact": 38
    },
    "ammo": 10,
    "range": 6.1,
    "spli": 1,
    "arp": 0,
    "tags":[],
    "ranged_hands":2,
    "tags":["arcane"],
    // ... (other attributes)
  },
  "Hellrifle": {
    "description":"Normally used by Radical Inquisitors, it appears an antiquated rifle but fires razor-sharp shards of Daemonic matter.",
    "abbreviation": "HllRifle",
    "attack": {
      "standard": 150,
      "master_crafted": 160,
      "artifact": 170
    },
    "ammo": 10,
    "range": 6.1,
    "spli": 1,
    "arp": 0,
    "tags":["rifle","arcane"],
    "ranged_hands":2,    
    // ... (other attributes)
  },
    "Archeotech Laspistol": {
        "attack": {
            "standard": 120,
            "master_crafted": 130,
            "artifact": 140
        },
        "description": "Known as a Lasrod or Gelt Gun, this pistol is an ancient design of Laspistol with much greater range and power.",
        "abbreviation": "ArchLpstl",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 3.1,
        "spli": 0,
        "arp": 0,
        "tags":["pistol", "ancient","las"],
    },
    "Combat Knife": {
        "abbreviation": "CbKnf", 
        "attack": {
            "standard": 25,
            "master_crafted": 30,
            "artifact": 35
        },
        "description": "More of a sword than a knife proper, this tough and thick blade becomes a deadly weapon in the hand of an Astartes.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 0,
        "arp": 0,
        "tags":["knife"],
    },
    "Sarissa": {
        "abbreviation": "Saris",
        "attack": {
            "standard": 40,
            "master_crafted": 45,
            "artifact": 50
        },
        "description": "A vicious combat attachment that is attached to Bolters, in order to allow them to be used in melee combat.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0
    },
    "Chainsword": {
        "abbreviation": "ChSwrd",
        "attack": {
            "standard": 50,
            "master_crafted": 60,
            "artifact": 70
        },
        "description": "A standard Chainsword. It is popular among Assault Marines due to the raw power, even with multiple opponents.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0,
        "tags":["chain", "sword"],
    },
    "Chainaxe": {
        "abbreviation": "ChAxe",
        "attack": {
            "standard": 90,
            "master_crafted": 100,
            "artifact": 110
        },
        "melee_mod": {
            "standard": 5,
            "master_crafted": 10,
            "artifact": 15
        },
        "description": "Able to be dual-wielded. A weapon most frequently seen in the hands of Chaos, this Chainaxe uses motorized chainsaw teeth to maim and tear.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0,
        "tags":["chain", "axe"],
    },
    "Company Standard": {
       "abbreviation": "CmpStnd",
      "special_description": "Boosts morale",
      "description": "A banner that represents the honor of a particular company and will bolster the morale abilities of nearby Space Marines.",
        "attack": {
            "standard": 45,
            "master_crafted": 60,
            "artifact": 100
        },      
            "hp_mod": {
            "standard": 20, 
            "master_crafted": 20,
            "artifact": 20
        },
        "melee_hands": 1,
        "ranged_hands": 1,
        "range": 1,
        "spli": 1,
        "tags":["banner"],   
    },
    "Eviscerator": {
         "abbreviation": "Evisc",
        "attack": {
            "standard": 180,
            "master_crafted": 190,
            "artifact": 200
        },
        "melee_mod": {
            "standard": 2,
            "master_crafted": 2,
            "artifact": 2
        },
        "description": "An obscenely large Chainsword, this two-handed weapon can carve through flesh and plasteel with equal ease.",
        "melee_hands": 2,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["chain", "sword"],
    },
    "Power Sword": {
         "abbreviation": "PwrSwrd",
        "attack": {
            "standard": 180,
            "master_crafted": 200,
            "artifact": 240
        },
        "melee_mod": {
            "standard": 1.1,
            "master_crafted": 1.1,
            "artifact": 1.1
        },
        "description": "A preeminent type of Power Weapon. When active, the blade becomes sheathed in a lethal haze of disruptive energy.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "special_description": "Parry",
        "tags":["power", "sword"],
    },
    "Power Spear": {
         "abbreviation": "PwrSpear",
        "attack": {
            "standard": 200,
            "master_crafted": 250,
            "artifact": 300
        },
        "melee_mod": {
            "standard": 1.1,
            "master_crafted": 1.1,
            "artifact": 1.1
        },
        "description": "This power weapon requires great skill to wield. When active, the blade becomes sheathed in a lethal haze of disruptive energy.",
        "melee_hands": 2,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 0,
        "arp": 1,
        "special_description": "Parry",
        "tags":["power", "spear"],
    },
    "Chainfist": {
     "abbreviation": "ChFst",
        "attack": {
            "standard": 300,
            "master_crafted": 325,
            "artifact": 350
        },
        "description": "Created by mounting a chainsword to a power fist, this weapon is easily able to carve through armoured bulkheads.",
        "melee_hands": 1.25,
        "ranged_hands": 1,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "chain", "fist", "siege"],
    },
    "Lascutter": {
       "abbreviation": "Lasct",
        "attack": {
            "standard": 100,
            "master_crafted": 150,
            "artifact": 200
        },
        "description": "Origonally industrial tools used for breaking through bulkheads, this laser weapon is devastating in close combat.",
        "melee_hands": 1,
        "range": 1,
        "arp": 1,
        "tags":["laser", "siege"],
    },    
    "Eldar Power Sword": {
        "abbreviation": "EldPwrSwrd",
        "attack": {
            "standard": 170,
            "master_crafted": 180,
            "artifact": 190
        },
        "melee_mod": {
            "standard": 1.1,
            "master_crafted": 1.1,
            "artifact": 1.1
        },
        "description": "Power weapons, infused with arcane energy, are used by Howling Banshees and Dire Avenger Exarchs. Swords such as these are as much an artistic statement as a weapon and are effective against even heavily armored troops.",
        "melee_hands": 1.1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "special_description": "Parry",
        "tags":["power", "sword","elder","xenos"],
    },
    "Power Weapon": {
        "abbreviation": "PwrWpn",
        "attack": {
            "standard": 135,
            "master_crafted": 145,
            "artifact": 155
        },
        "melee_mod": {
            "standard": 1.1,
            "master_crafted": 1.1,
            "artifact": 1.1
        },
        "description": "Often the signature weapons of elite warriors, power swords are perhaps the most dangerous of melee weapons in the galaxy.",
        "melee_hands": 1.1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power"],
    },
    "Power Axe": {
       "abbreviation": "PwrAxe",       
        "attack": {
            "standard": 190,
            "master_crafted": 220,
            "artifact": 260
        },
        "melee_mod": {
            "standard": 1,
            "master_crafted": 1,
            "artifact": 1
        },
        "description": "Similar to the Power Sword. Able to be dual-wielded. This weapon can be activated to sheathe the axe-head in a lethal haze of disruptive energy.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 0,
        "arp": 1,
        "tags":["power", "axe", "dual"],
    },
    "Executioner Power Axe": {
       "abbreviation": "ExPwrAxe",       
        "attack": {
            "standard": 300,
            "master_crafted": 350,
            "artifact": 400
        },
        "melee_mod": {
            "standard": 10,
            "master_crafted": 15,
            "artifact": 20
        },
        "description": "A heavy two-handed power axe named after the Executioner chapter.",
        "melee_hands": 2.5,
        "ranged_hands": 2,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "axe"],
    },    
    "Power Fist": {
       "abbreviation": "PwrFst",       
        "attack": {
            "standard": 450,
            "master_crafted": 500,
            "artifact": 600
        },
        "melee_mod": {
            "standard": 1,
            "master_crafted": 1,
            "artifact": 1
        },
        "description": "A large, metal gauntlet surrounded by an energy field. Though large and slow, it dishes out tremendous damage.",
        "melee_hands": 1.1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power","fist"],
    },
    "Lightning Claw": {
    "abbreviation": "LghtClw",             
        "attack": {
            "standard": 130,
            "master_crafted": 160,
            "artifact": 190
        },
        "description": "Lightning claws are specialized close combat weapons with built-in disruptor fields. These fields disrupt matter on a molecular level, tearing through armor and flesh with ease.",
        "melee_hands": 1.1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power","dual","fist"],
    },
    "Dreadnought Lightning Claw": {
    "abbreviation": "LghtClw",             
        "attack": {
            "standard": 300,
            "master_crafted": 400,
            "artifact": 600
        },
        "melee_mod": {
            "standard": 1.2,
            "master_crafted": 1.2,
            "artifact": 1.2
        },
        "description": "A specialized Lightning Claw variant designed for Dreadnoughts, these claws are capable of ripping through enemy vehicles and infantry with ease.",
        "melee_hands": 5,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0,
        "tags":["power", "vehicle","dual","fist"],
    },
    "Thunder Hammer": {
      "abbreviation": "ThndHmr",                
        "attack": {
            "standard": 650,
            "master_crafted": 750,
            "artifact": 900
        },
        "melee_mod": {
            "standard": 1.3,
            "master_crafted": 1.3,
            "artifact": 1.3
        },
        "description": "This weapon unleashes a massive, disruptive field on impact. Only experienced marines can use Thunder Hammers.",
        "melee_hands": 2.25,
        "ranged_hands": 2,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "hammer", "siege"],
        "req_exp":90,
    },
    "Tome":{
        "abbreviation": "Tome",                
        "attack": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "melee_mod": {
            "standard":  1.0,
            "master_crafted":  1.0,
            "artifact": 1.0
        },
        "description": "Ancient Blades of various origins either through arcane forging or lost technique thes blades are beyond deadly.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 0,
        "arp": 0,
        "tags":["arcane"],
    },
    "Relic Blade": {
      "abbreviation": "RlcBld",               
        "attack": {
            "standard": 700,
            "master_crafted": 850,
            "artifact": 1000
        },
        "melee_mod": {
            "standard": 1.3,
            "master_crafted": 1.3,
            "artifact": 1.3
        },
        "description": "Ancient Blades of various origins either through arcane forging or lost technique these blades are beyond deadly.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
         "tags":["arcane", "sword"],
    },
    "Bolt Pistol": {
         "abbreviation": "BltPstl",               
        "attack": {
            "standard": 30,
            "master_crafted": 35,
            "artifact": 40
        },
        "description": "A smaller, more compact version of the venerable Boltgun. Standard Godwyn pattern.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 18,
        "range": 3.1,
        "spli": 0,
        "arp": 0,
        "tags":["bolt", "pistol"],
    },
    "Webber": {
         "abbreviation": "Webbr",           
        "attack": {
            "standard": 35,
            "master_crafted": 40,
            "artifact": 45
        },
        "description": "The Webber is a close-range weapon that fires strands of sticky web-like substance. It is designed to ensnare and immobilize enemies, restricting their movement and rendering them vulnerable to further attacks.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 5,
        "range": 4.1,
        "spli": 0,
        "arp": 0,
        "tags":["immobolise"]
    },
    "Underslung Bolter": {
        "abbreviation": "UndBltr",            
        "attack": {
            "standard": 60,
            "master_crafted": 70,
            "artifact": 80
        },
        "description": "A compact, secondary Bolter weapon often attached under the barrel of a larger firearm. It allows for rapid fire in close quarters.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 10,
        "spli": 1,
        "arp": 0,
         "tags":["bolt", "attached"]
    },
    "Stalker Pattern Bolter": {
        "abbreviation": "StlkBltr",            
        "attack": {
            "standard": 100,
            "master_crafted": 110,
            "artifact": 120
        },
        "description": "The Stalker Bolter is a scoped long-range variant of the standard Bolter. Depending on the specific modifications made by the wielder, the Stalker Bolter can serve as a precision battle rifle or a high-powered sniper weapon.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 20,
        "range": 15,
        "spli": 0,
        "arp": 1,
        "tags":["bolt","precision"]
    },
    "Bolter": {
        "abbreviation": "Bltr",             
        "attack": {
            "standard": 50,
            "master_crafted": 55,
            "artifact": 60
        },
        "description": "A standard Bolter, a 2-handed firearm that launches bolts of explosive material. It's a versatile and iconic weapon of Space Marines.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 16,
        "range": 12,
        "spli": 1,
        "arp": 0,
        "tags":["bolt"]
    },
    "Heavy Flamer": {
        "abbreviation": "HvyFlmr",              
        "attack": {
            "standard": 500,
            "master_crafted": 550,
            "artifact": 600
        },
        "description": "A much larger and bulkier flamer. Few armies carry them on hand, instead choosing to mount them to vehicles.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 8,
        "range": 2,
        "spli": 1,
        "arp": -1,
        "tags":["flame","heavy_ranged"]
    },
    "CCW Heavy Flamer": {
        "abbreviation": "CCWHvyFlmr",               
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "A powerful close combat weapon integrated with a flamer. It's capable of dealing both flame damage and melee attacks.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 6,
        "range": 2.1,
        "spli": 1,
        "arp": -1,
        "tags":["dreadnought","flame"]
    },
    "Dreadnought Power Claw":{
      "abbreviation": "PwrClw",              
        "attack": {
            "standard": 400,
            "master_crafted": 600,
            "artifact": 800
        },
        "description": "A brutal crushing claw capable of tearing open armour and felsh with ease.",
        "melee_hands": 5, 
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["dreadnought"]  
    },
    "Close Combat Weapon":{
        "abbreviation": "CCW",               
        "attack": {
            "standard": 350,
            "master_crafted": 450,
            "artifact": 550
        },
        "description": "While a variety of melee weapons are used by dreadnoughts, this power fist with flamer is the most common.",
        "melee_hands": 5, 
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["dreadnought","fist"]
    },       
    "Inferno Cannon": {
        "abbreviation": "InfCann",               
        "attack": {
            "standard": 400,
            "master_crafted": 440,
            "artifact": 480
        },
        "description": "A huge, vehicle-mounted flame weapon that fires with explosive force. The reservoir is liable to explode.",
        "melee_hands": 0,
        "ranged_hands": 2.25,
        "ammo": 0,
        "range": 3.1,
        "spli": 1,
        "arp": -1,
        "tags":["vehicle","flame","dreadnought"]
    },
    "Meltagun": {
        "abbreviation": "Mltgn",
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "A relatively quiet weapon, this gun vaporizes flesh and armor alike. Due to heat dissipation, it has only a short range.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 4,
        "range": 2.1,
        "spli": 0,
        "arp": 1,
        "tags":["melta"]
    },
    "Multi-Melta": {
         "abbreviation": "MltMelt",
        "attack": {
            "standard": 500,
            "master_crafted": 550,
            "artifact": 600
        },
        "description": "Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 8,
        "range": 4.1,
        "spli": 1,
        "arp": 1,
        "tags":["melta","heavy_ranged", "dreadnought"]
    },
    "Plasma Pistol": {
        "abbreviation": "PlsmPstl",
        "attack": {
            "standard": 115,
            "master_crafted": 130,
            "artifact": 150
        },
        "description": "A smaller version of the plasma gun, this dangerous-to-use weapon has exceptional armor-piercing capabilities.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 3.1,
        "spli": 0,
        "arp": 1,
        "tags":["plasma","pistol"]
    },
    "Infernus Pistol": {
      "abbreviation": "InfPstl" ,
        "attack": {
            "standard": 100,
            "master_crafted": 110,
            "artifact": 120
        },
        "description": "The Infernus Pistol is a compact and portable flamethrower-style weapon. It unleashes a torrent of fiery promethium, which engulfs its targets in flames.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 4,
        "range": 2.1,
        "spli": 0,
        "arp": 1,
        "tags":["flame","pistol"]
    },
    "Plasma Gun": {
        "abbreviation": "PlsmGn",
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "A 2-handed firearm that launches bolts of plasma. They are considered both sacred and dangerous, occasionally overheating.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 16,
        "range": 12,
        "spli": 1,
        "arp": 1,
        "tags":["plasma"]
    },
    "Plasma Cannon": {
        "abbreviation": "PlsmCan",
        "attack": {
            "standard": 500,
            "master_crafted": 600,
            "artifact": 750
        },
        "description": "A Heavy Duty versino of the volatile Plasma Gun.",
        "melee_hands": 1,
        "ranged_hands": 3,
        "ammo": 16,
        "range": 14,
        "spli": 1,
        "arp": 1,
        "tags":["plasma", "heavy_weapon", "Dreadnought"]
    },
    "Sniper Rifle": {
        "abbreviation": "SnprRfl",        
        "attack": {
            "standard": 80,
            "master_crafted": 88,
            "artifact": 96
        },
        "description": "Fires a solid shell and boasts powerful telescopic sights, allowing the user to target enemy weak points and distant foes.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 20,
        "range": 18,
        "spli": 1,
        "arp": 0,
        "tags":["precision"]
    },
    "Assault Cannon": {
        "abbreviation": "AssCann",       
        "attack": {
            "standard": 240,
            "master_crafted": 264,
            "artifact": 288
        },
        "description": "A heavy, rotary auto-cannon frequently used by Dreadnoughts and Terminators. Has an incredible rate of fire.",
        "melee_hands": 2.1,
        "ranged_hands": 2.25,
        "ammo": 5,
        "range": 12,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged","dreadnought"]
    },
    "Autocannon": {
        "abbreviation": "Autocnn",       
        "attack": {
            "standard": 180,
            "master_crafted": 198,
            "artifact": 216
        },
        "description": "A rapid-firing weapon able to use a wide variety of ammunition, from mass-reactive explosive to solid shells.",
        "melee_hands": 0,
        "ranged_hands": 2.25,
        "ammo": 25,
        "range": 18,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged","dreadnought"]
    },
    "Missile Launcher": {
      "abbreviation": "MsslLnch",          
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "This heavy weapon is capable of firing either armor-piercing or fragmentation rockets. Has a low ammunition count.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 6,
        "range": 24,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged","dreadnought"]
    },
    "Lascannon": {
       "abbreviation": "Lascnn",           
        "attack": {
            "standard": 200,
            "master_crafted": 220,
            "artifact": 240
        },
        "description": "A formidable laser weapon, this lascannon can pierce most vehicle or power armor from a tremendous range.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 8,
        "range": 24,
        "spli": 0,
        "arp": 1,
         "tags":["heavy_ranged"]
    },
    "Conversion Beam Projector": {
        "abbreviation": "CnvBmPrj",            
        "attack": {
            "standard": 500,
            "master_crafted": 550,
            "artifact": 600
        },
        "description": "The Conversion Beam Projector is a heavy energy weapon that harnesses advanced technology to project a concentrated beam of destructive energy. It is capable of cutting through armor, vehicles, and even heavily fortified structures.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 1,
        "range": 20,
        "spli": 1,
        "arp": 1
    },
    "Integrated Bolters": {
        "abbreviation": "IntgBltr", 
        "attack": {
            "standard": 75,
            "master_crafted": 82.5,
            "artifact": 90
        },
        "description": "Integrated Bolters are a set of Bolter weapons that are integrated or built directly into the structure of the vehicle, armor, or Dreadnought.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 20,
        "range": 8.1,
        "spli": 1,
        "arp": 1,
        "tags":["bolt"]
    },
    "Power Fist with Intergrated Bolters": {
       "abbreviation": "PwrFstBltr",       
        "attack": {
            "standard": 450,
            "master_crafted": 500,
            "artifact": 600
        },
        "melee_mod": {
            "standard": 1,
            "master_crafted": 1,
            "artifact": 1
        },
        "description": "Powerfist but with built in bolters for close combat and ranged firepower",
        "melee_hands": 1.1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "second_profiles":["Integrated Bolters"],
        "tags":["power","fist"],
    },    
    "Power Fists": {
        "abbreviation": "PwrFists", 
        "attack": {
            "standard": 425,
            "master_crafted": 467.5,
            "artifact": 510
        },
        "description": "While not quite as strong as two Power Fists, these artifacts allow the use of an additional, third weapon.",
        "melee_hands": 3,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0
    },
    "Twin Linked Heavy Bolter": {
        "abbreviation": "TwnHvyBltr", 
        "attack": {
            "standard": 240,
            "master_crafted": 264,
            "artifact": 288
        },
        "description": "Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 20,
        "range": 16,
        "spli": 1,
        "arp": 1,
        "tags":["heavy_ranged","vehicle","dreadnought"]
    },
    "Twin Linked Lascannon": {
        "abbreviation": "TwnLascnn", 
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armor.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 10,
        "range": 20,
        "spli": 0,
        "arp": 1,
        "tags":["heavy_ranged","vehicle","dreadnought"]
    },
    "Lascannons": {
         "abbreviation": "DblLascnn", 
        "attack": {
            "standard": 300,
            "master_crafted": 330,
            "artifact": 360
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armor.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 5,
        "range": 20,
        "spli": 0,
        "arp": 1,
        "tags":["heavy_ranged","vehicle","dreadnought"]
    },
    "Heavy Bolter": {
        "abbreviation": "HvyBltr", 
        "attack": {
            "standard": 320,
            "master_crafted": 352,
            "artifact": 384
        },
        "description": "The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.",
        "melee_hands": 1,
        "ranged_hands": 2.25,
        "ammo": 10,
        "range": 16,
        "spli": 1,
        "arp": 1,
        "tags":["heavy_ranged"]
    },
    "Whirlwind Missiles": {
        "attack": {
            "standard": 400,
            "master_crafted": 440,
            "artifact": 480
        },
        "description": "The Whirlwind Missile Launcher is a vehicle-mounted artillery weapon that launches a barrage of powerful missiles at the enemy.",
        "abbreviation": "WhrlMssl", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 6,
        "range": 20,
        "spli": 1,
        "arp": 1
    },
    "HK Missile": {
        "abbreviation": "HKMssl", 
        "description": "",
    },  
    "Twin Linked Heavy Bolter Mount": {
        "attack": {
            "standard": 240,
            "master_crafted": 264,
            "artifact": 288
        },
        "description": "Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles.",
        "abbreviation": "TwnHvyBltr", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 20,
        "range": 16,
        "spli": 1,
        "arp": 0
    },
    "Twin Linked Lascannon Mount": {
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour.",
        "abbreviation": "TwnLascnn", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 10,
        "range": 20,
        "spli": 1,
        "arp": 1
    },
    "Twin Linked Assault Cannon Mount": {
        "attack": {
            "standard": 360,
            "master_crafted": 396,
            "artifact": 432
        },
        "description": "A twin mount of rotary autocannons, boasting an incredible rate of fire.",
        "abbreviation": "TwnAssCnn", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 5,
        "range": 12,
        "spli": 1,
        "arp": 0
    },
    "Reaper Autocannon Mount": {
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "An archaic twin-linked autocannon design dating back to the Great Crusade. Effective against a variety of targets.",
        "abbreviation": "RprAtcnn", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 25,
        "range": 15,
        "spli": 1,
        "arp": 0
    },
    "Quad Linked Heavy Bolter Sponsons": {
        "attack": {
            "standard": 480,
            "master_crafted": 528,
            "artifact": 576
        },
        "description": "Quad-linked Heavy Bolters are a significantly upgraded version of the standard Heavy Bolter mount; already punishing in a single mount, this quad mount is devastating against a variety of targets.",
        "abbreviation": "QdHvyBltrs", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 10,
        "range": 16,
        "spli": 1,
        "arp": 1
    },
    "Twin Linked Lascannon Sponsons": {
        "attack": {
            "standard": 375,
            "master_crafted": 412.5,
            "artifact": 450
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour.",
        "abbreviation": "TwnLascnns", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 5,
        "range": 20,
        "spli": 1,
        "arp": 1
    },
    "Lascannon Sponsons": {
        "attack": {
            "standard": 250,
            "master_crafted": 300,
            "artifact": 350
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour.",
        "abbreviation": "Lscnns", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 5,
        "range": 20,
        "spli": 1,
        "arp": 1
    },    
    "Hurricane Bolter Sponsons": {
        "attack": {
            "standard": 405,
            "master_crafted": 445.5,
            "artifact": 486
        },
        "description": "Hurricane Bolters are large hex-mount bolter arrays that are able to deliver a withering hail of anti-infantry fire at short ranges.",
        "abbreviation": "HrcBltrs", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 20,
        "range": 12,
        "spli": 1,
        "arp": 0
    },
    "Flamestorm Cannon Sponsons": {
        "attack": {
            "standard": 600,
            "master_crafted": 660,
            "artifact": 720
        },
        "description": "A huge vehicle-mounted flamethrower, the heat produced by this terrifying weapon can crack even armoured ceramite.",
        "abbreviation": "FlmstCnns", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 6,
        "range": 3,
        "spli": 1,
        "arp": 1
    },
    "Twin Linked Heavy Flamer Sponsons": {
        "attack": {
            "standard": 550,
            "master_crafted": 605,
            "artifact": 660
        },
        "description": "A much larger and bulkier flamer. Few armies carry them on hand, instead choosing to mount them to vehicles.",
        "abbreviation": "TwnHvyFlmrs", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 12,
        "range": 2.1,
        "spli": 1,
        "arp": -1,
        "tags":["flame", "vehicle","sponson"]
    },
"Twin Linked Bolters": {
        "attack": {
            "standard": 80,
            "master_crafted": 140,
            "artifact": 180
        },
        "description": "A Twin-linked Bolter consists of two Bolter weapons mounted side by side, typically on a vehicle or a special weapon platform.",
        "abbreviation": "TwnBltrs", 
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 30,
        "range": 12,
        "spli": 1,
    },        
    "Twin Linked Multi-Melta Sponsons": {
        "abbreviation": "TwnMltMelts", 
        "attack": {
            "standard": 450,
            "master_crafted": 495,
            "artifact": 540
        },
        "description": "Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 6,
        "range": 4.1,
        "spli": 1,
        "arp": 1,
        "tags":["vehicle", "Sponson", "melta"]
    },
    "Twin Linked Volkite Culverin Sponsons": {
        "abbreviation": "TwnVlkCulvs", 
        "attack": {
            "standard": 480,
            "master_crafted": 528,
            "artifact": 576
        },
        "description": "An advanced thermal weapon from a bygone era, Volkite Culverins are able to ignite entire formations of enemy forces.",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 25,
        "range": 18,
        "spli": 1,
        "arp": 0,
        "tags":["vehicle", "Sponson", "volkite"]
    },
    "Heavy Bolter Sponsons": {
        "abbreviation": "HvyBltrs", 
        "description": "",
    },  
    "Heavy Flamer Sponsons": {
        "abbreviation": "HvyFlmrs", 
        "description": "",
    },  
    "Volkite Culverin Sponsons": {
        "abbreviation": "VlkClvs", 
        "description": "",
    },  
    "Autocannon Turret": {
        "abbreviation": "Autocnn", 
        "attack": {
            "standard": 130,
            "master_crafted": 528,
            "artifact": 576
        },
        "description": "A Predator-compatible turret mounting a reliable all-purpose autocannon. ",
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 50,
        "range": 18,
        "spli": 1,
        "arp": 0,
        "tags":["vehicle", "turrent"]
    },     
    "Storm Bolter": {
        "abbreviation": "StrmBltr", 
        "attack": {
            "standard": 80,
            "master_crafted": 88,
            "artifact": 96
        },
        "description": "Compact, and double-barreled, this bolt weapon is inaccurate but grants an enormous amount of firepower.",
        "melee_hands": 1.1,
        "ranged_hands": 1.1,
        "ammo": 10,
        "range": 10,
        "spli": 1,
        "arp": 0,
        "tags":["bolt"]
    },
    "Flamer": {
        "abbreviation": "Flmr", 
        "attack": {
            "standard": 350,
            "master_crafted": 385,
            "artifact": 420
        },
        "melee_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "description": "Blackened at the tip, this weapon unleashes a torrent of burning promethium - all the better to cleanse sin and impurity with.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 4,
        "range": 2.1,
        "spli": 1,
        "arp": -1,
        "tags":["flame"]
    },
    "Underslung Flamer": {
        "attack": {
            "standard": 200,
            "master_crafted": 220,
            "artifact": 240
        },
        "description": "",
        "abbreviation": "UndrFlmr", 
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 4,
        "range": 2.1,
        "spli": 1,
        "arp": 0,
        "tags":["flame"]
    },
    "Combiflamer": {
        "abbreviation": "CmbFlmr", 
        "attack": {
            "standard": 100,
            "master_crafted": 130,
            "artifact": 160
        },
        "description": "A standard bolter with a single shot flamer attached for tactical use",
        "melee_hands": 1,
        "ranged_hands": 1.5,
        "ammo": 15,
        "range": 10,
        "spli": 1,
        "arp": 0,
        "second_profiles":["Flamer"],
        "tags":["combi", "bolt"]
    },    
    "Incinerator": {
        "attack": {
            "standard": 200,
            "master_crafted": 220,
            "artifact": 240
        },
        "description": "This flamer weapon includes special promethium and sacred oils. It is particularly effective against Daemons and their ilk.",
        "abbreviation": "Incnrtr", 
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 4,
        "range": 2.1,
        "spli": 1,
        "arp": -1,
        "tags":["flame"]
    },
    "Force Weapon": {
        "attack": {
            "standard": 50,
            "master_crafted": 100,
            "artifact": 150
        },
        "abbreviation": "FrcWpn", 
        "description": "An advanced, psychically-attuned close combat weapon that is only fully effective in the hands of a psyker.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "range": 1,
        "spli": 0,
        "arp": 0,
        "tags":["psi"]
    },
     "Twin Linked Lascannon Turret": {
        "attack": {
            "standard": 250,
            "master_crafted": 300,
            "artifact": 350
        },
        "abbreviation": "TwnLscnn", 
        "description": "A Predator-compatible turret mounting a pair of anti-armour lascannons.",
        "range": 1,
        "spli": 0,
        "arp": 1,
        "range":20,
        "amm":10,
        "tags":["las", "twin_linked", "vehicle","turret"]
    },
    "Twin Linked Assault Cannon Turret": {
        "abbreviation": "TwnAssCnn", 
        "description": "",
    },  
    "Flamestorm Cannon Turret": {
        "abbreviation": "FlmstCnn", 
        "description": "",
    },  
    "Magna-Melta Turret": {
        "abbreviation": "MgnMlt", 
        "description": "",
    },  
    "Plasma Destroyer Turret": {
        "abbreviation": "PlsmDestr", 
        "description": "",
    },  
    "Heavy Conversion Beamer Turret": {
        "abbreviation": "HvyCnvBmr", 
        "description": "",
    },  
    "Neutron Blaster Turret": {
        "abbreviation": "NtrnBlstr", 
        "description": "",
    },  
    "Volkite Saker Turret": {
        "abbreviation": "VlkSkr", 
        "description": "",
    },
}

global.gear = {
  "armour": {
    "Power Armour": {
        "abbreviation": "PwrArm", 
      "armour_value": {
        "standard": 19,
        "master_crafted": 25,
        "artifact": 30
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5,
        "artifact": 10
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5,
        "artifact": 10
      },
      "description": "A suit of Adeptus Astartes power armour. The Mark can no longer be determined- it appears to be a combination of several types.",
      "tags":["power_armour"],
    },
    "Artificer Armour": {
        "abbreviation": "Artfcr", 
      "armour_value": {
        "standard": 30,
        "master_crafted": 34,
        "artifact": 38
      },
      "ranged_mod": {
        "standard": 5,
        "master_crafted": 10,
        "artifact": 15
      },
      "melee_mod": {
        "standard": 10,
        "master_crafted": 15,
        "artifact": 20
      },
      "description": "Heavily modified by the chapter artificers, and decorated without compare, this ancient Power Armour is beyond priceless.",
      "tags":["power_armour"],
    },
    "Terminator Armour": {
         "abbreviation": "Indmts", 
      "armour_value": {
        "standard": 42,
        "master_crafted": 46,
        "artifact": 50
      },
      "ranged_mod": {
        "standard": -10,
        "master_crafted": -5,
        "artifact": 0
      },
      "melee_mod": {
        "standard": 20,
        "master_crafted": 25,
        "artifact": 30
      },
      "melee_hands":2,
      "ranged_hands":2,
      "description": "Terminator Armour is the toughest and most powerful armour designed by humanity, available only to the veterans of the Space Marine Chapters. This Indomitus Pattern is the most widespread and versatile pattern as of M41.",
      "tags":["terminator"],
      "req_exp":90,
    },
    "Dreadnought": {
         "abbreviation": "Drdnght", 
      "armour_value": {
        "standard": 50,
        "master_crafted": 55,
        "artifact": 60
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_hands":8,
      "ranged_hands":8,      
      "description": "A massive war-machine that can be piloted by an honored Space Marine, who otherwise would have fallen in combat."
    },
    "Tartaros": {
        "abbreviation": "Tartrs", 
      "armour_value": {
        "standard": 42,
        "master_crafted": 46,
        "artifact": 50
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 20,
        "master_crafted": 25,
        "artifact": 30
      },
      "melee_hands":2,
      "ranged_hands":2,      
      "description": "This pattern is possibly considered the most advanced form of Terminator Armour, providing greater mobility for the wearer compared to the Indomitus with no loss in durability. In the M41 considered to be incredibly rare.",
      "tags":["terminator"],
      "req_exp":90,
    },
    "Cataphractii Pattern Terminator":{
        "abbreviation": "Catphr", 
      "armour_value": {
        "standard": 42,
        "master_crafted": 46,
        "artifact": 50
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 20,
        "master_crafted": 25,
        "artifact": 30,
    },
      "melee_hands":2,
      "ranged_hands":2,      
      "description": "Among the first issued to the Space Marine Legions. Having additional plating and shield generators installed within the shoulder pads resulted in severe straining of the suit's exoskeleton and reduced the wearer's maneuverability, leading to its decline among some legions.",
      "tags":["terminator"],
      "req_exp":90,
    },
     "Ork Armour": {
     "abbreviation": "OrkArm", 
      "armour_value": {
        "standard": 7,
        "master_crafted": 8,
        "artifact": 9
      },     
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "Mismatched basic armour used by ork forces"
    },
    "Scout Armour": {
    "abbreviation": "SctArm",
      "armour_value": {
        "standard": 11,
        "master_crafted": 12,
        "artifact": 14
      },    
      "ranged_mod": {
        "standard": 15,
        "master_crafted": 20, // Augmented
        "artifact": 25 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "A non-powered suit made up of carapace armour and ballistic nylon. Includes biohazard shielding, nutrient feed, and camouflage."
    },
    "MK3 Iron Armour": {
    "abbreviation": "MK3",
      "armour_value": {
        "standard": 26,
        "master_crafted": 29,
        "artifact": 32
      },
      "ranged_mod": {
        "standard": -10,
        "master_crafted": -5,
        "artifact": 0
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "An ancient set of Armorum Ferrum. Has thicker armour plating but the added weight slows down the wearer.",
       "tags":["power_armour"],
    },
    "MK4 Maximus": {
    "abbreviation": "MK4",
      "armour_value": {
        "standard": 22,
        "master_crafted": 25,
        "artifact": 28
      },
      "ranged_mod": {
        "standard": 5,
        "master_crafted": 10,
        "artifact": 15
      },
      "melee_mod": {
        "standard": 5,
        "master_crafted": 10, // Augmented
        "artifact": 15 // Augmented
      },
      "description": "Armour dating to the end of the Great Crusade. Often considered the ultimate Space Marine armour. The components are no longer reproducible.",
      "tags":["power_armour"],
    },
    "MK5 Heresy": {
    "abbreviation": "MK5",
      "armour_value": {
        "standard": 15,
        "master_crafted": 17,
        "artifact": 19
      },
      "ranged_mod": {
        "standard": -5,
        "master_crafted": 0,
        "artifact": 0
      },
      "melee_mod": {
        "standard": 20,
        "master_crafted": 0,
        "artifact": 0
      },
      "description": "A hastily assembled Power armour during the Horus Heresy to act as a stopgap. Excels at melee, alongside some downsides.",
      "tags":["power_armour"],
    },
    "MK6 Corvus": {
    "abbreviation": "MK6",
      "armour_value": {
        "standard": 15,
        "master_crafted": 17,
        "artifact": 19
      },
      "ranged_mod": {
        "standard": 15,
        "master_crafted": 20, // Augmented
        "artifact": 25 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "Relatively old beakie armour, sleek as can be. Boosted olfactory and auditory sensors increase the ranged accuracy of the wearer. Making it more fragile.",
      "tags":["power_armour"],
    },
    "MK7 Aquila": {
    "abbreviation": "MK7",
      "armour_value": {
        "standard": 17,
        "master_crafted": 19,
        "artifact": 21
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "The staple power armour of the adeptus astartes and the only power armour still widely manufactured.",
      "tags":["power_armour"],
    },
    "MK8 Errant": {
        "abbreviation": "MK8",
      "armour_value": {
        "standard": 22,
        "master_crafted": 24,
        "artifact": 26
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
    "description": "The newest and most advanced of the standard mark power armours as such production has not yet reached maximum capacity creating a supply shortage.",
    "tags":["power_armour"],
    },
    "MK10 Tacticus": {
        "abbreviation": "MK10",
      "armour_value": {
        "standard": 24,
        "master_crafted": 26, // Augmented
        "artifact": 28 // Augmented
      },
      "ranged_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "melee_mod": {
        "standard": 0,
        "master_crafted": 5, // Augmented
        "artifact": 10 // Augmented
      },
      "description": "The MK10 Tacticus is the most advanced pattern of power armour available to the Space Marines, featuring advanced materials and systems.",
      "tags":["power_armour"],
    }, 
    "Skitarii Armour":{
        "abbreviation": "SkitArm",
        "description": "Skitarri Armour is something of a misnomer as most Skitarii are in fact bonded more or less permenantly to their advanced mars armour",
         "armour_value": {
            "standard": 5,
            "master_crafted": 7, // Augmented
            "artifact": 9 // Augmented
        },                   
    },
    "Dragon Scales":{
        "abbreviation": "DrgnArm",
        "description": "advanced armour used by tech priests it is  remarkably lightweight for the protection it affords and is often greatly modified by it's wearer",
         "armour_value": {
            "standard": 12,
            "master_crafted": 14, // Augmented
            "artifact": 16 // Augmented
        },                   
    },    
    "Armoured Ceramite":{
        "abbreviation": "ArmCrmt",
        "description": "Supplemental ceramite armour packages provide protection far beyond stock configurations",
         "armour_value": {
            "standard": 20,
            "master_crafted": 24, 
            "artifact": 28 
        }, 
        "tags":["vehicle","armour"],              
    },
    "Heavy Armour":{
        "abbreviation": "HvyArm",
        "description": "Simple but effective, extra armour plates can be attached to most vehicles to provide extra protection.",
         "armour_value": {
            "standard": 10,
            "master_crafted": 12, 
            "artifact": 14 
        }, 
        "tags":["vehicle","armour"],              
    },
    "Artificer Hull":{
        "abbreviation": "ArtHll",
        "description": "Replacing numerous structural members and armour plates with thrice-blessed replacements, the vehicle’s hull is upgraded to be a rare work of mechanical art.",
         "armour_value": {
            "standard": 10,
            "master_crafted": 12, 
            "artifact": 14 
        }, 
        "tags":["vehicle","Upgrade"],              
    }                
} , 
  "gear": {
    "Bionics": {
        "abbreviation": "Bncs",
      "special_description": "Restores critical health",
      "description": "Bionics may be given to wounded marines to quickly get them back into combat-ready status, replacing damaged flesh.",
      "hp_mod": {
        "standard": 30, // Adjusted
        "master_crafted": 50, // Adjusted
        "artifact": 50 // Adjusted
      }
    },    
    "Narthecium": {
    "abbreviation": "Nrthcm",
      "special_description": "Heals Allies",
      "description": "An advanced medical field kit, these allow Space Marines to heal or recover Gene-Seed from fallen marines.",
        "melee_hands": -0.5,
        "ranged_hands": -0.5,       
    },
    "Psychic Hood": {
    "abbreviation": "PsyHd",
      "special_description": "-50% chance of perils*",
      "description": "An arcane hood that protects Psykers from enemy psychic powers and enhances their control.",
    },
    "Rosarius": {
        "abbreviation": "Rsrius",
      "special_description": "",
      "description": "Also called the 'Soul's Armour', this amulet has a built-in, powerful shield generator. They are an icon of the Imperial Creed.",
      "damage_resistance_mod": {
        "standard": 15, // Adjusted
        "master_crafted": 20, // Adjusted
        "artifact": 25 // Adjusted
      },
      "hp_mod": {
        "standard": 5,
        "master_crafted": 10,
        "artifact": 10
      }
    },
    "Iron Halo": {
        "abbreviation": "IrnHalo",
      "special_description": "",
      "description": "An ancient artifact, these powerful conversion field generators are granted to high ranking battle brothers or heroes. Bearers are often looked to for guidance.",
      "damage_resistance_mod": {
        "standard": 10, // Adjusted
        "master_crafted": 15, // Adjusted
        "artifact": 20 // Adjusted
      },
      "hp_mod": {
        "standard": 20, // Adjusted
        "master_crafted": 25, // Adjusted
        "artifact": 30 // Adjusted
      }
    },
    "Plasma Bomb": {
    "abbreviation": "PlBomb",
      "special_description": "Destroys destructibles",
      "description": "A special plasma charge, this bomb can be used to seal underground caves or destroy enemy structures.",
    },
    "Exterminatus": {
        "abbreviation": "Extrmnts",
      "special_description": "Destroys planets",
      "description": "A weapon of the Emperor, and His divine judgment, this weapon can be placed upon a planet to obliterate it entirely.",
    },
    "Servo Arms": {
    "abbreviation": "SrvArms",
      "special_description": "Integrated Flamer, Repairs Vehicles",
      "description": "A pair of powerful, mechanical arms. They include several tools that allow trained marines to repair vehicles rapidly.",
        "melee_hands": 0.25,
        "ranged_hands": 0.25,  
    },
    "Master Servo Arms": {
    "abbreviation": "MsSrvArms",
      "special_description": "Integrated Flamer, Repairs Vehicles",
      "description": "This master servo harness includes additional mechanical arms and tools, allowing a greater capacity and rate of repairs.",
        "melee_hands": 0.25,
        "ranged_hands": 0.25,  
    },
    "Smoke Launchers": {
      "special_description": "",
      "description": "Useful for providing concealment in open terrain, these launchers project wide-spectrum concealing smoke to prevent accurate targeting of the vehicle. ",
      "abbreviation": "SmkLnchrs",
      "tags":["smoke","conceal"]
    },
    "Dozer Blades": {
      "special_description": "",
      "description": "An attachment for the front of vehicles, useful for clearing difficult terrain and can be used as an improvised weapon. ",
      "abbreviation": "DzrBlds",
      "tags":[]
    },
    "Searchlight": {
      "special_description": "",
      "description": "A simple solution for fighting in dark environments, searchlights serve to illuminate enemies for easier targeting. ",
      "abbreviation": "SrchLght",
      "tags":[]
    },
    "Frag Assault Launchers": {
        "abbreviation": "FrgAssLnchrs", 
        "description": "",
    },             
  },
  "mobility":{
   "Bike": {
    "abbreviation": "Bike",
      "special_description": "Integrated Twin Linked-Bolters",
      "description": "A robust bike that can propel a marine at very high speeds. Boasts highly responsive controls and Twin Linked Bolters.",
      "hp_mod": {
        "standard": 25,
        "master_crafted": 25,
        "artifact": 35
      },
      "damage_resistance_mod": {
        "standard": 5,
        "master_crafted": 10,
        "artifact": 10
      },
        "melee_hands": -0.5,
        "ranged_hands": -0.5,        
    },

    "Jump Pack": {
    "abbreviation": "JmpPck",
      "special_description": "",
      "description": "A back-mounted device containing turbines or jets powerful enough to lift even a user in Power Armour.",
      "hp_mod": {
        "standard": 5,
        "master_crafted": 5,
        "artifact": 5
      },
      "damage_resistance_mod": {
        "standard": 10,
        "master_crafted": 10,
        "artifact": 10
      },
      "tags":["jump"],
    },
    "Heavy Weapons Pack": {
    "abbreviation": "HvyWpPck",
      "description": "A heavy ammunition backpack commonly used by devastators in conjunction with a heavy ranged weapon.",
      "ranged_mod": {
        "standard": 5,
        "master_crafted": 10,
        "artifact": 15
      },
    "melee_hands": -1,
    "ranged_hands": 1,      
    }
    // Add more mobility items as needed...
  }
}

function equipment_struct(item_data, core_type,quality="none") constructor{ 
    //This could be done with 2d arrays [[],[]]
    var names = ["hp_mod", "description","damage_resistance_mod", "ranged_mod", "melee_mod","armour_value" ,"attack","melee_hands","ranged_hands","ammo","range","spli","arp","special_description","abbreviation","tags","name","second_profiles","req_exp"];
    var defaults = [0,"",0,0,0,0,0,0,0,0,0,0,0,"","",[],"",[],0];
    type = core_type;
    for (var i=0;i<array_length(names);i++){
        if (struct_exists(item_data,names[i])){
            self[$names[i]] = item_data[$names[i]];
            if (quality!="none"){
                if (is_struct(self[$names[i]])){
                    if (struct_exists(self[$names[i]],quality)){
                        self[$names[i]]=self[$names[i]][$quality];
                    } else {
                        self[$names[i]]=self[$names[i]].standard;
                    }
                }
            }            
        } else {
            self[$names[i]]=defaults[i];
        }
    }

    static item_tooltip_desc_gen = function(){
        item_desc_tooltip = "";
        var stat_order;
        var special_properties = [];
        var item_type = type;
        if (type==""){
            if struct_exists(global.gear[$ "armour"],name){
                item_type = "armour";
            }
            else if struct_exists(global.gear[$ "mobility"],name){
                item_type = "mobility";
            }
            else if struct_exists(global.gear[$ "gear"],name){
                item_type = "gear";
            }
            else if struct_exists(global.weapons,name){
                item_type = "weapon";
            }
            else{
                item_desc_tooltip = "Error: Item not found!";
                return item_desc_tooltip;
            }
        }
        switch (item_type) {
            case "armour":
                stat_order = ["description", "special_description", "armour_value", "damage_resistance_mod", "hp_mod", "attack", "ranged_mod", "melee_mod", "ammo", "range", "melee_hands", "ranged_hands", "special_properties", "req_exp", "tags"];
                break;
            case "mobility":
                stat_order = ["description", "special_description", "armour_value", "hp_mod", "damage_resistance_mod", "attack", "ranged_mod", "melee_mod", "ammo", "range", "melee_hands", "ranged_hands", "special_properties", "req_exp", "tags"];
                break;
            case "gear":
                stat_order = ["description", "special_description", "armour_value", "hp_mod", "damage_resistance_mod", "attack", "ranged_mod", "melee_mod", "ammo", "range", "melee_hands", "ranged_hands", "special_properties", "req_exp", "tags"];
                break;
            case "weapon":
                stat_order = ["description", "special_description", "attack", "ranged_mod", "melee_mod", "ammo", "range", "armour_value", "hp_mod", "damage_resistance_mod", "melee_hands", "ranged_hands", "special_properties", "req_exp", "tags"];
                break;
            }
        for (var i = 0; i < array_length(stat_order); i++) {
            var stat = stat_order[i];
            switch (stat) {
                case "description":
                    if (description!=""){
                        item_desc_tooltip += $"{description}##"
                    }
                    break;
                case "armour_value":
                    if (armour_value!=0){
                        if item_type = "armour"{
                            item_desc_tooltip += $"Armour: {armour_value}#"
                        }
                        else{
                            item_desc_tooltip += $"Armour: {format_number_with_sign(armour_value)}#"
                        }
                    }
                    break;
                case "hp_mod":
                    if (hp_mod!=0){
                        item_desc_tooltip += $"Health Mod: {format_number_with_sign(hp_mod)}%#"
                    }
                    break;
                case "damage_resistance_mod":
                    if (damage_resistance_mod!=0){
                        item_desc_tooltip += $"Damage Res: {format_number_with_sign(damage_resistance_mod)}%#"
                    }
                    break;
                case "attack":
                    if (attack!=0){
                        item_desc_tooltip += $"Damage: {attack}#"
                    }
                    break;
                case "ranged_mod":
                    if (ranged_mod!=0){
                        item_desc_tooltip += $"Ranged Mod: {format_number_with_sign(ranged_mod)}%#"
                    }
                    break;
                case "melee_mod":
                    if (melee_mod!=0){
                        item_desc_tooltip += $"Melee Mod: {format_number_with_sign(melee_mod)}%#"
                    }
                    break;
                case "ammo":
                    if (ammo!=0){
                        item_desc_tooltip += $"Ammo: {ammo}#"
                    }
                    break;
                case "range":
                    if (range>1.1){
                        item_desc_tooltip += $"Range: {range}#"
                    }
                    break;
                case "melee_hands":
                    if (melee_hands != 0) {
                        if item_type = "weapon"{
                            item_desc_tooltip += $"Melee Burden: {melee_hands}#"
                        }
                        else{
                            item_desc_tooltip += $"Melee Cap: {format_number_with_sign(melee_hands)}#"
                        }
                    }
                    break;
                case "ranged_hands":
                    if (ranged_hands != 0) {
                        if item_type = "weapon"{
                            item_desc_tooltip += $"Ranged Burden: {ranged_hands}#"
                        }
                        else{
                            item_desc_tooltip += $"Ranged Cap: {format_number_with_sign(ranged_hands)}#"
                        }
                    }
                    break;
                case "special_properties":
                    if (arp>0){
                        array_push(special_properties, "Armour Piercing")
                    } else if (arp<0){
                        array_push(special_properties, "Low Penetration")
                    }
                    if (spli!=0){
                        array_push(special_properties, "Area of Effect")
                    }
                    if (array_length(special_properties)>0){
                        var special_properties_string = ""
                        for (var j = 0; j < array_length(special_properties); j++) {
                            special_properties_string += special_properties[j]
                            if (j < array_length(special_properties) - 1) {
                                special_properties_string += ", "
                            }
                        }
                        item_desc_tooltip += $"#Properties:#{special_properties_string}#"
                    }
                    break;
                case "special_description":
                    if (special_description!=""){
                        item_desc_tooltip += $"{special_description}#"
                    }
                    break;
                case "req_exp":
                    if (req_exp>0){
                        item_desc_tooltip += $"#Requires {req_exp} EXP#"
                    }
                    break;
                case "tags":
                    if (array_length(tags)>0){
                        var tagString = ""
                        for (var j = 0; j < array_length(tags); j++) {
                            tagString += tags[j]
                            if (j < array_length(tags) - 1) {
                                tagString += ", "
                            }
                        }
                        item_desc_tooltip += $"#Keywords:#{tagString}#"
                    }
                    break;
            }
        }
        return item_desc_tooltip
    }

    static has_tag =  function(tag){
        return array_contains(tags, tag);
    }

    static has_tags =  function(search_tags){
        var satisfied=false;
        var wanted_tags_length=array_length(search_tags);
        for (var i=0;i<array_length(tags);i++){
            for (var s=0;s<wanted_tags_length;s++){
                if (search_tags[s]==tags[i]){
                    satisfied=true;
                    break;
                }
            }
            if (satisfied) then break;
        }
        return satisfied;
    }

    static has_tags_all = function(search_tags, require_all=false){
        var satisfied=false;
        var wanted_tags_length=array_length(search_tags);
        for (var i=0;i<array_Length(tags);i++){
            for (var s=0;s<wanted_tags_length;s++){
                if (search_tags[s]==tags[i]){
                    array_delete(search_tags,s,1);
                    wanted_tags_length--;
                    s--;
                    if (wanted_tags_length==0){
                        satisfied=true;
                        break;
                    }
                }
            }
            if (satisfied) then break;
        }
        return satisfied;
    }
    static owner_data = function(owner){//centralization of bonuses originating from weapon improvements e.g STCs
        if (owner=="chapter"){
            if (type=="weapon"){
                if (obj_controller.stc_bonus[1]>0 && obj_controller.stc_bonus[1]<5){
                    if (obj_controller.stc_bonus[1]==2 && has_tag("chain")){
                        attack*=1.07;
                    } else if (obj_controller.stc_bonus[1]==3 && has_tag("flame")){
                        attack*=1.1;
                    }else if (obj_controller.stc_bonus[1]==4 && has_tag("explosive")){
                        attack*=1.07;
                    }else if (obj_controller.stc_bonus[1]==1 && has_tag("bolt")){
                        attack*=1.07;
                    }
                }
                if (obj_controller.stc_bonus[2]>0 && obj_controller.stc_bonus[2]<3){
                    if (obj_controller.stc_bonus[1]==1 && has_tag("fist")){
                        attack*=1.1;
                    } else if (obj_controller.stc_bonus[1]==2 && has_tag("Plasma")){
                        attack*=1.1;
                    }                   
                }
            }
        }
    }      
}
function gear_weapon_data(search_area="any",item,wanted_data="all", sub_class=false, quality="standard"){
    var item_data_set=false;
    var equip_area=false;
    gear_areas =  ["gear","armour","mobility"];
    if (search_area=="any"){
        data_found=false;
        for (i=0;i<3;i++){
           if (struct_exists(global.gear[$ gear_areas[i]],item)){
                equip_area=global.gear;
                item_data_set=global.gear[$ gear_areas[i]][$item];
                data_found=true;
                search_area=gear_areas[i];
                break;
           }
        }
        if (!data_found){
            equip_area=global.weapons;
            if (struct_exists(equip_area,item)){
                item_data_set=equip_area[$item];
                search_area="weapon";
            }
        }
    } else {
        if (array_contains(gear_areas,search_area)){ 
            equip_area=global.gear;
            if (struct_exists(equip_area[$ search_area],item)){
                item_data_set = equip_area[$ search_area][$ item]
            }        
        } else if (search_area=="weapon"){
           equip_area=global.weapons;
           if (struct_exists(equip_area,item)){
                item_data_set=equip_area[$item]
                search_area="weapon";
           }
        }
    }

    if (is_struct(item_data_set)){
        if (wanted_data=="all"){
            item_data_set.name=item;
            return new equipment_struct(item_data_set,search_area,quality);
        }
        if (struct_exists(item_data_set, wanted_data)){
            if (is_struct(item_data_set[$ wanted_data])){
                if (struct_exists(item_data_set[$ wanted_data], quality)){
                    return item_data_set[$ wanted_data][$ quality];
                } else {
                    if (struct_exists(item_data_set[$ wanted_data],"standard")){
                        return item_data_set[$ wanted_data][$ "standard"]
                    } else {
                        return 0;//default value
                    }
                }
            } else {
                return item_data_set[$ wanted_data]
            }
        } else {
            return 0;//default value
        }
    }    
    return false;//nothing found
}

function quality_string_conversion(quality){
    if (quality=="standard") then return "";
    var qaulity_conversions = {
        master_crafted:"Master Crafted ",
        artificer:"Articifer ",
        artifact:"Artifact ",
        exemplary:"Exemplary "
    }
    if (struct_exists(qaulity_conversions, quality)){
        return qaulity_conversions[$ quality]
    } else {return "";}
}

function format_number_with_sign(number){
    return number > 0 ? "+" + string(number) : string(number);
}

/*

    repeat(2){
            // Artifact weapons
            if (arti_armour=false){

                if (string_count("DUB",thawep)>0){attack=floor(attack*1.5);melee_hands+=1;ranged_hands+=1;spli=1;}
                if (string_count("Dae",thawep)>0){attack=floor(attack*1.5);amm=-1;}
                if (string_count("VOI",thawep)>0){attack=floor(attack*1.2);}
                if (string_count("ADA",thawep)>0){attack=floor(attack*1.1);}

                if (string_count("mnr",thawep)>0){attack=floor(attack*0.85);}
                if (string_count("MNR",thawep)>0){attack=floor(attack*0.85);}
            }

        }
    // Vehicle Upgrades

            if (equipment_1="Lucifer Pattern Engine"){statt=5;special_description="";emor=1;
                descr="A significant upgrade over the more common patterns of Rhino-chassis engines, these engines provide greater output.";}

                    // Vehicle Utility Weapons
            if (thawep="HK Missile"){attack=350;arp=1;range=50;ranged_hands+=1;amm=1;spli=1;
                descr="A single-use long-range anti-tank missile, this weapon can surgically destroy armoured targets in the opening stages of a battle.";}

                    // Land Raider Sponsons
                // Predator Turrets

                if (thawep="Twin Linked Assault Cannon Turret"){attack=360;arp=0;range=12;amm=10;spli=1;
                    descr="A Predator-compatible turret mounting a pair of short range anti-infantry assault cannons. ";}
                if (thawep="Flamestorm Cannon Turret"){attack=400;arp=1;range=2.1;amm=12;spli=1;
                      descr="A Predator-compatible turret housing a huge flamethrower, the heat produced by this terrifying weapon can crack even armoured ceramite. ";}
                if (thawep="Magna-Melta Turret"){attack=400;arp=1;range=6;amm=12;
                      descr="A Predator-compatible turret housing a magna-melta, a devastating short-range anti-tank weapon. ";}
                if (thawep="Plasma Destroyer Turret"){attack=350;arp=1;range=15;spli=1;
                      descr="A Predator-compatible turret housing a plasma destroyer, sometimes called the plasma executioner after the vehicle variants that mount this terrifying anti-armour weapon. ";}
                if (thawep="Heavy Conversion Beamer Turret"){attack=750;arp=1;range=25;amm=3;spli=1;
                    descr="A Predator-compatible turret housing a Heavy Conversion Beam Projector, a heavy energy weapon that turns a target's own matter against it by converting it into destructive energy.";}
                if (thawep="Neutron Blaster Turret"){attack=400;arp=1;range=15;amm=10
                      descr="A Predator-compatible turret housing a neutron blaster; a weapon from the Dark Age of Technology, this weapon is capable of destroying enemy armour with impunity. ";}
                if (thawep="Volkite Saker Turret"){attack=400;arp=0;range=18;amm=50;spli=1;
                        descr="A Predator-compatible turret housing a Volkite Saker, capable of igniting entire formations of enemy forces with a single sweep. ";}



