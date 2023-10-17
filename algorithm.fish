# `source algorithm.fish` to load functions

function linear_search
	set value $argv[1]
	set list $argv[2..]
	for i in (seq (count $list))
		if test $value = $list[$i]
			echo $i
			return
		end
	end
	echo 0
	return 1
end

function binary_search
    set value $argv[1]
    set list $argv[2..]
	set min 1
	set max (count $list)
    while test $min -le $max
		set mid (math floor \($min+$max\)/2)
		if test $list[$mid] -gt $value
			set max (math $mid-1)
		else if test $list[$mid] -lt $value
			set min (math $mid+1)
		else
			echo $mid
			return
		end
	end
	echo 0
	return 1
end

function swap
	set x $argv[1]
	set y $argv[2]
	set list $argv[3..]
	set tmp $list[$x]
	set list[$x] $list[$y]
	set list[$y] $tmp
	for item in $list
		echo $item
	end
end

function insert
	set value $argv[1]
	set heap $argv[2..]
	set --append heap $value
	set i (count $heap)
	while test $i -gt 1
		set parent (math floor $i/2)
		if test $heap[$i] -lt $heap[$parent]
			set heap (swap $i $parent $heap)
		else
			break
		end
		set i $parent
	end
	for item in $heap
		echo $item
	end
end

function deletemin
	set heap $argv
	set heap[1] $heap[-1]
	set --erase heap[-1]
	set i 1
	set left 2
	set right 3
	while set --query heap[$left]
		if not set --query heap[$right]
			set min $left
		else if test $heap[$left] -lt $heap[$right]
			set min $left
		else
			set min $right
		end
		if test $heap[$i] -gt $heap[$min]
			set heap (swap $i $min $heap)
		else
			break
		end
		set i $min
		set left (math "2*$i")
		set right (math "2*$i+1")
	end
	for item in $heap
		echo $item
	end
end
