--24.07.27 LUA BY SEABAT MATCH HAWKEYE PRE-BETA EDM 24.07.22



dofile(current_mod_path.."/a-1_skyraider_damage.lua")

local vwv_a1_skyraider =  {

	Name 				=  'vwv_a1_skyraider',
	DisplayName			= _('A-1H Skyraider'),
	DisplayNameShort	= _('A-1H'),
	Cannon = "yes",

	Picture 			= "a_1_skyraider.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "a_1_skyraider",

	shape_table_data 	=
	{
		{
			file  	 	= 'a_1_skyraider',
			life  	 	= 30, -- lifebar
			vis   	 	= 3, -- visibility gain.
			desrt    	= 'a_1_skyraider_destroyed', -- Name of destroyed object file name
			fire  	 	= { 200, 1},
			username	= 'a_1_skyraider'
		},
		{
			name  = "a_1_skyraider_destroyed",
			file  = "a_1_skyraider_destroyed",
			fire  = { 240, 2}
		},
	},

	mapclasskey = "P0091000025",
	index       =  WSTYPE_PLACEHOLDER,
	attribute   =   {wsType_Air, wsType_Airplane, wsType_Battleplane, a_1_skyraider, "Battleplanes", "Refuelable"},
	Categories  =   {},
	M_empty				=	5429,
	M_nominal			=	8213,
	M_max				=	13975,
	M_fuel_max			=  	4000,
	H_max				=	8685,
	average_fuel_consumption	=	0.03,
	CAS_min				=	55,
	V_opt				=	135,
	V_take_off			=	65,
	V_land				=	62,
	has_afteburner			=	false,
	has_speedbrake			=	true,
	has_differential_stabilizer 	= 	false,

	
	main_gear_pos 			= 	{ -2.54, -1.42,   0.0},--from neg 1.4
	nose_gear_pos 			= 	{   0.8, -2.05,   0.0},--from neg 1.25
	
	--main_gear_pos 			= 	{ -2.54, -1.6,   0.0},--from 24.06.27 higher number lower gear
	--nose_gear_pos 			= 	{   0.8, -2.2,   0.0},--from 24.06.27 higher number higher gear
	
	--main_gear_pos                   = 	{ 5.030, -2.575, 1.779},
	--nose_gear_pos                   = 	{ 2.510, -2.125, 0.000}, -- TAIL WHEEL 
	
	
	--main_gear_pos                   = 	{ 5.030, -2.100, 1.779},
	--nose_gear_pos                   = 	{ 2.510, -1.620, 0.000}, -- TAIL WHEEL 

	
	
	
	nose_gear_wheel_diameter	=	0.754,
	main_gear_wheel_diameter	=	0.872,
	
	
	--nose_gear_amortizer_direct_stroke   		= 0.000,   -- down from nose_gear_pos !!! 
	--nose_gear_amortizer_reversal_stroke  		= -0.114,  -- up
	--nose_gear_amortizer_normal_weight_stroke 	= -0.077,  -- -0.20,   --  -0.050-0.325, hiking
	--nose_gear_hiking				=  0.200,

	--main_gear_amortizer_direct_stroke	 	=   0, --  down from main_gear_pos !!!
	--main_gear_amortizer_reversal_stroke  	    	=   -0.442, --  up 
	--main_gear_amortizer_normal_weight_stroke    	=   -0.143,-- 
	

	wing_tip_pos = {-0.82, 0.200,     7.5},

	radar_can_see_ground	=	true,
	AOA_take_off		=	0.16,
	stores_number		=	15,
	bank_angle_max		=	60,
	Ny_min			=	-3,
	Ny_max			=	7,
	tand_gear_max		=	3.3577,
	V_max_sea_level		=	145.0,
	V_max_h			=	165.0,
	wing_area		=	37.1,
	wing_span		=	15.24,
	wing_type 		= 	2,
	thrust_sum_max		=	7000,
	thrust_sum_ab		=	9000,
	Vy_max			=	10.8,
	length			=	15.96,
	height			=	5.28,
	flaps_maneuver		=	1,
	Mach_max		=	2.0,
	range			=	2540,
	RCS			=	5,
	Ny_max_e		=	7,
	detection_range_max	=	250,
	IR_emission_coeff	=	0.591,
	IR_emission_coeff_ab	=	2.50,
	engines_count		=	1,

	
	
	net_animation ={
	85, --LaunchBar
	521,
	},	
	
	launch_bar_connected_arg_value	= launch_bar_connected_arg_value_,
	
	mechanimations = {
	
	Door0 = {
            		{Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
            		{Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
            		{Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
	    	},	
	
			
	  
	FoldableWings 		= {
			{Transition 		= {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 10.0}}}}, Flags = {"Reversible"}},
			{Transition 		= {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 10.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
		},
		
		LaunchBar = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 1.00, "in", 10.4}}}}},
			{Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.93, "in", 14.4}}}}},
			{Transition = {"Any", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 10.02}}}}},--4.5 LaunchBar Hoch
            {Transition = {"Extend", "Stage"},   Sequence = {
					{C = {{"ChangeDriveTo", "Mechanical"}, {"Sleep", "for", 10.000}}},
					{C = {{"Arg", 85, "from", 1.00, "to", 0.92, "in", 10.600}}},
					{C = {{"Arg", 85, "from", 0.92, "to", 0.93, "in", 10.200}}},
					{C = {{"Sleep", "for", 0.15}}},
					{C = {{"Arg", 85, "from", 0.93, "to", 0.95, "in", 10.1, "sign", 2}}},
					{C = {{"Arg", 85, "from", 0.95, "to", 1.00, "in", 1.1}}},
				},
			},
			{Transition = {"Stage", "Pull"},  Sequence = {
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85,"from", 1.00, "to", launch_bar_connected_arg_value_, "in", 10.15}}},
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85, "to", 1.00, "speed", 0.1}}},
					{C = {{"ChangeDriveTo", "Mechanical"}, {"VelType", 2}, {"Arg", 85, "to", 1.00, "speed", 0.02}}},
					}
			},
			{Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "from", 1.00, "to", 1.00, "in", 10.2}}}}},
        },
		
		
		BRIDLE = 
        {
            {Transition = {"Any", "Stage"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2},{"Arg", 521, "to", 0.8, "in", 2.0}}}}},--F14B
            {Transition = {"Stage","Extend"}, Sequence = {{C = {{"Arg", 521, "to", 0.0, "in", 0.7}}}}},            
        },
		
		
    }, -- end of mechanimations

	LandRWCategories =
    {
        [1] =
		{
			Name = "AircraftCarrier",
        },
        [2] =
        {
			Name = "AircraftCarrier With Catapult",
        },
        [3] =
        {
			Name = "AircraftCarrier With Tramplin",
        },
    }, -- end of LandRWCategories
    TakeOffRWCategories =
        {
        [1] =
        {
			Name = "AircraftCarrier",
        },
        [2] =
        {
			Name = "AircraftCarrier With Catapult",
        },
        [3] =
        {
            Name = "AircraftCarrier With Tramplin",
        },
    }, -- end of TakeOffRWCategories

	engines_nozzles =
	{
		[1] =
		{
			pos 		=  {4.3,	0.24,	-0.672}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0, -- AFB cone diameter
			exhaust_length_ab	=	0,
			exhaust_length_ab_K	=	0.35,
			smokiness_level     = 	0.1,
		},
	}, -- end of engines_nozzles

	crew_size	 = 1,

	crew_members =
	{
			[1] = 
		{
			ejection_seat_name		= "AV8BNA_Pilot_seat",
			pilot_name		   		= "AV8BNA_Pilot",
			drop_canopy_name		= "AV8BNA_Canopy",
			drop_parachute_name		= "AV8BNA_Parachute",
			pos 					= {3.43, 0.703, 0.0},
			g_suit					= 2.0,
            bailout_arg 			= -1,
			}, -- end of [1]
	}, -- end of crew_members

	fires_pos =
	{
		[1] = 	{-2.117,	-0.9,	0},
		[2] = 	{0.500,	0.213,	0},
		[3] = 	{0.500,	0.213,	-2.182},
		[4] = 	{-0.82,	0.265,	2.774},
		[5] = 	{-0.82,	0.265,	-2.774},
		[6] = 	{-0.82,	0.255,	2.7274},
		[7] = 	{-0.82,	0.255,	-2.7274},
		[8] = 	{0.5,	-0.5,	2.7578},
		[9] = 	{0.5,	-0.5,	-2.578},
		[10] = 	{0.50,	0.084,	2.754},
		[11] = 	{0.50,	0.084,	-2.7534},
	}, -- end of fires_pos

	Countermeasures = {
		ECM = "AN/ALQ-165"
	},

	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 480,
		chaff = {default = 240, increment = 1, chargeSz = 1},
		flare = {default = 240,  increment = 1, chargeSz = 1},
	},

	chaff_flare_dispenser 	= {
		{ dir =  {0, -1, 0}, pos =   {-3.027,  0.35, -0.3}, }, -- Chaff L
		{ dir =  {0, -1, 0}, pos =   {-3.727,  0.35, 0.3}, },  -- Chaff R
	    { dir =  {0, -1,  0}, pos =  {-3.032,  0.35, -0.32}, }, -- Flares L	
		{ dir =  {0, -1,  0}, pos =  {-3.732,  0.35,  0.32}, }, -- Flares R
	},

	Failures = {
			{ id = 'asc', 		label = _('ASC'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hydro',  	label = _('HYDRO'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'l_engine',  label = _('L-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'r_engine',  label = _('R-ENGINE'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'radar',  	label = _('RADAR'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'eos',  		label = _('EOS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'helmet',  	label = _('HELMET'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			--{ id = 'mlws',  	label = _('MLWS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'rws',  		label = _('RWS'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'ecm',   	label = _('ECM'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'hud',  		label = _('HUD'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
			{ id = 'mfd',  		label = _('MFD'), 	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},

----------------------------------------------------------- Guns from VWV F-8-----------------------------------------------------------------------------
	Guns = {
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.61,  -0.775,-0.488},
			muzzle_pos_connector	= "gunpoint_1",
			supply_position			= {2.8753, 0, -0.2},	-- approx
			drop_cartridge			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_1",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg = 432,duration = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 327  , add_speed = {0, -3, 10}},
			},
		}),			-- LEFT
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.61,  -0.773, 0.499},
			muzzle_pos_connector	= "gunpoint_2",
			supply_position			= {2.8753, 0,  0.2},	-- approx
			drop_cartridge 			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_2",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg 				= 433, duration  = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 328, add_speed = {0,  3, 10}},
			},
		}),
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.94,  -0.914,-0.488},
			muzzle_pos_connector	= "gunpoint_3",
			supply_position			= {2.8753, 0, -0.2},	-- approx
			drop_cartridge			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_1",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg = 432,duration = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 327  , add_speed = {0, -3, 10}},
			},
		}),			-- LEFT
		gun_mount("M_39",
		{
			count = 280
		},
		{
			muzzle_pos				= {5.94,  -0.912, 0.499},
			muzzle_pos_connector	= "gunpoint_4",
			supply_position			= {2.8753, 0,  0.2},	-- approx
			drop_cartridge 			= 204,		-- cartridge_50cal
			ejector_pos_connector	= "ejector_2",
			ejector_dir 			= {-2,0,0},
			effects = {
				{name = "FireEffect", arg 				= 433, duration  = 0.02, attenuation = 2 , light_pos = {0.5,0,0}},
				{name = "SmokeEffect",gas_deflector_arg = 328, add_speed = {0,  3, 10}},
			},
		})
	},
	ammo_type_default = 2, -- interface to set desired ammunition mix in ME (DCSCORE-1104)
	ammo_type ={_("HEI High Explosive Incendiary"),
				_("CM Combat Mix"),
				_("AP Armor Piercing"),
				_("TP Target Practice"),
	},
----------------------------------------------------------------------Pylons---------------------------------------------------------------------------------------------------------------
	Pylons =     {

        pylon(1, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_1", arg = 308, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {0.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {0.60, -.01 ,0 }},--Hawkeye 5 inch unguided rockets
				
				
		   }
        ),

        pylon(2, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_2", arg = 309, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {0.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {0.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {0.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {0.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {0.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.107, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {0.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {0.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {0.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {0.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {0.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

       pylon(3, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_3", arg = 310, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, 0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.104, 0.0124 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.132, 0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

      pylon(4, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_4", arg = 311, FiX = 0, FiY = 0, FiZ = 2},
           {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, 0.0120 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.104, 0.0120 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.135, 0.0118 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

       pylon(5, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_5", arg = 312, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, 0.0118 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.104, 0.0118 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.104, 0.0118 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

       pylon(6, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_6", arg = 313, FiX = 0, FiY = 0, FiZ = 2},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, 0.0125 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {-0.2, -0.104, 0.0125 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.104, 0.0125 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

        pylon(7, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_7", arg = 314, FiX = 0, FiY = 0, FiZ = 2},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, -0.0125 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.0, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
			}
        ),

        pylon(8, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_8", arg = 314},
            {
                { CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, -0.0118 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.0, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.02 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
				
				
			}
        ),
		
        pylon(9, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_9", arg = 314},
           {
                { CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, -0.0120 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.135, -0.0118 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.02 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
		   }
        ),
			
       pylon(10, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_10", arg = 315},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.104, -0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {-0.2, -0.132, -0.0124 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.02 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
		   }
        ),
			
       pylon(11, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_11", arg = 316},
            {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, -0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.0, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.02 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),
			
        pylon(12, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_12", arg = 317},
             {
				{ CLSID = "{AN_M30A1}" ,attach_point_position = {.0, -.05 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" ,attach_point_position = {.0, -.1 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M81}" ,attach_point_position = {.0, .05 ,0 }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" ,attach_point_position = {.0, .05 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{AN-M64}" ,attach_point_position = {.0, -.15 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {-0.2, -0.107, -0.0124 }},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}" ,attach_point_position = {.0, .05 ,0 }},--M117 1x 750 lbs				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.0, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.0, -.150 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.0, -.050 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.0, .025 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{tinytim}" ,attach_point_position = {.60, -.01 ,0 }},--Hawkeye 5 inch unguided rocket
				
				
				{ CLSID = "{HVAR}" ,attach_point_position = {0.00, -.02 ,0 }},--FROM CUESTRA BRO F4U CORSAIR
			}
        ),
			
        pylon(13, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_13", arg = 318},
             {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.00, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.00, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.00, -.07 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.00, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.08, .08 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.08, .08 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}"	,attach_point_position = {.00, .1 ,0 }},--M117 1x 750 lbs
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" 	,attach_point_position = {.00, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" 	,attach_point_position = {.0, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" 	,attach_point_position = {.0, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"	,attach_point_position = {.0, -.1 ,0 }},--Mk-84 - 2000lb GP Bomb LD				
				
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" 				,attach_point_position = {.00, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" 	,attach_point_position = {.00, -.15 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" 	,attach_point_position = {.00, -.15 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				
				
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.00, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				{ CLSID = "{AV8BNA_AERO1D}" ,attach_point_position = {.00, .1 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{LTF_5B}" ,attach_point_position = {-.2, -.15 ,0 }},--Torpedo
				
			}
        ),
			
        pylon(14, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_14", arg = 319},
             {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.07 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.1 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				
				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .15 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},
				
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
				
		   }
        ),
			
        pylon(15, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_15", arg = 320},
             {
				{ CLSID = "{AN_M30A1}" 	,attach_point_position = {.500, .005 ,0 }},--AN-M30A1 100 lb GP HE (57 lb TNT)
				{ CLSID = "{AN_M57}" 	,attach_point_position = {.4500, -.05 ,0 }},--AN-M57A1 250 lb GP HE (129 lb TNT)
				{ CLSID = "{AN-M64}" 	,attach_point_position = {.500, -.07 ,0 }},--AN-M64 500 lb GP HE (274 lb Comp B)
				{ CLSID = "{AN_M65}" 	,attach_point_position = {.35, -.1 ,0 }},--AN-M65A1 1000 lb GP HE (595 lb Comp B)
				{ CLSID = "{AN-M81}" 	,attach_point_position = {.5, .1 ,0  }},--AN-M81 260 lb Fragmentation (34.1 lb Comp B)
				{ CLSID = "{AN-M88}" 	,attach_point_position = {.5, .1 ,0 }},--AN-M88 216 lb Fragmentation (47 lb Comp B)
				{ CLSID = "{00F5DAC4-0466-4122-998F-B1A298E34113}",attach_point_position = {.500, .1 ,0 }},--M117 1x 750 lbs
				
				{ CLSID = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}" ,attach_point_position = {.45, -.1 ,0 }},--Mk-20 Rockeye - 490lbs CBU, 247 x HEAT Bomblets
				{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}" ,attach_point_position = {.450, -.05 ,0 	}},--Mk-82 - 500lb GP Bomb LD
				{ CLSID = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}" ,attach_point_position = {.450, -.07 ,0 	}},--Mk83 - 1000LB GP BOMB LD
				{ CLSID = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}" ,attach_point_position = {.3, -.1 ,0 }},--Mk-84 - 2000lb GP Bomb LD		
				{ CLSID = "{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}" ,attach_point_position = {.5, .1 ,0 }},--SUU-25 x 8 LUU-2 - Target Marker Flares
				
				{ CLSID = "{AV8BNA_AERO1D}" 	,attach_point_position = {.600, .15 ,0 }},--AERO 1D 300 GalFuelTank AV8B Harrier good for Skyraider
				{ CLSID = "{DFT-150gal}"		,attach_point_position = {.700, .1 ,0 }},
				{ CLSID = "{DFT-150gal_EMPTY}"	,attach_point_position = {.700, .1 ,0 }},
				
				{ CLSID = "{3xM8_ROCKETS_IN_TUBES}" ,attach_point_position = {.4500, -.01 ,0 }},--3xM8_ROCKETS_IN_TUBES
				{ CLSID = "{3DFB7321-AB0E-11d7-9897-000476191836}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61 pod - 19 x 2.75 Hydra, UnGd Rkts M156, Wht Phos
				{ CLSID = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" ,attach_point_position = {.4500, -.13 ,0 }},--LAU-61R pod - 19 x 2.75 Hydra, UnGd Rkts M151, HE
			}
        ),
	},
   		
	
	Tasks = {
		aircraft_task(GroundAttack),
      	aircraft_task(CAS),
       	aircraft_task(AFAC),
		aircraft_task(RunwayAttack),
		aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(CAS),

	SFM_Data = {
		aerodynamics = 
		{
			Cy0	=	0,
			Mzalfa	=	6,
			Mzalfadt	=	1,
			kjx = 2.95,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.0268,
			cx_flap = 0.06,
			cy_flap = 0.4,
			cx_brk = 0.085,
			table_data = 
			{
			--      M	 Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0.0,	0.0185,		0.055,		0.08,		0.22,	0.65,	25.0,	1.2 	},
				{0.2,	0.0185,		0.055,		0.08,		0.22,	1.80,	30.0,	1.2     },
				{0.4,	0.0519,		0.055,		0.08,	   	0.22,	3.00,	30.0,	1.2     },
				{0.6,	0.0510,		0.055,		0.05,		0.28,	4.20,	28.0,	1.2     },
				{0.7,	0.0510,		0.055,		0.05,		0.28,	4.20,	27.0,	1.15    },
				{0.8,	0.115,		0.055,		0.05,		0.28,	4.20,	25.7,	1.1     },
				{0.9,	0.200,		0.058,		0.09,		0.20,	4.20,	23.1,	1.07    },
				{1.0,	0.200,		0.062,		0.17,		0.15,	4.20,	18.9,	1.04    },
				{1.1,	0.200,		0.062,	   	0.235,		0.09,	3.78,	17.4,	1.02    },
				{1.2,	0.200,		0.062,	   	0.285,		0.08,	2.94,	17.0,	1.00 	},		
				{1.3,	0.200,		0.06,	   	0.29,		0.10,	2.10,	16.0,	0.92 	},				
				{1.4,	0.200,		0.056,	   	0.3,		0.136,	1.80,	15.0,	0.80 	},					
				{1.6,	0.200,		0.052,	   	0.34,		0.21,	1.08,	13.0,	0.7 	},					
				{1.8,	0.0400,		0.042,	   	0.34,		2.43,	0.96,	12.0,	0.55 	},		
				{2.2,	0.0400,		0.037,	   	0.49,		3.5,	0.84,	 10.0,	0.37 	},					
				{2.5,	0.0400,		0.033,		0.6,		4.7,	0.84,	 9.0,	0.3 	},		
				{3.9,	0.0400,		0.023,		0.9,		6.0,	0.84,	 7.0,	0.2		},				
			}
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			typeng	=	3,
			hMaxEng	=	19.5,
			dcx_eng	=	0.0114,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	7000,
			dpdh_f	=	9000.0,
			table_data = {
			--   M		Pmax		 Pfor
				{0.0,	65000,		112000},
				{0.2,	64000,		100000},
				{0.4,	62000,		105000},
				{0.6,	63000,		107000},
				{0.7,	65000,		110000},
				{0.8,	65000,		120000},
				{0.9,	65000,		135000},
				{1.0,	67000,		150000},
				{1.1,	63000,		158000},
				{1.2,	 94000,		168000},
				{1.3,	 84000,		185000},
				{1.4,	 71000,		100000},
				{1.6,	 34000,		118000},
				{1.8,	 19000,		137000},
				{2.2,	 17000,		170000},
				{2.5,	 19000,		190000},
				{3.9,	 82000,		110000},
				}                 
		}, -- end of engine
	},


	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
		[0] =  {critical_damage = 15, args = {296}},  -- pilot area
		[1] =  {critical_damage = 15, args = {297}},  -- copilot area
		[2] =  {critical_damage = 15, args = {146}},  -- nose bottom
		[3] =  {critical_damage = 2, args = {235}},   -- elevator left
		[4] =  {critical_damage = 2, args = {233}},   -- elevator right
		[5] =  {critical_damage = 20, args = {213}},  -- pod left
		[6] =  {critical_damage = 20, args = {223}},  -- pod right
		[7] =  {critical_damage = 5, args = {159}},   -- Vertical stabilizer
		[8] =  {critical_damage = 20, args = {152}},  -- fuselage bottom
		[9] =  {critical_damage = 15, args = {154}},  -- cabin left
		[10] =  {critical_damage = 15, args = {153}}, -- cabin right
		[11] =  {critical_damage = 20, args = {156}}, -- under tail	
		[12] =  {critical_damage = 8, args = {157}}, -- fuselage rear left
		[13] =  {critical_damage = 8, args = {158}}, -- fuselage rear right
		[12] =  {critical_damage = 15, args = {260}},  -- copilot area
		[13] =  {critical_damage = 15, args = {261}},  -- nose bottom
		[14] =  {critical_damage = 2, args = {262}},   -- elevator left
		[15] =  {critical_damage = 2, args = {263}},   -- elevator right
		[16] =  {critical_damage = 20, args = {264}},  -- pod left
		[17] =  {critical_damage = 20, args = {265}},  -- pod right
		[18] =  {critical_damage = 5, args = {266}},   -- Vertical stabilizer
	},
	
	DamageParts = 
	{  
		
		
	},
	
	lights_data = {
		typename = "collection",
		lights = {
			[WOLALIGHT_NAVLIGHTS] = {
				typename = "Collection",
				lights = {
					[1] = {
						typename = "collection",
						lights = {
			{
				typename  = "omnilight",
				connector = "BANO_0",
				color     = {1.0, 1.0, 1.0, 0.333},
				position  = {-8.880, 0.687, 0.000},
				argument  = 192,
				movable   = false,
			},					
			{
				typename  = "omnilight",
				connector = "BANO_1",
				color     = {0.99, 0.11, 0.3, 0.333},
				position  = {-0.406, -0.480, -3.901},
				argument  = 190,
				movable   = false,
			},
			{
				typename  = "omnilight",
				connector = "BANO_2",
				color     = {0.0, 0.894, 0.6, 0.333},
				position  = {-0.406, -0.480,  3.901},
				argument  = 191,
				movable   = false,
			},
					{ 
						typename = "argumentlight", argument = 0,
					},
					{ 
						typename = "argumentlight", argument = 3,
					},
					{ 
						typename = "argumentlight", argument = 5,
					},		
						},
					},
				
				},
			},--must be collection
			[WOLALIGHT_SPOTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  -0.349}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", argument = 208,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.206, -0.700,  0.349}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
				},
			},
			[WOLALIGHT_TAXI_LIGHTS] = {
				typename = "collection",
				lights = {
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  -0.249}, connector = "MAIN_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
					{
						typename = "collection",
						lights = {
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", argument = 209,
								proto = lamp_prototypes.FPP_7,
								movable = true,
							},
							{
								typename = "spotlight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR",
								proto = lamp_prototypes.FPP_7_halo,
								movable = true,
							},
							{
								typename = "omnilight",position  = {2.006, -0.700,  0.249}, connector = "RESERV_SPOT_PTR", pos_correction = {0.25, 0.0, 0.0},
								proto = lamp_prototypes.FPP_7, range = 8.0,
								movable = true,
							},
						},
					},
				},
			},
			[WOLALIGHT_STROBES] = {
				typename = "collection",
				lights = {
					{
						typename = "Collection",
						lights = {
							{
								typename = "RotatingBeacon",position  = {-4.206, 3.615,  0.00}, connector = "RED_BEACON",color = {0.8, 0.0, 0.0}, argument = 193,
								proto = lamp_prototypes.MSL_4,
							},
							{
								typename  = "omnilight",position  = {-4.206, 3.615,  0.00},connector = "BANO_1",color  = {0.8, 0.0, 0.0},
								movable   = false,
							},						
						},
					},
				},
			},
			[WOLALIGHT_FORMATION_LIGHTS] = {
				typename = "collection",
				lights = {
					{
						typename = "argumentlight", argument = 200,position  = {-1.206, 0.615,  -4.00}
					},
					{
						typename = "argumentlight", argument = 201,position  = {-1.206, 0.615,  4.00}
					},
					{
						typename = "argumentlight", argument = 202,
					},
					{
						typename = "argumentlight", argument = 203,
					},
				},
			},
		}, 
	},
}

add_aircraft(vwv_a1_skyraider)