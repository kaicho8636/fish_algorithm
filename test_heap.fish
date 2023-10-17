source algorithm.fish

for i in (seq 10)
	set --append test_list (random)
end
echo $test_list
echo (heap_sort $test_list)

for n in 100 200 400 800
	echo n=$n
	set test_list (jot -r $n)
	time heap_sort $test_list>/dev/null
end
