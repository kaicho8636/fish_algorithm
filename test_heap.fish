source algorithm.fish

set test_list (jot -r 10)
echo (heap_sort $test_list)

for n in 1000 2000 4000 8000
	echo n=$n
	set test_list (jot -r $n 1 $n)
	time heap_sort $test_list>/dev/null
end
