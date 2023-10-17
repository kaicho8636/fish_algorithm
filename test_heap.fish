source algorithm.fish

for i in (seq 10)
	set --append test_list (random)
end
echo $test_list
echo (heap_sort $test_list)

for n in 1000 2000 4000 8000
	for i in (seq $n)
		set --append test_list (random)
	end
	echo n=$n
	time heap_sort $test_list>/dev/null
end
