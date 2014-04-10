if(!X_Server) exitWith {};

while {true} do
{
   sleep 5;
   [] execVM "server\spawning\spawningMoney.sqf";
   [] execVM "server\spawning\spawningObjects.sqf";
   [] execVM "server\spawning\spawningVehicles.sqf";
  sleep 20;  
      
};