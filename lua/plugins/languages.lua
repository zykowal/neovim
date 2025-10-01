-- Remove this if you want to enable all languages
if true then
	return {}
end

-- Import all language configurations
return {
	-- Import golang configuration
	require("lang.golang"),
	-- Import C/C++ configuration
	require("lang.cpp"),
	-- Import Rust configuration
	require("lang.rust"),
	-- Import python configuration
	require("lang.python"),
}
