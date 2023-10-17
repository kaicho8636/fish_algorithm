source algorithm.fish

echo 線形探索
for i in (seq 5)
	set n (math 10^$i)
	set list (seq $n)
	echo n=10^$i
	time linear_search $n $list>/dev/null
end

echo 二分探索
for i in (seq 5)
	set n (math 10^$i)
	set list (seq $n)
	echo n=10^$i 
	time binary_search $n $list>/dev/null
end
