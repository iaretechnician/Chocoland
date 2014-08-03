fnc_number={
    /*[1234567, 1, 0, true] call CBA_fnc_formatNumber;        // => "1,234,567" */


private ["_integerPart", "_string", "_numIntegerDigits", "_decimalPoint",
	"_thousandsSeparator", "_basePlaces"];
        
_number =_this select 0;
_integerWidth=1;
_decimalPlaces=0;
_separateThousands=true;
_decimalPoint = ".";
_thousandsSeparator = ".";
_integerPart=0;
_basePlaces="";
_digit=0;
// Start by working out how to display the integer part of the number.

	_integerPart = round (abs _number);

_string = "";
_numIntegerDigits = 0;
while {_integerPart > 0} do
{
	if ((_numIntegerDigits > 0) and ((_numIntegerDigits mod 3) == 0) and _separateThousands) then
	{
		_string = _thousandsSeparator + _string;
	};

	_string =  (str (_integerPart mod 10)) + _string;
	_numIntegerDigits = _numIntegerDigits + 1;

	_integerPart = floor (_integerPart / 10);
};

// Add decimal digits, if necessary.
if (_decimalPlaces > 0) then
{
	private ["_digit", "_multiplier", "_i"];

	_string = _string + _decimalPoint;

	_multiplier = 10;

	for "_i" from 1 to _decimalPlaces do
	{
		_digit = floor ((_number * _multiplier) mod 10);

		// If the digit has become infintesimal, pad to the end with zeroes.
		if (not (finite _digit)) exitWith
		{
			private "_j";

			for "_j" from _i to _decimalPlaces do
			{
				_string = _string + "0";
			};
		};

		_string = _string + (str _digit);

		_multiplier = _multiplier * 10;
	};
};
_string; // Return.
};
 
