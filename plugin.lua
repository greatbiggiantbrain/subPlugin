-- ##################################
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- !!!!!!!! START REQUIRED !!!!!!!!!!
-- ##################################

-- !!!!!!!! REQUIRED !!!!!!!!!!
-- !!!!!!!! REQUIRED !!!!!!!!!!
PluginInfo =
{
  Name = "Brain Tabs",
  Version = "0.01",
  Id = "bb7dabfa-2b4a-44b9-8123-e654bd2d50b7",
  Description = "Trying to put tabs in plugins!",
  ShowDebug = false,
  InstallPath = "brian\\fred\\pickle"
};

blockCol = {0x99, 0x33, 0xff};

-------------------------------------
-- !!!!!!!! REQUIRED !!!!!!!!!!
-- !!!!!!!! REQUIRED !!!!!!!!!!
-- to define a longer component name than the library name
-------------------------------------
function GetPrettyName(props)
  return "Brain Tabs V"..PluginInfo.Version;
end


-------------------------------------
-- NEW NEW NEW NEW NEW NEW NEW 7.0
-- !!!!!!!! OPTIONAL !!!!!!!!!!
-- !!!!!!!! OPTIONAL !!!!!!!!!!
-- Define tabs and names
-- shows up when you open the control panel of the plugin
-- controls are mated to the tab name
-------------------------------------
function GetTabs()
	tabs = {}
	table.insert( tabs, { name = "tab 1"})
	table.insert( tabs, { name = "tab 2"})
	table.insert( tabs, { name = "tab 3"})
	return tabs
end

-------------------------------------
-- !!!!!!!! REQUIRED !!!!!!!!!!
-- !!!!!!!! REQUIRED !!!!!!!!!!
--Change block color:
-------------------------------------
function GetColor(props)
  --  array of three hex values: { 0xRed, 0xGreen, 0xBlue }
  return blockCol;
end

-------------------------------------
-- !!!!!!!! REQUIRED !!!!!!!!!!
-- !!!!!!!! REQUIRED !!!!!!!!!!
--Plugin Properties
-- These show up in designer in the properties pane of the plugin
-------------------------------------
function GetProperties()
  props = {};
  table.insert( props, {
    Name = "Awesomeness", Type = "integer", Min = 0, Max = 11, Value = 10,
  });
  return props;
end

-------------------------------------
-- !!!!!!!! REQUIRED !!!!!!!!!!
-- !!!!!!!! REQUIRED !!!!!!!!!!
--Create the controls
-- These are similar to Scriptable Controls controls
-------------------------------------
function GetControls(props)
  ctrls = {};

  -- TEXT INPUT BOX
  table.insert( ctrls,
	{
	Name = "Control_1_Name",
    ControlType = "Text",
    Count = 1,
    PinStyle = "None",
    UserPin = false
	});

  -- KNOB 
  table.insert(ctrls,{
    Name = "Awesome Level",
    ControlType = "Knob",
    ControlUnit = "Integer",
    Min = 0,
    Max = 11,
    Count = 1,
    PinStyle = "None",
    UserPin = false
  });

  -- BUTTON
  table.insert(ctrls,{
    Name = "Release Awesome",
    ControlType = "Button",
    ButtonType = "Momentary",
    Count = 1,
    PinStyle = "None",
    UserPin = false
  });

  return ctrls;
end

-------------------------------------
-- !!!!!!!! OPTIONAL !!!!!!!!!!
-- !!!!!!!! OPTIONAL !!!!!!!!!!
-- Layout the controls
-------------------------------------
function GetControlLayout(props)
  layout = {};
  graphics = {};

  local cellSize = {82, 16};
  local containerPosition = {0,0};
  local containerPadding = {10,20};
  local containerColour = {0x86, 0x0f, 0x0f};
  local numberCellsInContainer = {3,4};
  local containerSize = {(cellSize[1]*numberCellsInContainer[1]) + (containerPadding[1] * 2),
  (cellSize[2]*numberCellsInContainer[2]) + containerPadding[2] + 10};

  local contentAnchor = {containerPosition[1] + containerPadding[1],
                         containerPosition[2] + containerPadding[2]};
  local channelsContainerYposition = containerPosition[2] + containerSize[2];

  -- GET THE PAGE INDEX THAT IS BEING ASKED FOR
  local page_index = props["page_index"].Value;
	
	if(page_index == 0) then
  	-- IF FIRST TAB
		table.insert( graphics, {
	    Type = "GroupBox",
	    Text = "Page 1",
	    HTextAlign = "Left",
	    StrokeWidth = 1,
	    CornerRadius = 2,
	    Fill = {0xFF, 0xFF, 0x00},
	    Position = containerPosition,
	    Size = containerSize,
	  });

	  table.insert( graphics, {
	    Type = "Label",
	    Text = "PAGE 0:",
	    HTextAlign = "Right",
	    TextSize = 12,
	    Color = { 0xc2, 0x88, 0xfe },
	    Position = contentAnchor,
	    Size = {cellSize[1], cellSize[2]},
	  });

	  layout["Control_1_NameXXX"] = {
	    Style = "Text",
	    Position = {contentAnchor[1] + cellSize[1], contentAnchor[2]},
	    Size = {cellSize[1]*2, cellSize[2]},
	    HTextAlign = "Left",
	    TextFontSize = 10,
	  };
	elseif (page_index == 1) then
  	-- IF SECOND TAB  
		table.insert( graphics, {
	    Type = "GroupBox",
	    Text = "Page 2",
	    HTextAlign = "Left",
	    StrokeWidth = 1,
	    CornerRadius = 2,
	    Fill = containerColour,
	    Position = containerPosition,
	    Size = containerSize,
	  });

	  table.insert( graphics, {
	    Type = "Label",
	    Text = "Page 2",
	    HTextAlign = "Right",
	    TextSize = 12,
	    Color = { 0xc2, 0x88, 0xfe },
	    Position = contentAnchor,
	    Size = {cellSize[1], cellSize[2]},
	  });

	  layout["Awesome Level"] = {
	    Style = "Knob",
	    Position = {contentAnchor[1] + cellSize[1], contentAnchor[2]},
	    Size = {cellSize[1]*2, cellSize[2]},
	    HTextAlign = "Left",
	    TextFontSize = 10,
	  };	  
	end
  return layout, graphics;
end

-- ################################
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- !!!!!!!! END REQUIRED !!!!!!!!!!
-- ################################


-------------------------------------
--Start of runtime Lua code
-------------------------------------
if (Controls) then
  -------------------------------------
  --Begin
  -------------------------------------
  print("Starting..");

  -- do plugin stuff (running on core)

  print("Started");
end
-------------------------------------
--END of runtime Lua code
-------------------------------------
