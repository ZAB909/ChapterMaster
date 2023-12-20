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
    "abbreviation": "StShield",
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
    "tags":["shield"],
    "hp_mod":{
      "standard": 30,
      "master_crafted": 35,
      "artifact": 40
    },
  },
  "Boarding Shield": {
    "description":"Protects twice as well when boarding. Used in siege or boarding operations, this shield offers additional protection.  It may be used with a 2-handed ranged weapon.",    
    "abbreviation": "BoShield",
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
    "abbreviation": "HGun",
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
    "abbreviation": "HRifle",
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
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 3.1,
        "spli": 0,
        "arp": 0,
        "tags":["pistol", "ancient","las"],
    },
    "Combat Knife": {
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
        "attack": {
            "standard": 50,
            "master_crafted": 60,
            "artifact": 70
        },
        "description": "A standard Chainsword. It is popular among Assault Marines due to the raw power, even with multiple opponents.",
        "melee_hands": 1.1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0,
        "tags":["chain", "sword"],
    },
    "Chainaxe": {
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
    "Master Crafted Power Sword": {
        "attack": {
            "standard": 185,
            "master_crafted": 195,
            "artifact": 205
        },
        "melee_mod": {
            "standard": 1.1,
            "master_crafted": 1.1,
            "artifact": 1.1
        },
        "description": "A master-crafted weapon is usually incredibly ornate and highly decorated compared to standard weapons of the same pattern, while also possessing augmented functionality. Any standard Imperial weapon can be master-crafted. Due to the improved design of a master-crafted weapon, it is more likely that a target will be hit by attacks from this weapon.",
        "melee_hands": 1.1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "special_description": "Parry",
        "tags":["power", "sword"],
    },
    "Chainfist": {
        "attack": {
            "standard": 300,
            "master_crafted": 325,
            "artifact": 350
        },
        "description": "Created by mounting a chainsword to a power fist, this weapon is easily able to carve through armoured bulkheads.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "chain", "fist"],
    },
    "Lascutter": {
        "attack": {
            "standard": 100,
            "master_crafted": 150,
            "artifact": 200
        },
        "description": "Origonally industrial tools used for breaking through bulkheads, this laser weapon is devastating in close combat.",
        "melee_hands": 1,
        "range": 1,
        "arp": 1,
        "tags":["laser"],
    },    
    "Eldar Power Sword": {
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
        "tags":["power", "sword"],
    },
    "Power Weapon": {
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
        "tags":["power", "axe"],
    },
    "Power Fist": {
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
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power"],
    },
    "Lightning Claw": {
        "attack": {
            "standard": 130,
            "master_crafted": 160,
            "artifact": 190
        },
        "description": "Lightning claws are specialized close combat weapons with built-in disruptor fields. These fields disrupt matter on a molecular level, tearing through armor and flesh with ease.",
        "melee_hands": 1,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power","dual"],
    },
    "Dreadnought Lightning Claw": {
        "attack": {
            "standard": 95,
            "master_crafted": 105,
            "artifact": 115
        },
        "melee_mod": {
            "standard": 1.2,
            "master_crafted": 1.2,
            "artifact": 1.2
        },
        "description": "A specialized Lightning Claw variant designed for Dreadnoughts, these claws are capable of ripping through enemy vehicles and infantry with ease.",
        "melee_hands": 1.2,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0,
        "tags":["power", "vehicle"],
    },
    "Thunder Hammer": {
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
        "melee_hands": 2,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "hammer"],
    },
    "Tome":{
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
        "description": "Ancient Blades of various origins either through arcane forging or lost technique thes blades are beyond deadly.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
         "tags":["arcane", "sword"],
    },
    "Master Crafted Thunder Hammer": {
        "attack": {
            "standard": 560,
            "master_crafted": 620,
            "artifact": 680
        },
        "melee_mod": {
            "standard": 1,
            "master_crafted": 1,
            "artifact": 1
        },
        "description": "The Master Crafted Thunder Hammer incorporates superior craftsmanship, advanced technology, and special modifications, making it more potent and effective in combat. It possesses all the qualities of a standard Thunder Hammer but with enhanced performance and additional features.",
        "melee_hands": 1,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 1,
        "tags":["power", "hammer"],
    },
    "Bolt Pistol": {
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
        "attack": {
            "standard": 50,
            "master_crafted": 55,
            "artifact": 60
        },
        "description": "A standard Bolter, a 2-handed firearm that launches bolts of explosive material. It's a versatile and iconic weapon of Space Marines.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 16,
        "range": 12,
        "spli": 1,
        "arp": 0,
        "tags":["bolt"]
    },
    "Heavy Flamer": {
        "attack": {
            "standard": 500,
            "master_crafted": 550,
            "artifact": 600
        },
        "description": "A much larger and bulkier flamer. Few armies carry them on hand, instead choosing to mount them to vehicles.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 8,
        "range": 2,
        "spli": 1,
        "arp": -1,
        "tags":["flame","heavy_ranged"]
    },
    "CCW Heavy Flamer": {
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
        "arp": -1
    },
    "Inferno Cannon": {
        "attack": {
            "standard": 400,
            "master_crafted": 440,
            "artifact": 480
        },
        "description": "A huge, vehicle-mounted flame weapon that fires with explosive force. The reservoir is liable to explode.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 0,
        "range": 3.1,
        "spli": 1,
        "arp": -1,
        "tags":["vehicle","flame"]
    },
    "Meltagun": {
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
    "Master Crafted Meltagun": {
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "A Master Crafted Meltagun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 4,
        "range": 2.1,
        "spli": 0,
        "arp": 1
    },
    "Multi-Melta": {
        "attack": {
            "standard": 500,
            "master_crafted": 550,
            "artifact": 600
        },
        "description": "Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 8,
        "range": 4.1,
        "spli": 1,
        "arp": 1,
        "tags":["melta","heavy_ranged"]
    },
    "Plasma Pistol": {
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
    "Master Crafted Plasma Pistol": {
        "attack": {
            "standard": 120,
            "master_crafted": 132,
            "artifact": 144
        },
        "description": "A Master Crafted Plasma Pistol incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 0,
        "range": 3.1,
        "spli": 0,
        "arp": 0
    },
    "Infernus Pistol": {
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
    "Master Crafted Plasma Gun": {
        "attack": {
            "standard": 175,
            "master_crafted": 192,
            "artifact": 210
        },
        "description": "A Master Crafted Plasma Gun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 16,
        "range": 14,
        "spli": 1,
        "arp": 1
    },
    "Sniper Rifle": {
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
        "attack": {
            "standard": 240,
            "master_crafted": 264,
            "artifact": 288
        },
        "description": "A heavy, rotary auto-cannon frequently used by Dreadnoughts and Terminators. Has an incredible rate of fire.",
        "melee_hands": 2.1,
        "ranged_hands": 2.1,
        "ammo": 5,
        "range": 12,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged"]
    },
    "Autocannon": {
        "attack": {
            "standard": 180,
            "master_crafted": 198,
            "artifact": 216
        },
        "description": "A rapid-firing weapon able to use a wide variety of ammunition, from mass-reactive explosive to solid shells.",
        "melee_hands": 0,
        "ranged_hands": 2,
        "ammo": 25,
        "range": 18,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged"]
    },
    "Missile Launcher": {
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "This heavy weapon is capable of firing either armor-piercing or fragmentation rockets. Has a low ammunition count.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 6,
        "range": 24,
        "spli": 1,
        "arp": 0,
        "tags":["heavy_ranged"]
    },
    "Lascannon": {
        "attack": {
            "standard": 200,
            "master_crafted": 220,
            "artifact": 240
        },
        "description": "A formidable laser weapon, this lascannon can pierce most vehicle or power armor from a tremendous range.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 8,
        "range": 24,
        "spli": 0,
        "arp": 1,
         "tags":["heavy_ranged"]
    },
    "Conversion Beam Projector": {
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
        "arp": 1
    },
    "Power Fists": {
        "attack": {
            "standard": 425,
            "master_crafted": 467.5,
            "artifact": 510
        },
        "description": "While not quite as strong as two Power Fists, these artifacts allow the use of an additional, third weapon.",
        "melee_hands": 2,
        "ranged_hands": 0,
        "ammo": 0,
        "range": 1,
        "spli": 1,
        "arp": 0
    },
    "Twin Linked Heavy Bolter": {
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
        "tags":["vehicle"]
    },
    "Twin Linked Lascannon": {
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
        "tags":["heavy_ranged"]
    },
    "Lascannons": {
        "attack": {
            "standard": 300,
            "master_crafted": 330,
            "artifact": 360
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armor.",
        "melee_hands": 1,
        "ranged_hands": 2,
        "ammo": 5,
        "range": 20,
        "spli": 0,
        "arp": 1,
        "tags":["heavy_ranged"]
    },
    "Heavy Bolter": {
        "attack": {
            "standard": 320,
            "master_crafted": 352,
            "artifact": 384
        },
        "description": "The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.",
        "melee_hands": 1,
        "ranged_hands": 2,
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
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 6,
        "range": 20,
        "spli": 1,
        "arp": 1
    },
    "Twin Linked Heavy Bolter Mount": {
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
        "arp": 0
    },
    "Twin Linked Lascannon Mount": {
        "attack": {
            "standard": 250,
            "master_crafted": 275,
            "artifact": 300
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour.",
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
        "melee_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "ranged_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "hp_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "damage_resistance_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "description": "A twin mount of rotary autocannons, boasting an incredible rate of fire.",
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
        "melee_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "ranged_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "hp_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "damage_resistance_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "description": "An archaic twin-linked autocannon design dating back to the Great Crusade. Effective against a variety of targets.",
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
        "melee_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "ranged_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "hp_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "damage_resistance_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "description": "Quad-linked Heavy Bolters are a significantly upgraded version of the standard Heavy Bolter mount; already punishing in a single mount, this quad mount is devastating against a variety of targets.",
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
        "melee_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "ranged_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "hp_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "damage_resistance_mod": {
            "standard": 0,
            "master_crafted": 0,
            "artifact": 0
        },
        "description": "Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour.",
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
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 12,
        "range": 2.1,
        "spli": 1,
        "arp": -1
    },
    "Twin Linked Multi-Melta Sponsons": {
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
        "arp": 1
    },
    "Twin Linked Volkite Culverin Sponsons": {
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
        "arp": 0
    },
    "Storm Bolter": {
        "attack": {
            "standard": 80,
            "master_crafted": 88,
            "artifact": 96
        },
        "description": "Compact, and double-barreled, this bolt weapon is inaccurate but grants an enormous amount of firepower.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 10,
        "range": 10,
        "spli": 1,
        "arp": 0,
        "tags":["flame"]
    },
    "Flamer": {
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
        "melee_hands": 0,
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
        "melee_hands": 0,
        "ranged_hands": 0,
        "ammo": 4,
        "range": 2.1,
        "spli": 1,
        "arp": 0,
        "tags":["flame"]
    },
    "Incinerator": {
        "attack": {
            "standard": 200,
            "master_crafted": 220,
            "artifact": 240
        },
        "description": "This flamer weapon includes special promethium and sacred oils. It is particularly effective against Daemons and their ilk.",
        "melee_hands": 0,
        "ranged_hands": 1,
        "ammo": 4,
        "range": 2.1,
        "spli": 1,
        "arp": -1,
        "tags":["flame"]
    }
}

global.gear = {
  "armour": {
    "Power Armour": {
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
      "description": "A suit of Adeptus Astartes power armour. The Mark can no longer be determined- it appears to be a combination of several types."
    },
    "Artificer Armour": {
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
      "description": "Heavily modified by the chapter artificers, and decorated without compare, this ancient Power Armour is beyond priceless."
    },
    "Terminator Armour": {
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
      "description": "The toughest and most powerful armour designed by humanity. Only the most veteran of Astartes are allowed to wear these."
    },
    "Dreadnought": {
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
      "description": "A massive war-machine that can be piloted by an honored Space Marine, who otherwise would have fallen in combat."
    },
    "Tartaros": {
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
      "description": "Even more advanced than the Indomitus Terminator Armour, this upgraded armour offers greater mobility at no cost to protection."
    },
    "Cataphractii Pattern Terminator":{
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

      "description": "Among the first issued to the Space Marine Legions, it is functionally distinct from other patterns, bearing additional plating and shield generators installed within the shoulder pads"
    },
     "Ork Armour": {
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
      "description": ""
    },
    "Scout Armour": {
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
      "description": "An ancient set of Armorum Ferrum. Has thicker armour plating but the added weight slows down the wearer."
    },
    "MK4 Maximus": {
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
      "description": "Armour dating to the end of the Great Crusade. Often considered the ultimate Space Marine armour. The components are no longer reproducible."
    },
    "MK5 Heresy": {
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
      "description": "A hastily assembled Power armour during the Horus Heresy to act as a stopgap. Excels at melee, alongside some downsides."
    },
    "MK6 Corvus": {
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
      "description": "Relatively old beakie armour, sleek as can be. Boosted olfactory and auditory sensors increase the ranged accuracy of the wearer. Making it more fragile."
    },
    "MK7 Aquila": {
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
      }
    },
    "MK8 Errant": {
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
      }
    },
    "MK10 Indomitus": {
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
      "description": "The MK10 Indomitus is the most advanced pattern of power armour available to the Space Marines, featuring advanced materials and systems."
    }, 
        "Skitarii Armour":{
            "description": "Skitarri Armour is something of a misnomer as most Skitarii are in fact bonded more or less permenantly to their advanced mars armour",
             "armour_value": {
                "standard": 5,
                "master_crafted": 7, // Augmented
                "artifact": 9 // Augmented
            },                   
        }
    } , 
  "equipment": {
    "Bionics": {
      "special_description": "Restores critcal health",
      "description": "Bionics may be given to wounded marines to quickly get them back into combat-ready status, replacing damaged flesh.",
      "hp_mod": {
        "standard": 30, // Adjusted
        "master_crafted": 50, // Adjusted
        "artifact": 50 // Adjusted
      }
    },    
    "Narthecium": {
      "special_description": "Medical field kit",
      "description": "An advanced medical field kit, these allow Space Marines to heal or recover Gene-Seed from fallen marines.",
      "damage_resistance_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      },
      "hp_mod": {
        "standard": 30, // Adjusted
        "master_crafted": 50, // Adjusted
        "artifact": 50 // Adjusted
      }
    },
    "Psychic Hood": {
      "special_description": "-50% chance of perils*",
      "description": "An arcane hood that protects Psykers from enemy psychic powers and enhances their control.",
      "damage_resistance_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      },
      "hp_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      }
    },
    "Rosarius": {
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
      "special_description": "Destroys destructibles",
      "description": "A special plasma charge, this bomb can be used to seal underground caves or destroy enemy structures.",
    },
    "Exterminatus": {
      "special_description": "Destroys planets",
      "description": "A weapon of the Emperor, and His divine judgment, this weapon can be placed upon a planet to obliterate it entirely.",
      "damage_resistance_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      },
      "hp_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      }
    },
    "Servo Arms": {
      "special_description": "Integrated flamer, repairs",
      "description": "A pair of powerful, mechanical arms. They include several tools that allow trained marines to repair vehicles rapidly.",
      "damage_resistance_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      },
      "hp_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      }
    },
    "Master Servo Arms": {
      "special_description": "Integrated flamer, repairs",
      "description": "This master servo harness includes additional mechanical arms and tools, allowing a greater capacity and rate of repairs.",
      "damage_resistance_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      },
      "hp_mod": {
        "standard": 0,
        "master_crafted": 0,
        "artifact": 0
      }
    }
  },
  "mobility":{
   "Bike": {
      "special_description": "",
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
      }
    },

    "Jump Pack": {
      "special_description": "Jump Pack",
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
      }
    }
    // Add more mobility items as needed...
  }
}

function equipment_struct(item_data, core_type,quality="none") constructor{ 
    var names = ["hp_mod", "description","damage_resistance_mod", "ranged_mod", "melee_mod","armour_value" ,"attack","melee_hands","ranged_hands","ammo","range","spli","arp","special_description","abbreviation","tags","name"];
    var defaults = [0,"",0,0,0,0,0,0,0,0,0,0,0,"","",[],""];
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
    spe_desc = special_description;
    static special_description_gen = function(){
        spe_desc+=" "
        if (attack!=0){
            spe_desc+=$"DAM {attack}, "
        }
        if (ranged_mod!=0){
            spe_desc += $"Ranged {ranged_mod}%, "
        }
        if (melee_mod!=0){
            spe_desc += $"Melee {melee_mod}%, "
        }
        if (hp_mod!=0){
            spe_desc += $"HP {hp_mod}%, "
        }
        if (damage_resistance_mod!=0){
            spe_desc += $"Damage Res {damage_resistance_mod}%, "
        }
        if (armour_value!=0){
            spe_desc += $"AC {armour_value}, "
        }
        if (ammo!=0){
            spe_desc += $"Ammo {ammo}, "
        }
        if (range>1.1){
            spe_desc += $"Range {range}, "
        }
        if (arp>0){
            spe_desc += $"Armour piercing, "
        } else if (arp<0){
            spe_desc += $"Low Penetration, "
        }
        if (spli!=0){
            if (range>1.1){
                spe_desc += $"Ranged, Rapid Fire, "
            } else {
                spe_desc += $"Melee, Splash, "
            }
        } 
        if (melee_hands!=0){
            spe_desc += $"melee carry {-1*melee_hands}, "
        }
        if (ranged_hands!=0){
            spe_desc += $"ranged carry {-1*ranged_hands}, "
        }     
        return  spe_desc
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
    static owner_data = function(owner){
        if (owner=="chapter"){
            if (type=="weapon"){
                if (obj_controller.stc_bonus[1]>0 && obj_controller.stc_bonus[1]<5){
                    if (obj_controller.stc_bonus[1]=2 && has_tag("chain")){
                        attack*1.07;
                    } else if (obj_controller.stc_bonus[1]=3 && has_tag("flame")){
                        attack*1.1;
                    }else if (obj_controller.stc_bonus[1]=4 && has_tag("explosive")){
                        attack*1.07;
                    }else if (obj_controller.stc_bonus[1]=1 && has_tag("bolt")){
                        attack*1.07;
                    }
                }
                if (obj_controller.stc_bonus[2]>0 && obj_controller.stc_bonus[2]<3){
                    if (obj_controller.stc_bonus[1]=1 && has_tag("fist")){
                        attack*1.1;
                    } else if (obj_controller.stc_bonus[1]=2 && has_tag("Plasma")){
                        attack*1.1;
                    }                   
                }
            }
        }
    }      
}
function gear_weapon_data(search_area="any",item,wanted_data="all", sub_class=false, quality="standard"){
	var item_data_set=false;
    var equip_area=false;
    gear_areas =  ["equipment","armour","mobility"];
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

function scr_weapon(equipment_1, equipment_2, base_group, unit_array_position, is_dreadnought, nuum, information_wanted) {

	// equipment_1: name of the first piece of equipment
	// equipment_2: name of second piece of equipment if any
	// base_group: the unit type defualts to true which means a marine (this needs work)
	// unit_array_position: the position of the marine inside the tempory combat array
	// is_dreadnought: is unit a dreadnought
	// nuum: not a good god damn fucking clue
	// information_wanted: what type of information do you want returned

	// More spaghetti code.  This either calculates damage for battle blocks or generates a tooltip for the shop/management.
	// it also gets informatino abou marine equipment for the chapter managment screens
	// let it be known that this represents everything wrong with this code base

	var i,wip,wip1,wip2,attack,arp,acr,att1,apa1,att2,apa2,acr1,acr2,melee_hands,ranged_hands,rang1,rang2,range,ammo1,ammo2,amm,spli1,spli2,spli,rending,thawep,descr,descr2,special_description,statt, weapon_data, weapon_ammo;
	var disk1,rending1,spe_descr1;
	i=0;wip1="";wip2="";wip="";thawep="";descr="";descr2="";special_description="";spe_descr1="";statt=0;rending=0;disk1="";rending1=0;
	melee_hands=0;ranged_hands=0;
	range=0;attack=0;arp=0;acr=0;
	att1=0;apa1=0;att2=0;
	apa2=0;acr1=0;acr2=0;
	rang1=0;rang2=0;
	spli=0;spli1=0;spli2=0;
	ammo1=-1;ammo2=-1;amm=-1;


	thawep=equipment_1;

	obj_controller.temp[9000]="";

	repeat(2){
	    i+=1;amm=-1;spli=0;
	    var emor;emor=0;

	    if (information_wanted="description") or (information_wanted="description_long"){
	        if (i=1) then thawep=equipment_2;
	        if (i=2) then thawep=equipment_1;
	        if (i=2){wip1=thawep;}
	        if (i=1){wip2=equipment_2;}
	    }
	    if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (i=1) then thawep=equipment_1;
	        if (i=2) then thawep=equipment_2;
	        if (i=1){wip1=thawep;}
	        if (i=2){wip2=equipment_2;}
	    }

	    if (string_count("&",thawep)>0) or (string_count("|",thawep)>0){
	        // Artifact Armour
	        var arti_armour;
	        arti_armour=false;
	        if (string_count("Power Armour",thawep)>0){statt=30;emor=1;arti_armour=true;}
	        if (string_count("Artificer",thawep)>0){statt=35;emor=1;arti_armour=true;special_description="+10% Melee";}
	        if (string_count("Terminator",thawep)>0){statt=45;emor=1;arti_armour=true;special_description="+20% Melee, -10% Ranged, Strength";}
	        if (string_count("Dreadnought",thawep)>0){statt=50;emor=1;arti_armour=true;}

	        // Artifact weapons
	        if (arti_armour=false){
	            if (string_count("Bolter",thawep)>0){
	                attack=65;arp=0;range=12;ranged_hands+=2;amm=15;spli=1;
	                if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	            }
	            if (struct_exists(global.weapons, thawep)){
	            	weapon_data = global.weapons[$ thawep];
	            	attack = weapon_data[$ attack][$ standard];
	            	arp = weapon_data[$ arp];
	            	range = weapon_data[$ range];
	            	melee_hands += weapon_data[$ melee_hands];
	            	ranged_hands += weapon_data[$ ranged_hands];
	            	spli = weapon_data[$ spli];
	            	special_description = weapon_data[$ special_description];
	            	weapon_ammo = weapon_data[$ ammo];
	            }

	            if (string_count("DUB",thawep)>0){attack=floor(attack*1.5);melee_hands+=1;ranged_hands+=1;spli=1;}
	            if (string_count("Dae",thawep)>0){attack=floor(attack*1.5);amm=-1;}
	            if (string_count("VOI",thawep)>0){attack=floor(attack*1.2);}
	            if (string_count("ADA",thawep)>0){attack=floor(attack*1.1);}

	            if (string_count("mnr",thawep)>0){attack=floor(attack*0.85);}
	            if (string_count("MNR",thawep)>0){attack=floor(attack*0.85);}
	        }


	        /*
	        if (string_count("Power",targ.marine_armour[targ.men])>0) then targ.marine_ac[targ.men]=30;
	        if (string_count("Artificer",targ.marine_armour[targ.men])>0){targ.marine_ac[targ.men]=37;targ.marine_attack[targ.men]+=0.1;}
	        if (string_count("Terminator",targ.marine_armour[targ.men])>0){targ.marine_ac[targ.men]=42;targ.marine_ranged[targ.men]-=0.1;targ.marine_attack[targ.men]+=0.2;}
	        if (string_count("Dreadnought",targ.marine_armour[targ.men])>0) then targ.marine_ac[targ.men]=44;
	        */

	    }

        var gear_data;
        if (i=1){
            gear_data=gear_weapon_data("any",equipment_1,"all");
        }

	    if (thawep="Force Weapon"){
	        attack=400;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="An advanced, psychically-attuned close combat weapon that is only fully effective in the hands of a psyker.";
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("0",marine_powers[unit_array_position])>0){attack=400;arp=0;range=1;melee_hands+=1;spli=1;}
	        if (string_count("0",marine_powers[unit_array_position])=0){thawep="Inactive Force Weapon";attack=30;arp=0;range=1;melee_hands+=1;}}
	        // if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then melee_hands-=1;
	    }
	    if (thawep="Master Crafted Force Weapon"){
	        attack=500;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="A more expertly crafted Force Weapon, the fine craftsmanship confers greater ease and control with disrupting matter.";
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("0",marine_powers[unit_array_position])>0){attack=480;arp=0;range=1;melee_hands+=1;spli=1;}
	        if (string_count("0",marine_powers[unit_array_position])=0){thawep="Inactive Master Crafted Force Weapon";attack=30;arp=0;range=1;melee_hands+=1;}}
	        // if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then melee_hands-=1;
	    }

	    if (thawep="Thunder Hammer"){attack=450;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="This weapon unleashes a massive, disruptive field on impact.  Only experienced marines can use Thunder Hammers.";}
	    if (thawep="Master Crafted Thunder Hammer"){attack=560;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="The Master Crafted Thunder Hammer incorporates superior craftsmanship, advanced technology, and special modifications, making it more potent and effective in combat. It possesses all the qualities of a standard Thunder Hammer but with enhanced performance and additional features.";}
    
	    if (thawep="Bolt Pistol"){attack=30;arp=0;range=3.1;amm=18;

	        descr="A smaller, more compact version of the venerable Boltgun.  Standard Godwyn pattern.";}
	    if (thawep="Webber"){attack=35;arp=0;range=4.1;ranged_hands+=2;amm=5;spli=0;
	        descr="The Webber is a close-range weapon that fires strands of sticky web-like substance. It is designed to ensnare and immobilize enemies, restricting their movement and rendering them vulnerable to further attacks. ";}
	    if (thawep="Underslung Bolter"){attack=60;arp=0;range=10;amm=8;spli=1;}// Bursts
            if (thawep="Stalker Pattern Bolter"){attack=100;arp=1;range=15;ranged_hands+=2;amm=20;spli=0;
	        descr="The Stalker Bolter is a scoped long-range variant of the standard Bolter. Depending on the specific modifications made by the wielder, the Stalker Bolter can serve as a precision battle rifle or a high-powered sniper weapon.";}


	    if (thawep="Bolter"){attack=50;arp=0;range=12;ranged_hands+=2;amm=16;spli=1;

	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;}
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="A standard Godwyn Pattern Bolter.  This blessed weapon is used by most Adeptus Astartes.";}// Bursts
	    if (thawep="Master Crafted Combiflamer"){attack=200;arp=1;range=12;ranged_hands+=2;amm=15;spli=1;
	        descr="The Master Crafted Combiflamer incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart. ";}// Bursts
	    if (thawep="Combiflamer"){attack=100;arp=1;range=10;ranged_hands+=2;amm=15;spli=1;
	        descr="A Boltgun with a one-shot Flamer strapped to the side.  It is useful for close quarters fighting.";}// Bursts
	    if (thawep="Twin Linked Bolters"){attack=70;arp=0;range=12;ranged_hands+=2;amm=30;spli=1;
	        descr="A Twin-linked Bolter consists of two Bolter weapons mounted side by side, typically on a vehicle or a special weapon platform.";}// Bursts

	    if (thawep="Heavy Bolter"){attack=120;arp=0;range=16;ranged_hands+=2;melee_hands+=1;amm=20;spli=1;
	        descr="An enormous Boltgun.This weapon can fire a hail of powerful bolts at the enemy.";}
	    if (thawep="Master Crafted Heavy Bolter"){attack=220;arp=1;range=16;ranged_hands+=2;amm=25;spli=1;
	        descr="A Master Crafted Heavy Bolter incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart";}
	    if (thawep="Storm Bolter"){attack=80;arp=0;range=10;ranged_hands+=2;amm=10;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;}
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="Compact, and double barreled, this bolt weapon is inaccurate but grants an enormous amount of firepower.";}
	    if (thawep="Flamer"){attack=350;arp=-1;range=2.1;ranged_hands+=2;amm=4;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=40;
	        }
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="Blackened at the tip, this weapon unleashes a torrent of burning promethium- all the better to cleanse sin and impurity with.";}
	    if (thawep="Underslung Flamer"){attack=200;arp=-1;range=2.1;amm=4;spli=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=35;
	    }
	    if (thawep="Incinerator"){attack=200;arp=-1;range=2.1;ranged_hands+=2;amm=4;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (string_count("Terminator",marine_armour[unit_array_position])>0) then melee_hands-=1;
	        if (marine_armour[unit_array_position]="Tartaros") then melee_hands-=1;
	        if (obj_ncombat.enemy=10) and (obj_ncombat.threat=7) then attack=300;
	        }
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	        descr="This flamer weapon includes special promethium and sacred oils.  It is particularly effective against Daemons and their ilk.";}
	    if (thawep="Heavy Flamer"){attack=500;arp=-1;range=2;ranged_hands+=2;melee_hands+=1;amm=8;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=60;
	        }
	        descr="A much larger and bulkier flamer.  Few armies carry them on hand, instead choosing to mount them to vehicles.";}
	    if (thawep="CCW Heavy Flamer"){attack=250;arp=-1;range=2.1;amm=6;spli=1;
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=60;
	    }
	    if (thawep="Inferno Cannon"){attack=400;arp=-1;range=3.1;spli=1;
	        if (information_wanted!="description") and (information_wanted!="description_long"){
	        // if (obj_ncombat.enemy=3) or (obj_ncombat.enemy=13) then attack=90;
	        }
	        descr="A huge, vehicle mounted flame weapon that fires with explosive force.  The resevoir is liable to explode.";}


	    if (thawep="Meltagun"){attack=250;arp=1;range=2.1;ranged_hands+=2;amm=4;
	        descr="A relatively quiet weapon, this gun vaporizes flesh and armour alike.  Due to heat dissipation it has only a short range.";}
	        if (thawep="Master Crafted Meltagun"){attack=250;arp=1;range=2.1;ranged_hands+=2;amm=4;
	        descr="A Master Crafted Meltagun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}
	    if (thawep="Multi-Melta"){attack=500;arp=1;range=4.1;ranged_hands+=2;melee_hands+=1;amm=8;spli=1;
	        descr="Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.";}
	    if (thawep="Plasma Pistol"){attack=90;arp=1;range=3.1;melee_hands+=1;
	        descr="A smaller version of the plasma gun, this dangerous-to-use weapon has exceptional armour-piercing capabilities.";}
	    if (thawep="Master Crafted Plasma Pistol"){attack=120;arp=0;range=3.1;melee_hands+=1;
	        descr="A Master Crafted Plasma Pistol incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}
	    if (thawep="Infernus Pistol"){attack=100;arp=1;range=2.1;melee_hands+=1;amm=4;
	        descr="The Infernus Pistol is a compact and portable flamethrower-style weapon. It unleashes a torrent of fiery promethium, which engulfs its targets in flames.";}
	    if (thawep="Plasma Gun"){attack=150;arp=1;range=12;ranged_hands+=2;spli=1;
	        descr="A 2-handed firearm that launches bolts of plasma.  They are considered both sacred and dangerous, occasionally overheating.";}
	    if (thawep="Master Crafted Plasma Gun"){attack=175;arp=1;range=14;ranged_hands+=2;spli=1;
	        descr="A Master Crafted Plasma Gun incorporates superior craftsmanship, advanced modifications, and enhancements compared to its standard counterpart.";}

	    if (thawep="Sniper Rifle"){attack=80;arp=0;range=18;ranged_hands+=2;melee_hands+=1;amm=20;

	        descr="Fires a solid shell and boasts powerful telescopic sights, allowing the user to target enemy weak points and distant foes.";}
	    if (thawep="Assault Cannon"){attack=240;arp=0;range=12;ranged_hands+=2;amm=5;spli=1;
	        descr="A heavy, rotary auto-cannon frequently used by Dreadnoughts and Terminators.  Has an incredible rate of fire.";
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	    }
	    if (thawep="Autocannon"){attack=180;arp=0;range=18;ranged_hands+=2;amm=25;spli=1;
	        descr="A rapid-firing weapon able to use a wide variety of ammunition, from mass-reactive explosive to solid shells.";
	        if (obj_controller.menu=1) and ((string_count("Terminator",marine_armour[0])>0) or (marine_armour[0]="Tartaros")) then ranged_hands-=1;
	    }
	    if (thawep="Missile Launcher"){attack=250;arp=0;range=24;ranged_hands+=2;melee_hands+=1;amm=6;spli=1;
	        descr="This heavy weapon is capable of firing either armour-piercing or fragmentation rockets.  Has low ammunition count.";}
	    if (thawep="Lascannon"){attack=200;arp=1;range=24;ranged_hands+=2;melee_hands+=1;amm=8;spli=0;
	        descr="A formidable laser weapon, this lascannon can pierce most vehicle or power armour from a tremendous range.";}

	    if (thawep="Conversion Beam Projector"){attack=500;arp=1;range=20;ranged_hands+=1;amm=1;spli=1;
	        descr="The Conversion Beam Projector is a heavy energy weapon that harnesses advanced technology to project a concentrated beam of destructive energy. It is capable of cutting through armour, vehicles, and even heavily fortified structures.";}
	    if (thawep="Integrated Bolters"){attack=75;arp=1;range=8.1;amm=20;spli=1;
	        descr="Integrated Bolters are a set of Bolter weapons that are integrated or built directly into the structure of the vehicle,armour or Dreadnought.";}
	    if (thawep="Power Fists"){attack=425;arp=0;range=1;melee_hands+=2;spli=1;
	        descr="While not quite as strong as two Power Fist, these artifacts allow the use of an additional, third weapon.";}


	    if (thawep="Close Combat Weapon"){attack=250;arp=1;range=1;melee_hands+=1;spli=1;
	        descr="While a variety of melee weapons are used by dreadnoughts, this power fist with flamer is the most common.";}

	    if (thawep="Twin Linked Heavy Bolter"){attack=240;arp=1;range=16;amm=20;spli=1;
	        descr="Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles. ";}
	    if (thawep="Twin Linked Lascannon"){attack=250;arp=1;range=20;amm=10;
	        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
	    if (thawep="Lascannons"){attack=300;arp=1;range=20;amm=5;
	        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
	    if (thawep="Heavy Bolters"){attack=320;arp=1;range=16;amm=10;spli=1;
	        descr="The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.";}
	    if (thawep="Whirlwind Missiles"){attack=400;arp=1;range=20;amm=6;spli=1;
	        descr="The Whirlwind Missile Launcher is a vehicle-mounted artillery weapon that launches a barrage of powerful missiles at the enemy.";}

					// Vehicle Upgrades
			if (equipment_1="Armoured Ceramite"){statt=20;special_description="";emor=1;
	        descr="Supplemental ceramite armour packages provide protection far beyond stock configurations.";}
			if (equipment_1="Artificer Hull"){statt=20;special_description="";emor=1;
	        descr="Replacing numerous structural members and armour plates with thrice-blessed replacements, the vehicle’s hull is upgraded to be a rare work of mechanical art.";}
			if (equipment_1="Heavy Armour"){statt=10;special_description="";emor=1;
	       	descr="Simple but effective, extra armour plates can be attached to most vehicles to provide extra protection.";}
			if (equipment_1="Lucifer Pattern Engine"){statt=5;special_description="";emor=1;
		    	descr="A significant upgrade over the more common patterns of Rhino-chassis engines, these engines provide greater output.";}

					// Vehicle Accessories
			if (thawep="Dozer Blades"){attack=60;arp=0;range=1;melee_hands+=1;spli=1
			   	descr="An attachment for the front of vehicles, useful for clearing difficult terrain and can be used as an improvised weapon. ";}
			if (thawep="Searchlight"){
					descr="A simple solution for fighting in dark environments, searchlights serve to illuminate enemies for easier targeting. ";}
			if (thawep="Smoke Launchers"){
					descr="Useful for providing concealment in open terrain, these launchers project wide-spectrum concealing smoke to prevent accurate targeting of the vehicle. ";}

					// Vehicle Utility Weapons
			if (thawep="HK Missile"){attack=350;arp=1;range=50;ranged_hands+=1;amm=1;spli=1;
			    descr="A single-use long-range anti-tank missile, this weapon can surgically destroy armoured targets in the opening stages of a battle.";}

					// Land Raider Front Mounts
			if (thawep="Twin Linked Heavy Bolter Mount"){attack=240;arp=0;range=16;amm=20;spli=1;
			    descr="Twin-linked Heavy Bolters are an upgraded version of the standard Heavy Bolter weapon, which is known for its high rate of fire and effectiveness against infantry and light vehicles. ";}
			if (thawep="Twin Linked Lascannon Mount"){attack=250;arp=1;range=20;amm=10;
			    descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
			if (thawep="Twin Linked Assault Cannon Mount"){attack=360;arp=0;range=12;amm=5;spli=1;
			    descr="A twin mount of rotary autocannons, boasting an incredible rate of fire.";}
			if (thawep="Reaper Autocannon Mount"){attack=250;arp=0;range=15;amm=25;spli=1;
			   descr="An archaic twin-linked autocannon design dating back to the Great Crusade. Effective against a variety of targets. ";}

					// Land Raider Sponsons
			if (thawep="Quad Linked Heavy Bolter Sponsons"){attack=480;arp=1;range=16;amm=10;spli=1;
					descr="Quad-linked Heavy Bolters are a significantly upgraded version of the standard Heavy Bolter mount; already punishing in a single mount, this quad mount is devastating against a variety of targets. ";}
			if (thawep="Twin Linked Lascannon Sponsons"){attack=375;arp=1;range=20;amm=5;
			    descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
			if (thawep="Hurricane Bolter Sponsons"){attack=405;arp=0;range=12;amm=20;spli=1;
			    descr="Hurricane Bolters are large hex-mount bolter arrays that are able to deliver a withering hail of anti-infantry fire at short ranges. ";}
			if (thawep="Flamestorm Cannon Sponsons"){attack=600;arp=1;range=3;amm=6;spli=1;
			    descr="A huge vehicle-mounted flamethrower, the heat produced by this terrifying weapon can crack even armoured ceramite. ";}
			if (thawep="Twin Linked Heavy Flamer Sponsons"){attack=550;arp=-1;range=2.1;amm=12;spli=1;
			    descr="A much larger and bulkier flamer.  Few armies carry them on hand, instead choosing to mount them to vehicles.";}
			if (thawep="Twin Linked Multi-Melta Sponsons"){attack=450;arp=1;range=4.1;amm=6;
			    descr="Though bearing longer range than the Meltagun, this weapon's great size usually restricts it to vehicles.";}
			if (thawep="Twin Linked Volkite Culverin Sponsons"){attack=480;arp=0;range=18;amm=25;spli=1;
					descr="An advanced thermal weapon from a bygone era, Volkite Culverins are able to ignite entire formations of enemy forces. ";}


				// Predator Turrets
				if (thawep="Twin Linked Lascannon Turret"){attack=250;arp=1;range=20;amm=10;
						descr="A Predator-compatible turret mounting a pair of anti-armour lascannons. ";}
				if (thawep="Autocannon Turret"){attack=130;arp=0;range=18;amm=50;spli=1;
				    descr="A Predator-compatible turret mounting a reliable all-purpose autocannon. ";}
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

				// Predator Sponsons
				if (thawep="Lascannon Sponsons"){attack=250;arp=1;range=20;amm=5;
		        descr="Lascannons are powerful anti-armour weapons that fire highly focused and devastating energy beams capable of penetrating even the toughest armour. ";}
				if (thawep="Heavy Bolter Sponsons"){attack=240;arp=0;range=16;amm=20;spli=1;
				    descr="The Heavy Bolter is a heavy weapon that fires larger and more powerful bolt shells compared to the standard Bolter.";}
				if (thawep="Heavy Flamer Sponsons"){attack=375;arp=-1;range=2.1;amm=6;spli=1;
				   	descr="A much larger and bulkier flamer. Few armies carry them on hand, instead choosing to mount them to vehicles. ";}
				if (thawep="Volkite Culverin Sponsons"){attack=320;arp=0;range=18;amm=25;spli=1;
						descr="An advanced thermal weapon from a bygone era, Volkite Culverins are able to ignite entire formations of enemy forces. ";}

	    if (base_group=false) and (obj_controller.stc_bonus[3]=2){
	        if (attack>0) then attack=round(attack*1.05);
	        // if (arp>0) then arp=round(arp*1.05);
	    }


	    if (information_wanted!="description") and (information_wanted!="description_long"){
	        if (base_group!=false){if (string_count("Dreadnought",marine_armour[unit_array_position])>0) and (marine_mobi[unit_array_position]="") then amm=-1;}
	        if (thawep="Whirlwind Missiles") then amm=6;

	        if (rending1=1){
	            var rend=choose(1,2,3,4,5,6);
	            if (rend=6){
	                if (attack>0) then attack=attack*2;
	                // if (arm>0) then arp=arp*2;
	            }
	        }
	        if (rang1=1){
	            attack=marine_attack[unit_array_position][0];// arp=arp*marine_attack[unit_array_position];
                var weapon = marine_attack[unit_array_position][3];
	            if (marine_might[unit_array_position]>0){
	                attack=attack*2;// arp=arp*2;
	            }
	            if (marine_spatial[unit_array_position]>0){
	                attack=attack*1.75;// arp=arp*1.75;
	            }
	            if (marine_fiery[unit_array_position]>0){
	                attack=attack*1.3;// arp=arp*1.3;
	            }
	        }
	        if (rang1>1){
	            attack=marine_ranged[unit_array_position][0];;
                var weapon = marine_ranged[unit_array_position][3];
	            // arp=arp*marine_ranged[unit_array_position];
	        }
	        if (obj_ncombat.melee=1) and (range=1){
	            attack=round(attack*1.1);// arp=round(arp*1.1);
	        }
	        if (range=1){
	            attack=round(attack*obj_ncombat.global_melee);
	            // arp=round(arp*obj_ncombat.global_melee);
	        }

            thawep=weapon.name;
            att2=attack;
            apa2=arp;
            rang2=range;
            ammo2=amm;
            spli2=spli;

            att[b]+=att1;
            apa[b]=apa1;
            range[b]=rang1;
            wep_num[b]+=1;
            splash[b]=spli1;
            wep[b]=thawep;
            goody=1;
	        // This is giving problems
	        if (melee_hands=0) and (base_group=true) and (is_dreadnought=false) and (i=2){
	            var attack;
	            attack=obj_ncombat.global_attack*10;
	            var b,goody,opn;b=0;goody=0;opn=0;
	            repeat(30){b+=1;
	                if (wep[b]="melee"){
	                    goody=b;
                        att[b]+=attack;
                        range[b]=1;
                        wep_num[b]+=1;
                        splash[b]=0;
                        ammo[b]=-1;
	                }
	                if (wep[b]="") and (opn=0) then opn=b;
	                if (goody=0){
	                    wep[opn]="melee";
                        att[opn]+=attack;
                        range[opn]=1;
                        wep_num[opn]=1;
                        splash[opn]=0;
                        ammo[opn]=-1;
	                }
	            }
	        }





	    }


	    obj_controller.temp[9000]+=string(thawep)+": "+string(melee_hands)+","+string(ranged_hands)+"|";
	}

	if (information_wanted!="description") and (information_wanted!="description_long"){
	    var b,goody,found,stack;b=0;goody=0;found=0;stack=1;

	    thawep=equipment_1;// 137 135 136 flip fix?


	    if (nuum!="") then stack=0;


	    repeat(60){b+=1;

	        // show_message(string(goody));

	        var canc;canc=false;
	        if (rang1>1) and (marine_ranged[unit_array_position]=0){
	             canc=true;
                 if (floor(rang1)==rang1) then canc=false
	        }
            if (canc=true) then goody=1;

	        if (goody=0){
	            if (stack=1) and (wep[b]=thawep) and (goody=0){
	                // if (thawep=wip1){
	                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
	                // }
	            }
	            if (stack=0) and (obj_ncombat.started=0) and (wep[b]="") and (goody=0) and (wep_solo[b]=""){
	                if (goody=0){
	                    att[b]+=att1;apa[b]=apa1;range[b]=rang1;wep_num[b]+=1;splash[b]=spli1;wep[b]=thawep;goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    ammo[b]=ammo1;

	                    var title;title=true;
	                    if (marine_type[unit_array_position]="Chapter Master") then title=false;
	                    if (marine_type[unit_array_position]="Master of Sanctity") then title=false;
	                    if (marine_type[unit_array_position]="Chief "+string(obj_ini.role[100,17])) then title=false;
	                    if (marine_type[unit_array_position]="Forge Master") then title=false;
	                    if (marine_type[unit_array_position]="Master of the Apothecarion") then title=false;
	                    if (title=true) then wep_title[b]=string(marine_type[unit_array_position]);
	                    wep_solo[b]=string(obj_ini.name[marine_co[unit_array_position],marine_id[unit_array_position]]);
	                }
	            }

	            if (stack=0) and (obj_ncombat.started=1) and (wep[b]=thawep) and (wep_solo[b]=nuum) and (goody=0){
	                att[b]+=att1;
                    apa[b]=apa1;
                    range[b]=rang1;
                    wep_num[b]+=1;
                    splash[b]=spli1;
                    wep[b]=thawep;goody=1;
	                // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}

	                var title=true;
                    if (unit_struct[unit_array_position].IsSpecialist("heads")) then title=false;

	                if (title=true) then wep_title[b]=string(marine_type[unit_array_position]);
	                wep_solo[b]=string(obj_ini.name[marine_co[unit_array_position],marine_id[unit_array_position]]);
	            }
	        }
	    }

	    b=0;
	    if (stack=1) and (goody=0){
	        repeat(60){b+=1;
	            var canc=false;
	            if (rang1>1) and (marine_ranged[unit_array_position]=0){
	                 canc=true;if (floor(rang1)==rang1) then canc=false
	            }

	            if (wep[b]="") and (goody=0) and (canc=false){
	                // if (thawep=wip1){
	                    att[b]+=att1;
                        apa[b]=apa1;
                        range[b]=rang1;
                        wep_num[b]+=1;
                        splash[b]=spli1;
                        wep[b]=thawep;
                        goody=1;
	                    // if (marine_type[unit_array_position]="Death Company") and (range[b]=1){att[b]+=att1;wep_num[b]+=1;wep_rnum[b]+=1;}
	                    if (obj_ncombat.started=0) then ammo[b]=ammo1;
	                // }
	            }
	        }
	    }


	}


}
