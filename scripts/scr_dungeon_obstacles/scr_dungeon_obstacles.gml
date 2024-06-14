global.obstacle_class_data = {
    "trained_technology" : {
        modifiers : {
            equipment : {
                name : [
                    {
                        name:"servo harness", 
                        mod_val:10,
                        flavour : "aided by their Servo Harness"
                    }
                ],
            },
            traits :[
                {
                    mod_val:10,
                    name : "tinkerer",
                    flavour : "{name} is adebt at understanding obscure mechanism",
                },
                {
                    mod_val:10,
                    name : "mars_trained",
                    flavour : "their extensive training on mars enables them to approach the task logically",
                },
                {
                    mod_val:10,
                    name : "technophobe",
                    flavour : "{name} dislikes such work",
                },                              
            ]            
        }
    }
}

global.obstacles = {
	blast_door : {
		name : "Blast Door",
		description : "a sturdy blast door stands in the way of your progress",
		solutions : [
			{
				name :"bypass",
				tests :[
					{
						attribute :eStats.technology,
						base_difficulty : 10,
						modifiers : {
							equipment : {
								name : [
    								{
    									name:"servo harness", 
    									mod_val:10,
    									flavour : "aided by their Servo Harness"
    								}
                                ],
							},
                            traits :[
                                {
                                    name : "tinkerer",
                                    flavour : "{name} is adebt at understanding obscure mechanism",
                                }
                            ]
						}
					},
                ],
                class : ["trained_technology"],				
				description : "attempt to bypass the door at the control panel",
				stat_icon : eStats.technology,
                result_chart : [
                    [-1, 
                        {
                            result_text :"{name_role} {flavour1},unfortunatly {name} is unable to figure out the mechanism and soon gives up",
                            result_effects : {
                                action_points : -1,
                                damage : "moderate"
                            },
                        }
                    ],
                    [100, 
                        {
                            result_text :"{name_role} finds that the mechanism is simple enough and quickly and efficiently directs some power into the system and opens the door",
                            result_effects : {
                                action_points : 0
                            },
                        }
                    ],                    
                ],                
			},
			{
				name :"divine",
				requirements : {
					group:"libs", 
					skill:"divination",
				},
				tests :[
					{
						attribute :eStats.intelligence,
						base_difficulty : 0,
						modifiers : {
						}
					}
				],
				description : "attempt to divine the door code",
				stat_icon : eStats.intelligence
			},
			{
				name :"Melta Blast",
				requirements : {
					weapon:{
						tag:[
                            {
                                name:"melta",
                            }
                        ]
					},
				},
				tests :[
					/*{
						attribute : "luck",
						base_difficulty : 10,
					},*/
					{
						attribute :eStats.ballistic_skill,
						base_difficulty : 0,
						modifiers : {
							weapon : {
								tag : [
									{
										name:"heavy_weapon",
										mod_val:20, 
										flavour:"The Heavy Weapon Blasts with ease"
									},
									{
										name:"pistol",
										mod_val:-20, 
										flavour:"The Lightweight pistol struggles"
									},	
								]								
							}
						}					
					}				
				],
				description : "Melt the Door with a melta blast",
                result_chart : [
                    [-60, 
                        {
                            result_text :"{name_role} fires on the door {flavour1}, The door appears to have more to it than it seems and the melta blast after searing the surface reflects off the surface below",
                            result_effects : {
                                action_points : -2,
                                damage : "moderate"
                            },
                        }
                    ],
                    [-20, 
                        {
                            result_text :"{name_role} fires on the door {flavour1}, after several shots the door remains mostly intact and it becomes apparent that it has been built far more robustly than origionally thought",
                            result_effects : {
                                action_points : -2
                            },
                        }
                    ],
                    [0, 
                        {
                            result_text :"{name_role} fires on the door {flavour1}, eventually after several shots the door lock disengages and the door swings open",
                            result_effects : {
                                action_points : -2
                            },
                        }
                    ],
                    [100, 
                        {
                            result_text :"{name_role}fires on the door {flavour1}, {name}'s shot is perfect and the door imediatly flops open as its central mecanism is destroyed",
                            result_effects : {
                                action_points : 0,
                                loot :["archeotech", "basic"]
                            },
                        }
                    ]                    
                ],                
				stat_icon : eStats.ballistic_skill
			},
			{
				name :"Find Way Round",
				//requirements : ["melta"],
				tests :[
					{
						attribute : eStats.wisdom,
						base_difficulty : -20,
                        modifiers : {
                            traits : [
                                {
                                    name : "observant",
                                    mod_val:10, 
                                    flavour:"observational tendancies come in handy"
                                }
                            ]
                        }				
					}				
				],
				result_chart : [
					[-60, 
                        {
    						result_text :"{name_role} Is able to find what they think is a way around in the form of a small hidden chamber, however upon entering the side chamber another door seals shut leaving them trpped in a dissused control room. It takes several minutes from {role} to escape by eventually battering the door down",
    						result_effects : {
                                action_points : -2
                            },
    					}
                    ],
                    [-1, 
                        {
                            result_text :"{name_role} finds nothing though they search for many hours",
                            result_effects : {
                                action_points : -1
                            },
                        }
                    ],
                    [40, 
                        {
                            result_text :"{name_role} evetnually finds a small service duct, any security measures that once stopped passage have since been eroded and a way through is found",
                            result_effects : {
                                action_points : -2
                            },
                        }
                    ],
                    [100, 
                        {
                            result_text :"{name_role} examines every inch of the room, an almost imperceptiable breeze brings their attention to a statue that is heaved out the way to reveal what was probably some sort of redundancy escape route, it provides a quick route through and also provisions some archeotype equipment stashed for the convinince of the tunnels intended user.",
                            result_effects : {
                                action_points : 0,
                                loot :["archeotech", "basic"]
                            },
                        }
                    ]                    
				],
				class : ["perception"],
				description : "Try find another way through",
				stat_icon : eStats.wisdom
			}			
		]
	},
    "hidde_nid":{
        name: "Hidden Tyranid",
        description: "A deadly Tyranid lurks in the shadows, ready to strike at any moment.",
        solutions: [
            {
                name: "Heightened Awareness",
                tests: [
                    {
                        attribute: eStats.wisdom,
                        base_difficulty: 55,
                        modifiers: {
                            equipment: [["augmented optics", 15]]
                        }
                    },
                    {
                        attribute: "intelligence",
                        base_difficulty: 50,
                        modifiers: {}
                    }
                ],
                description: "Maintain heightened awareness and use advanced optics to spot any subtle movements or signs of the hidden Tyranid.",
                stat_icon: "perception"
            },
            {
                name: "Scout and Recon",
                requirements: {
                    skill: "scouting"
                },
                tests: [
                    {
                        attribute: eStats.dexterity,
                        base_difficulty: 50,
                        modifiers: {}
                    },
                    {
                        attribute: "dexterity",
                        base_difficulty: 45,
                        modifiers: {
                            equipment: [
                                {

                                }
                            ]
                        }
                    }
                ],
                description: "Send out scouts to recon the area, utilizing camouflage and keen perception to detect the hidden Tyranid.",
                stat_icon: "perception"
            },
            {
                name: "Bait and Ambush",
                tests: [
                    {
                        attribute: "charisma",
                        base_difficulty: 40,
                        modifiers: {}
                    },
                    {
                        attribute: "intelligence",
                        base_difficulty: 55,
                        modifiers: {}
                    }
                ],
                description: "Set up a bait and ambush strategy, luring out the hidden Tyranid with clever tactics and intelligence.",
                stat_icon: "charisma"
            },
            {
                name: "Biological Detection",
                requirements: {
                    traits : [
                        {
                            name : "tyranic_war_vet"
                        }
                    ]
                },
                tests: [
                    {
                        attribute: eStats.intelligence,
                        base_difficulty: 60,
                        modifiers: {}
                    }
                ],
                description: "Utilize knowledge of Tyranid biology to anticipate its behavior and locate its hidden presence.",
                stat_icon: "intelligence"
            }
        ]
    }
}

/*{
    name: "Large Crevasse",
    description: "A gaping chasm stretches before you, blocking your path.",
    solutions: [
        {
            name: "Rope Bridge",
            requirements: {
                equipment: ["rope"]
            },
            tests: [
                {
                    attribute: "dexterity",
                    base_difficulty: 50,
                    modifiers: {
                        equipment: [["climbing harness", 10]]
                    }
                }
            ],
            description: "Attempt to traverse the crevasse by crossing a makeshift rope bridge.",
            stat_icon: "dexterity"
        },
        {
            name: "Leap of Faith",
            tests: [
                {
                    attribute: "strength",
                    base_difficulty: 40,
                    modifiers: {
                        equipment: [["adrenaline injection", 15]]
                    }
                }
            ],
            description: "Take a daring leap across the crevasse, relying on your strength and agility.",
            stat_icon: "strength"
        },
        {
            name: "Survey",
            requirements: {
                skill: "surveying"
            },
            tests: [
                {
                    attribute: "intelligence",
                    base_difficulty: 60,
                    modifiers: {}
                }
            ],
            description: "Carefully study the crevasse to find a safe path around or across.",
            stat_icon: "intelligence"
        },
        {
            name: "Create Bridge",
            requirements: {
                skill: "engineering"
            },
            tests: [
                {
                    attribute: "technology",
                    base_difficulty: 50,
                    modifiers: {}
                }
            ],
            description: "Use engineering skills to construct a sturdy bridge over the crevasse.",
            stat_icon: "technology"
        }
    ]
}


{
    name: "Sentry Gun",
    description: "A menacing sentry gun guards the area, its barrels trained on any intruders.",
    solutions: [
        {
            name: "Disable with Hacking",
            requirements: {
                skill: "hacking"
            },
            tests: [
                {
                    attribute: "technology",
                    base_difficulty: 60,
                    modifiers: {}
                }
            ],
            description: "Attempt to hack into the sentry gun's control system and disable it remotely.",
            stat_icon: "technology"
        },
        {
            name: "Stealth Approach",
            tests: [
                {
                    attribute: "dexterity",
                    base_difficulty: 50,
                    modifiers: {
                        equipment: [["stealth suit", 10]]
                    }
                }
            ],
            description: "Sneak past the sentry gun using stealth and agility.",
            stat_icon: "dexterity"
        },
        {
            name: "Distract with Decoy",
            requirements: {
                equipment: ["decoy device"]
            },
            tests: [
                {
                    attribute: "charisma",
                    base_difficulty: 40,
                    modifiers: {}
                }
            ],
            description: "Deploy a decoy device to draw the sentry gun's attention away from you.",
            stat_icon: "charisma"
        },
        {
            name: "Disarm Manually",
            tests: [
                {
                    attribute: "intelligence",
                    base_difficulty: 50,
                    modifiers: {
                        equipment: [["toolkit", 10]]
                    }
                }
            ],
            description: "Use your intelligence and tools to disarm the sentry gun manually.",
            stat_icon: "intelligence"
        }
    ]
}

{
    name: "Hidden Passage",
    description: "A secret passage lies concealed somewhere in the vicinity.",
    solutions: [
        {
            name: "Search Intensively",
            tests: [
                {
                    attribute: "intelligence",
                    base_difficulty: 50,
                    modifiers: {}
                },
                {
                    attribute: "wisdom",
                    base_difficulty: 40,
                    modifiers: {}
                }
            ],
            description: "Conduct a thorough search, relying on intelligence and wisdom to uncover the hidden passage.",
            stat_icon: "intelligence"
        },
        {
            name: "Listen Carefully",
            tests: [
                {
                    attribute: "wisdom",
                    base_difficulty: 45,
                    modifiers: {
                        equipment: [["listening device", 10]]
                    }
                },
                {
                    attribute: "luck",
                    base_difficulty: 50,
                    modifiers: {}
                }
            ],
            description: "Listen attentively for any subtle clues or sounds that may reveal the location of the hidden passage.",
            stat_icon: "wisdom"
        },
        {
            name: "Use Historical Knowledge",
            requirements: {
                skill: "history"
            },
            tests: [
                {
                    attribute: "intelligence",
                    base_difficulty: 55,
                    modifiers: {}
                }
            ],
            description: "Apply knowledge of historical architecture or secret passages to deduce the likely location of the hidden passage.",
            stat_icon: "intelligence"
        },
        {
            name: "Feel for Drafts",
            tests: [
                {
                    attribute: "dexterity",
                    base_difficulty: 40,
                    modifiers: {}
                },
                {
                    attribute: "constitution",
                    base_difficulty: 45,
                    modifiers: {
                        equipment: [["torch", 10]]
                    }
                }
            ],
            description: "Sensitively feel for air currents or drafts that may indicate the presence of a hidden passage.",
            stat_icon: "dexterity"
        }
    ]
}
{
    name: "Sheer Cliff",
    description: "A towering cliff looms before you, its sheer face seemingly insurmountable.",
    solutions: [
        {
            name: "Power Climb",
            requirements: {
                equipment: ["jump pack"]
            },
            tests: [
                {
                    attribute: "strength",
                    base_difficulty: 60,
                    modifiers: {
                        equipment: [["power armor", 20]]
                    }
                },
                {
                    attribute: "dexterity",
                    base_difficulty: 50,
                    modifiers: {}
                }
            ],
            description: "Utilize the strength of your power armor and the agility of your jump pack to ascend the cliff with powerful leaps.",
            stat_icon: "strength"
        },
        {
            name: "Tactical Ascend",
            tests: [
                {
                    attribute: "intelligence",
                    base_difficulty: 55,
                    modifiers: {
                        equipment: [["grapnel launcher", 15]]
                    }
                }
            ],
            description: "Strategically plan your ascent using a grapnel launcher to secure handholds and footholds along the cliff face.",
            stat_icon: "intelligence"
        },
        {
            name: "Mountain Climb",
            requirements: {
                skill: "climbing"
            },
            tests: [
                {
                    attribute: "dexterity",
                    base_difficulty: 50,
                    modifiers: {}
                },
                {
                    attribute: "constitution",
                    base_difficulty: 45,
                    modifiers: {
                        equipment: [["climbing harness", 10]]
                    }
                }
            ],
            description: "Apply your skill in climbing along with suitable equipment to scale the cliff using traditional climbing techniques.",
            stat_icon: "dexterity"
        },
        {
            name: "Scout and Scale",
            tests: [
                {
                    attribute: "perception",
                    base_difficulty: 45,
                    modifiers: {
                        equipment: [["magnoculars", 10]]
                    }
                },
                {
                    attribute: "luck",
                    base_difficulty: 50,
                    modifiers: {}
                }
            ],
            description: "Scout the cliff for potential weaknesses or pathways and then scale it using quick reactions and luck.",
            stat_icon: "perception"
        }
    ]
}
*/